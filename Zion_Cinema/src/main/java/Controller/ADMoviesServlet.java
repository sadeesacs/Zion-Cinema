package Controller;

// Importing required DAO and model classes
import DAO.MovieDAO;
import DAO.MovieGenreDAO;
import DAO.GenreDAO;
import model.Movie;
import model.Genre;

// Importing necessary Java classes
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

// Importing Servlet API for handling HTTP requests and file uploads
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Define a Servlet named "ADMoviesServlet" with the specified URL pattern
@WebServlet(name = "ADMoviesServlet", urlPatterns = {"/ADMoviesServlet"})
@MultipartConfig // Annotation to support file uploads
public class ADMoviesServlet extends HttpServlet {

    // Handle HTTP GET requests
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Determine the action to perform; default is "list"
        String action = request.getParameter("action");
        if (action == null) action = "list";

        // Initialize DAOs for handling movies and genres
        MovieDAO movieDAO = new MovieDAO();
        MovieGenreDAO movieGenreDAO = new MovieGenreDAO();
        GenreDAO genreDAO = new GenreDAO();

        // Perform actions based on the "action" parameter
        switch (action) {
            case "list":
                // Fetch all movies
                List<Movie> movies = movieDAO.getAllMovies();

                // Create a list of MovieInfo objects that include the movie and its first genre
                List<MovieInfo> movieInfos = new ArrayList<>();
                for (Movie m : movies) {
                    String firstGenre = movieGenreDAO.getFirstGenreForMovie(m.getMovieId());
                    movieInfos.add(new MovieInfo(m, firstGenre));
                }

                // Fetch all genres for displaying in add/edit forms
                List<Genre> allGenres = genreDAO.getAllGenres();

                // Set attributes for the request and forward to the JSP page
                request.setAttribute("movies", movieInfos);
                request.setAttribute("allGenres", allGenres);
                request.getRequestDispatcher("AD-Movies.jsp").forward(request, response);
                break;

            case "view":
                // Fetch and display details of a specific movie
                int viewId = Integer.parseInt(request.getParameter("movieId"));
                Movie viewMovie = movieDAO.getMovieById(viewId);
                if (viewMovie == null) {
                    // Redirect if the movie doesn't exist
                    response.sendRedirect("ADMoviesServlet");
                    return;
                }
                // Fetch genres associated with the movie
                List<String> movieGenres = movieGenreDAO.getAllGenresForMovie(viewId);

                // Set attributes for movie details
                request.setAttribute("viewMovie", viewMovie);
                request.setAttribute("movieGenres", movieGenres);
                request.setAttribute("view", true); // To indicate viewing mode

                // Also prepare the movie list and genres for display on the page
                List<Movie> moviesForView = movieDAO.getAllMovies();
                List<MovieInfo> movieInfosForView = new ArrayList<>();
                for (Movie m : moviesForView) {
                    String fg = movieGenreDAO.getFirstGenreForMovie(m.getMovieId());
                    movieInfosForView.add(new MovieInfo(m, fg));
                }
                List<Genre> allGenresForView = genreDAO.getAllGenres();
                request.setAttribute("movies", movieInfosForView);
                request.setAttribute("allGenres", allGenresForView);

                // Forward to JSP for rendering
                request.getRequestDispatcher("AD-Movies.jsp").forward(request, response);
                break;

            case "editForm":
                // Fetch details of a movie for editing
                int editId = Integer.parseInt(request.getParameter("movieId"));
                Movie editMovie = movieDAO.getMovieById(editId);
                if (editMovie == null) {
                    response.sendRedirect("ADMoviesServlet");
                    return;
                }
                // Fetch associated genres
                List<String> editMovieGenres = movieGenreDAO.getAllGenresForMovie(editId);

                // Prepare movie and genre lists
                List<Movie> moviesForEdit = movieDAO.getAllMovies();
                List<MovieInfo> movieInfosForEdit = new ArrayList<>();
                for (Movie m : moviesForEdit) {
                    String fg = movieGenreDAO.getFirstGenreForMovie(m.getMovieId());
                    movieInfosForEdit.add(new MovieInfo(m, fg));
                }
                List<Genre> allGenresForEdit = genreDAO.getAllGenres();

                // Set attributes for editing mode
                request.setAttribute("movies", movieInfosForEdit);
                request.setAttribute("allGenres", allGenresForEdit);
                request.setAttribute("editMovie", editMovie);
                request.setAttribute("editMovieGenres", editMovieGenres);
                request.setAttribute("edit", true); // To indicate edit mode
                request.getRequestDispatcher("AD-Movies.jsp").forward(request, response);
                break;

            case "delete":
                // Delete a movie and its associated genres
                int delId = Integer.parseInt(request.getParameter("movieId"));
                movieGenreDAO.deleteByMovieId(delId); // Delete genres first
                movieDAO.deleteMovie(delId); // Then delete the movie
                response.sendRedirect("ADMoviesServlet"); // Redirect to the list
                break;

            default:
                // Redirect to default action (list) for unknown actions
                response.sendRedirect("ADMoviesServlet");
        }
    }

    // Handle HTTP POST requests
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        MovieDAO movieDAO = new MovieDAO();
        MovieGenreDAO movieGenreDAO = new MovieGenreDAO();
        GenreDAO genreDAO = new GenreDAO();

        request.setCharacterEncoding("UTF-8"); // Ensure proper character encoding

        switch (action) {
            case "add":
                // Add a new movie
                Movie newMovie = buildMovieFromRequest(request);
                int newMovieId = movieDAO.insertMovie(newMovie); // Insert movie and get its ID
                if (newMovieId > 0) {
                    insertGenres(request, genreDAO, movieGenreDAO, newMovieId); // Associate genres
                }
                response.sendRedirect("ADMoviesServlet"); // Redirect to the list
                break;

            case "update":
                // Update an existing movie
                int movieId = Integer.parseInt(request.getParameter("movieId"));
                Movie updatedMovie = buildMovieFromRequest(request);
                updatedMovie.setMovieId(movieId); // Set the movie ID
                if (movieDAO.updateMovie(updatedMovie)) {
                    movieGenreDAO.deleteByMovieId(movieId); // Remove old genres
                    insertGenres(request, genreDAO, movieGenreDAO, movieId); // Add new genres
                }
                response.sendRedirect("ADMoviesServlet");
                break;

            default:
                response.sendRedirect("ADMoviesServlet");
        }
    }

    // Helper method to build a Movie object from request parameters
    private Movie buildMovieFromRequest(HttpServletRequest request) throws IOException, ServletException {
        String name = request.getParameter("movieName");
        String desc = request.getParameter("movieDesc");
        String duration = request.getParameter("movieDuration");
        String year = request.getParameter("movieYear");
        String rating = request.getParameter("movieRating");
        String status = request.getParameter("movieStatus");
        String trailer = request.getParameter("movieTrailer");

        // Handle file uploads for movie media
        String bannerPath = handleFileUpload(request, "movieBanner", "images/banner/");
        String posterPath = handleFileUpload(request, "moviePoster", "images/poster/");
        String carousalPath = handleFileUpload(request, "movieCarousal", "images/Carousal/");

        // Create and return a new Movie object
        Movie movie = new Movie();
        movie.setName(name);
        movie.setDescription(desc);
        movie.setDuration(duration);
        movie.setYear(year);
        movie.setRating(rating);
        movie.setStatus(status);
        movie.setTrailer(trailer);
        movie.setBanner(bannerPath);
        movie.setPoster(posterPath);
        movie.setCarousal(carousalPath);
        return movie;
    }

    // Helper method for handling file uploads
    private String handleFileUpload(HttpServletRequest request, String paramName, String folderPath) throws IOException, ServletException {
        Part filePart = request.getPart(paramName); // Retrieve the uploaded file
        if (filePart == null || filePart.getSize() == 0) {
            return null; // Optional file
        }

        // Extract the file name and save it to the specified folder
        String fileName = extractFileName(filePart);
        String appPath = request.getServletContext().getRealPath(""); // Base application path
        String savePath = appPath + File.separator + folderPath;

        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs(); // Create the directory if it doesn't exist
        }

        File fileToSave = new File(fileSaveDir, fileName);
        filePart.write(fileToSave.getAbsolutePath()); // Save the file

        return folderPath + fileName; // Return the relative file path
    }

    // Helper method to extract file name from the uploaded file part
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String token : contentDisp.split(";")) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 2, token.length()-1); // Extract file name
            }
        }
        return null;
    }

    // Helper method to associate genres with a movie
    private void insertGenres(HttpServletRequest request, GenreDAO genreDAO, MovieGenreDAO movieGenreDAO, int movieId) {
        for (int i = 1; i <= 4; i++) { // Handle up to 4 genres
            String genreName = request.getParameter("movieGenre" + i);
            if (genreName != null && !genreName.isEmpty()) {
                int gId = genreDAO.getGenreIdByName(genreName); // Get genre ID by name
                if (gId > 0) {
                    movieGenreDAO.insertMovieGenre(movieId, gId); // Insert genre-movie association
                }
            }
        }
    }

    // Helper class to hold movie and its first genre for display purposes
    public static class MovieInfo {
        Movie movie; // Movie object
        String firstGenre; // First genre of the movie
        public MovieInfo(Movie movie, String firstGenre) {
            this.movie = movie;
            this.firstGenre = firstGenre;
        }
        public Movie getMovie() { return movie; }
        public String getFirstGenre() { return firstGenre; }
    }
}
