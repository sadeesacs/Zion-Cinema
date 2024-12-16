
package Controller;

import DAO.MovieDAO;
import DAO.MovieGenreDAO;
import DAO.GenreDAO;
import model.Movie;
import model.Genre;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "ADMoviesServlet", urlPatterns = {"/ADMoviesServlet"})
@MultipartConfig
public class ADMoviesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String action = request.getParameter("action");
        if (action == null) action = "list";

        MovieDAO movieDAO = new MovieDAO();
        MovieGenreDAO movieGenreDAO = new MovieGenreDAO();
        GenreDAO genreDAO = new GenreDAO();

        switch (action) {
            case "list":
                // List all movies
                List<Movie> movies = movieDAO.getAllMovies();
                // For each movie, get the first genre
                List<MovieInfo> movieInfos = new ArrayList<>();
                for (Movie m : movies) {
                    String firstGenre = movieGenreDAO.getFirstGenreForMovie(m.getMovieId());
                    movieInfos.add(new MovieInfo(m, firstGenre));
                }

                // Get all genres to populate add/edit forms
                List<Genre> allGenres = genreDAO.getAllGenres();

                request.setAttribute("movies", movieInfos);
                request.setAttribute("allGenres", allGenres);
                request.getRequestDispatcher("AD-Movies.jsp").forward(request, response);
                break;

            case "view":
                int viewId = Integer.parseInt(request.getParameter("movieId"));
                Movie viewMovie = movieDAO.getMovieById(viewId);
                if (viewMovie == null) {
                    response.sendRedirect("ADMoviesServlet");
                    return;
                }
                List<String> movieGenres = movieGenreDAO.getAllGenresForMovie(viewId);
                request.setAttribute("viewMovie", viewMovie);
                request.setAttribute("movieGenres", movieGenres);
                request.setAttribute("view", true); // indicate we want to show view slider
                // After setting these attributes, forward to JSP and use JS to show review slider
                List<Movie> moviesForView = movieDAO.getAllMovies(); // to display the list as well
                List<MovieInfo> movieInfosForView = new ArrayList<>();
                for (Movie m : moviesForView) {
                    String fg = movieGenreDAO.getFirstGenreForMovie(m.getMovieId());
                    movieInfosForView.add(new MovieInfo(m, fg));
                }
                List<Genre> allGenresForView = genreDAO.getAllGenres();
                request.setAttribute("movies", movieInfosForView);
                request.setAttribute("allGenres", allGenresForView);

                request.getRequestDispatcher("AD-Movies.jsp").forward(request, response);
                break;

            case "editForm":
                int editId = Integer.parseInt(request.getParameter("movieId"));
                Movie editMovie = movieDAO.getMovieById(editId);
                if (editMovie == null) {
                    response.sendRedirect("ADMoviesServlet");
                    return;
                }
                List<String> editMovieGenres = movieGenreDAO.getAllGenresForMovie(editId);

                List<Movie> moviesForEdit = movieDAO.getAllMovies(); 
                List<MovieInfo> movieInfosForEdit = new ArrayList<>();
                for (Movie m : moviesForEdit) {
                    String fg = movieGenreDAO.getFirstGenreForMovie(m.getMovieId());
                    movieInfosForEdit.add(new MovieInfo(m, fg));
                }
                List<Genre> allGenresForEdit = genreDAO.getAllGenres();
                
                request.setAttribute("movies", movieInfosForEdit);
                request.setAttribute("allGenres", allGenresForEdit);

                request.setAttribute("editMovie", editMovie);
                request.setAttribute("editMovieGenres", editMovieGenres);
                request.setAttribute("edit", true); // show edit slider
                request.getRequestDispatcher("AD-Movies.jsp").forward(request, response);
                break;

            case "delete":
                int delId = Integer.parseInt(request.getParameter("movieId"));
                // Delete from moviegenre first
                movieGenreDAO.deleteByMovieId(delId);
                // Delete movie
                movieDAO.deleteMovie(delId);
                response.sendRedirect("ADMoviesServlet");
                break;

            default:
                response.sendRedirect("ADMoviesServlet");
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action == null) action = "list";

        MovieDAO movieDAO = new MovieDAO();
        MovieGenreDAO movieGenreDAO = new MovieGenreDAO();
        GenreDAO genreDAO = new GenreDAO();

        request.setCharacterEncoding("UTF-8");

        switch (action) {
            case "add":
                Movie newMovie = buildMovieFromRequest(request);
                int newMovieId = movieDAO.insertMovie(newMovie);
                if (newMovieId > 0) {
                    // Insert genres
                    insertGenres(request, genreDAO, movieGenreDAO, newMovieId);
                }
                response.sendRedirect("ADMoviesServlet");
                break;

            case "update":
                int movieId = Integer.parseInt(request.getParameter("movieId"));
                Movie updatedMovie = buildMovieFromRequest(request);
                updatedMovie.setMovieId(movieId);
                // Update movie
                if (movieDAO.updateMovie(updatedMovie)) {
                    // Delete old genres and insert new ones
                    movieGenreDAO.deleteByMovieId(movieId);
                    insertGenres(request, genreDAO, movieGenreDAO, movieId);
                }
                response.sendRedirect("ADMoviesServlet");
                break;

            default:
                response.sendRedirect("ADMoviesServlet");
        }
    }

    private Movie buildMovieFromRequest(HttpServletRequest request) throws IOException, ServletException {
        String name = request.getParameter("movieName");
        String desc = request.getParameter("movieDesc");
        String duration = request.getParameter("movieDuration");
        String year = request.getParameter("movieYear");
        String rating = request.getParameter("movieRating");
        String status = request.getParameter("movieStatus");
        String trailer = request.getParameter("movieTrailer");

        // Handle files
        String bannerPath = handleFileUpload(request, "movieBanner", "images/banner/");
        String posterPath = handleFileUpload(request, "moviePoster", "images/poster/");
        String carousalPath = handleFileUpload(request, "movieCarousal", "images/Carousal/"); 

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

    private String handleFileUpload(HttpServletRequest request, String paramName, String folderPath) throws IOException, ServletException {
        Part filePart = request.getPart(paramName);
        if (filePart == null || filePart.getSize() == 0) {
            // optional file
            if ("images/Carousal/".equals(folderPath)) {
                return null; // carousal optional
            } else {
                return null;
            }
        }

        String fileName = extractFileName(filePart);
        // Save file in the given folder
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + folderPath;

        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }

        File fileToSave = new File(fileSaveDir, fileName);
        filePart.write(fileToSave.getAbsolutePath());

        // Store as images/banner/filename
        return folderPath + fileName;
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String token : contentDisp.split(";")) {
            if (token.trim().startsWith("filename")) {
                String fName = token.substring(token.indexOf('=') + 2, token.length()-1);
                return fName; 
            }
        }
        return null;
    }

    private void insertGenres(HttpServletRequest request, GenreDAO genreDAO, MovieGenreDAO movieGenreDAO, int movieId) {
        for (int i = 1; i <= 4; i++) {
            String genreName = request.getParameter("movieGenre" + i);
            if (genreName != null && !genreName.isEmpty()) {
                int gId = genreDAO.getGenreIdByName(genreName);
                if (gId > 0) {
                    movieGenreDAO.insertMovieGenre(movieId, gId);
                }
            }
        }
    }

    // helper class to hold movies and genre
    public static class MovieInfo {
        Movie movie;
        String firstGenre;
        public MovieInfo(Movie movie, String firstGenre) {
            this.movie = movie;
            this.firstGenre = firstGenre;
        }
        public Movie getMovie() { return movie; }
        public String getFirstGenre() { return firstGenre; }
    }
}

