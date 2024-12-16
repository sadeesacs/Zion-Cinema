<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Controller.ADMoviesServlet.MovieInfo"%>
<%@page import="model.Movie"%>
<%@page import="model.Genre"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Movies</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="StyleSheet10.css" />
    </head>
    <body>
        
        <!-- Header of the Admin Dashboard -->
        <header>
            <div class="header">
                <div class="Logo"><img src="images/logo.png" /></div>
                <div class="zion-cinema"><a href="HomePage.html">Zion Cinema</a></div>

                <div class="search-bar">
                    <span>Search here.....</span>
                    <span style="left: 210px;color:white"><i class="bi bi-search"></i></span>
                </div>

                <div class="AD-username">Emma Watson</div>
                <div class="word-admin">Admin</div>

                <div class="user-icon" ><i class="bi bi-person-fill"></i></div>

                <img src="images/notificationicon.png" class="notification-icon">
                <img src="images/messagesicon.png" class="message-icon">
            </div>
        </header>
        
        
        <!-- Navigational Panel of the Admin Dashboard -->
        <div class="navigation">
            <ul class="nav-menu">
                <a href="AD-Dashbaord.jsp">
                    <li class="nav-item">
                        <img src="images/Dashboardicon.png"></img>
                        <span>Dashboard</span>
                    </li>
                </a>
                <a href="AD-Movies.jsp">
                    <li class="nav-item active">
                        <img src="images/Movieicon.png"></img>
                        <span>Movies</span>
                    </li>
                </a>
                <a href="AD-FoodMenu.jsp">
                    <li class="nav-item ">
                        <img src="images/Foodicon.png"></img>
                        <span>Food Menu</span>
                    </li>
                </a>
                <a href="AD-Transactions.jsp">
                    <li class="nav-item">
                        <img src="images/Billicon.png"></img>
                        <span>Transactions</span>
                    </li>
                </a>
                <a href="AD-CustomerInquiries.jsp">
                    <li class="nav-item ">
                        <img src="images/Inquiryicon.png"></img>
                        <span>Customer Inquiries</span>
                    </li>
                </a>
                <a href="AD-Customers.jsp">
                    <li class="nav-item ">
                        <img src="images/customericon.png"></img>
                        <span>Customers</span>
                    </li>
                </a>
                <li class="nav-item">
                    <img src="images/Settingicon.png"></img>
                    <span>Settings</span>
                </li>
            </ul>
            <button class="logout">
                <img src="images/Logouticon.png"></img>
                <span>Logout</span>
            </button>
        </div>
        
        
        <div class="middle-container">

            <div class="product-cat">Movies</div>

            <button class="add-item" style="font-size: 15px" onclick="showSlider()">
                <i class="bi bi-plus-circle"></i>
                <p>Add Movie</p>
            </button>

            <div class="header-container" style="top:60px;">
                <span class="header-top" style="margin-left:20px">Movie ID</span>
                <span class="header-top" style="margin-left:150px">Movie Name</span>
                <div class="header-top" style="margin-left:580px">Genre</div>
                <div class="header-top" style="margin-left:720px">Duration</div>
                <div class="header-top" style="margin-left:870px">Action</div>                
            </div>
                
            <div class="content-container" style="margin-top:150px;height: 70%">
                <%
                    List<MovieInfo> movies = (List<MovieInfo>) request.getAttribute("movies");
                    if (movies != null) {
                        for (MovieInfo mi : movies) {
                            Movie mv = mi.getMovie();
                            String fGenre = mi.getFirstGenre();
                %>
                <div class="movie">
                    <p class="movie-id"><%= mv.getMovieId()%></p>
                    <p class="movie-name"><%= mv.getName() %></p>
                    <p class="movie-genre"><%= fGenre %></p>
                    <p class="movie-duration"><%= mv.getDuration()%></p>
                    <div class="movie-actions">
                        <div class="view"><a href="ADMoviesServlet?action=view&movieId=<%=mv.getMovieId()%>"><i class="bi bi-eye-fill"></i></a></div>
                        <div class="edit"><a href="ADMoviesServlet?action=editForm&movieId=<%=mv.getMovieId()%>"><i class="bi bi-pencil-fill"></i></a></div>
                        <div class="delete"><a href="ADMoviesServlet?action=delete&movieId=<%=mv.getMovieId()%>" onclick="return confirm('Are you sure you want to delete this movie?')"><i class="bi bi-trash3-fill"></i></a></div>
                    </div> 
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
        
        <%
            List<Genre> allGenres = (List<Genre>) request.getAttribute("allGenres");
            boolean edit = request.getAttribute("edit") != null;
            boolean view = request.getAttribute("view") != null;

            Movie editMovie = (Movie) request.getAttribute("editMovie");
            List<String> editMovieGenres = (List<String>) request.getAttribute("editMovieGenres");
            if (editMovieGenres == null) editMovieGenres = java.util.Collections.emptyList();

            Movie viewMovie = (Movie) request.getAttribute("viewMovie");
            List<String> viewGenres = (List<String>) request.getAttribute("movieGenres");
            if (viewGenres == null) viewGenres = java.util.Collections.emptyList();
        %>

        <!--Add Item Slider-->
        <div class="movie-slider" id="addMovieSlider">
            <div class="movie-slider-container">
                <div class="movie-slider-header">
                    <div class="movie-slider-title">Add Movie Details</div>
                    <img class="close-movie-slider" src="images/Cancelslide.png" onclick="hideSlider()" />
                    <div class="movie-slider-hline">
                        <hr size="2" color="#F5C51B" />
                    </div>
                </div>

                <!-- Add Movie Form -->
                <div class="movie-slider-form">
                    <form action="ADMoviesServlet?action=add" method="post" enctype="multipart/form-data">
                        <div class="movie-form">
                            
                            <div class="movie-form-row" style="margin-top: 20px;">
                                <label class="movie-form-label">Movie Name</label>
                                <input class="form-m-name" type="text" name="movieName" required/>
                            </div>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Description</label>
                                <textarea class="form-m-desc" name="movieDesc" required></textarea>
                            </div>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Duration</label>
                                <input class="form-m-duration" type="text" name="movieDuration" required/>
                            </div>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Year</label>
                                <input class="form-m-year" type="text" name="movieYear" required/>
                            </div>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Rating</label>
                                <input class="form-m-rating" type="text" name="movieRating" required/>
                            </div>
                            <%
                                for (int i = 1; i <= 4; i++) {
                            %>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Genre 0<%=i%></label>
                                <div class="genre-select">
                                    <select name="movieGenre<%=i%>">
                                        <option value="">--Select--</option>
                                        <%
                                            if (allGenres != null) {
                                                for (Genre g : allGenres) {
                                        %>
                                        <option value="<%=g.getName()%>"><%=g.getName()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <%
                                }
                            %>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Show Status</label>
                                <div class="status-select">
                                    <select name="movieStatus">
                                        <option value="Now Showing">Now Showing</option>
                                        <option value="Coming Soon">Coming Soon</option>
                                    </select>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Trailer</label>
                                <input class="form-m-trailer" type="text" name="movieTrailer" required/>
                            </div>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Banner</label>
                                <div class="m-image-select">
                                    <label class="custom-file-upload">
                                        <img src="images/Upload.png" class="m-img-3" id="bannerPreview"/>
                                        <input type="file" name="movieBanner" accept=".jpeg,.webp,.png" required onchange="previewImage(event,'bannerPreview')"/>
                                    </label>
                                    <div class="div-20">Drag your images here</div>
                                    <div class="div-21">(Only *.jpeg, *.webp and *.png images will be accepted)</div>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Poster</label>
                                <div class="m-image-select">
                                    <label class="custom-file-upload">
                                        <img src="images/Upload.png" class="m-img-3" id="posterPreview"/>
                                        <input type="file" name="moviePoster" accept=".jpeg,.webp,.png" required onchange="previewImage(event,'posterPreview')"/>
                                    </label>
                                    <div class="div-20">Drag your images here</div>
                                    <div class="div-21">(Only *.jpeg, *.webp and *.png images will be accepted)</div>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Carousal</label>
                                <div class="m-image-select">
                                    <label class="custom-file-upload">
                                        <img src="images/Upload.png" class="m-img-3" id="carousalPreview"/>
                                        <input type="file" name="movieCarousal" accept=".jpeg,.webp,.png" onchange="previewImage(event,'carousalPreview')"/>
                                    </label>
                                    <div class="div-20">Drag your images here</div>
                                    <div class="div-21">(Only *.jpeg, *.webp and *.png images will be accepted)</div>
                                </div>
                            </div>
                        </div>
                    
                        <div class="movie-slider-footer">
                            <button class="movie-btn-cancel" type="button" onclick="hideSlider()">Cancel</button>
                            <button class="movie-btn-save" type="submit">Add Movie</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!--Edit Item Slider-->
        <% if (edit && editMovie != null) { %>
        <div class="movie-slider active" id="editMovieSlider">
        <% } else { %>
        <div class="movie-slider" id="editMovieSlider">
        <% } %>
            <div class="movie-slider-container">
                <div class="movie-slider-header">
                    <div class="movie-slider-title">Edit Movie Details</div>
                    <img class="close-movie-slider" src="images/Cancelslide.png" onclick="hideEditSlider()" />
                    <div class="movie-slider-hline">
                        <hr size="2" color="#F5C51B" />
                    </div>
                </div>

                <div class="movie-slider-form">
                    <form action="ADMoviesServlet?action=update" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="movieId" value="<%=editMovie!=null?editMovie.getMovieId():""%>"/>
                        <div class="movie-form">
                            <div class="movie-form-row" style="margin-top: 20px;">
                                <label class="movie-form-label">Movie Name</label>
                                <input class="form-m-name" type="text" name="movieName" value="<%=editMovie!=null?editMovie.getName():""%>" required/>
                            </div>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Description</label>
                                <textarea class="form-m-desc" name="movieDesc" required><%=editMovie!=null?editMovie.getDescription():""%></textarea>
                            </div>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Duration</label>
                                <input class="form-m-duration" type="text" name="movieDuration" value="<%=editMovie!=null?editMovie.getDuration():""%>" required/>
                            </div>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Year</label>
                                <input class="form-m-year" type="text" name="movieYear" value="<%=editMovie!=null?editMovie.getYear():""%>" required/>
                            </div>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Rating</label>
                                <input class="form-m-rating" type="text" name="movieRating" value="<%=editMovie!=null?editMovie.getRating():""%>" required/>
                            </div>
                            <%
                                for (int i = 1; i <= 4; i++) {
                                    String currentGenre = "";
                                    if (i <= editMovieGenres.size()) {
                                        currentGenre = editMovieGenres.get(i-1);
                                    }
                            %>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Genre 0<%=i%></label>
                                <div class="genre-select">
                                    <select name="movieGenre<%=i%>">
                                        <option value="">--Select--</option>
                                        <%
                                            if (allGenres != null) {
                                                for (Genre g : allGenres) {
                                                    String sel = g.getName().equals(currentGenre)?"selected":"";
                                        %>
                                        <option value="<%=g.getName()%>" <%=sel%>><%=g.getName()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <%
                                }
                            %>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Show Status</label>
                                <div class="status-select">
                                    <select name="movieStatus">
                                        <option value="Now Showing" <%= (editMovie!=null && "Now Showing".equals(editMovie.getStatus()))?"selected":""%>>Now Showing</option>
                                        <option value="Coming Soon" <%= (editMovie!=null && "Coming Soon".equals(editMovie.getStatus()))?"selected":""%>>Coming Soon</option>
                                    </select>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Trailer</label>
                                <input class="form-m-trailer" type="text" name="movieTrailer" value="<%=editMovie!=null?editMovie.getTrailer():""%>" required/>
                            </div>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Banner</label>
                                <div class="image-select-banner">
                                    <label class="file-upload-banner">
                                        <img src="<%=editMovie!=null?editMovie.getBanner():"images/Upload.png"%>" class="img-preview-banner" id="editBannerPreview"/>
                                        <input type="file" name="movieBanner" accept=".jpeg,.webp,.png" style="display:none;" onchange="previewImage(event,'editBannerPreview')"/>
                                    </label>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Poster</label>
                                <div class="image-select-banner">
                                    <label class="file-upload-banner">
                                        <img src="<%=editMovie!=null?editMovie.getPoster():"images/Upload.png"%>" class="img-preview-banner" id="editPosterPreview"/>
                                        <input type="file" name="moviePoster" accept=".jpeg,.webp,.png" style="display:none;" onchange="previewImage(event,'editPosterPreview')"/>
                                    </label>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label class="movie-form-label">Movie Carousal</label>
                                <div class="image-select-banner">
                                    <label class="file-upload-banner">
                                        <img src="<%=editMovie!=null && editMovie.getCarousal()!=null?editMovie.getCarousal():"images/Upload.png"%>" class="img-preview-banner" id="editCarousalPreview"/>
                                        <input type="file" name="movieCarousal" accept=".jpeg,.webp,.png" style="display:none;" onchange="previewImage(event,'editCarousalPreview')"/>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="movie-slider-footer">
                            <button class="movie-btn-cancel" type="button" onclick="hideEditSlider()">Cancel</button>
                            <button class="movie-btn-save" type="submit">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!--View Item Slider-->
        <% if (view && viewMovie != null) { %>
        <div class="movie-slider active" id="reviewMovieslider">
        <% } else { %>
        <div class="movie-slider" id="reviewMovieslider">
        <% } %>
            <div class="movie-slider-container">
                <div class="movie-slider-header">
                    <div class="movie-slider-title">View Movie Details</div>
                    <img class="close-movie-slider" src="images/Cancelslide.png" onclick="hideReviewSlider()" />
                    <div class="movie-slider-hline">
                        <hr size="2" color="#F5C51B" />
                    </div>
                </div>

                <div class="movie-slider-form">
                    <div class="movie-form">
                        
                        <div class="movie-form-row" style="margin-top: 20px;">
                            <label class="movie-form-label">Movie Name</label>
                            <div class="view-m-name"><%=viewMovie!=null?viewMovie.getName():""%></div>
                        </div>
                        <div class="movie-form-row" style="margin-top: 20px;" >
                            <label class="movie-form-label">Movie Description</label>
                            <div class="view-m-desc"><%=viewMovie!=null?viewMovie.getDescription():""%></div>
                        </div>
                        <div class="movie-form-row">
                            <label class="movie-form-label">Movie Duration</label>
                            <div class="view-m-duration"><%=viewMovie!=null?viewMovie.getDuration():""%></div>
                        </div>
                        <div class="movie-form-row">
                            <label class="movie-form-label">Movie Year</label>
                            <div class="view-m-year"><%=viewMovie!=null?viewMovie.getYear():""%></div>
                        </div>
                        <div class="movie-form-row">
                            <label class="movie-form-label">Movie Rating</label>
                            <div class="view-m-rating"><%=viewMovie!=null?viewMovie.getRating():""%></div>
                        </div>
                        <%
                            for (int i = 0; i < 4; i++) {
                                String g = (i < viewGenres.size())?viewGenres.get(i):"";
                        %>
                        <div class="movie-form-row">
                            <label class="movie-form-label">Movie Genre 0<%=i+1%></label>
                            <div class="view-m-genre"><%=g%></div>
                        </div>
                        <% } %>
                        <div class="movie-form-row">
                            <label class="movie-form-label">Show Status</label>
                            <div class="view-m-status"><%=viewMovie!=null?viewMovie.getStatus():""%></div>
                        </div>
                        <div class="movie-form-row">
                            <label class="movie-form-label">Movie Trailer</label>
                            <div class="view-m-trailer"><%=viewMovie!=null?viewMovie.getTrailer():""%></div>
                        </div>
                        <div class="movie-form-row">
                            <label class="movie-form-label">Movie Banner</label>
                            <%
                                String bannerImg = (viewMovie!=null?viewMovie.getBanner():"");
                                if(bannerImg!=null && !bannerImg.isEmpty()) {
                            %>
                            <img src="<%=bannerImg%>" class="movie-display-image" style="width:300px;height:250px">
                            <% } %>
                        </div>
                        <div class="movie-form-row">
                            <label class="movie-form-label">Movie Poster</label>
                            <%
                                String posterImg = (viewMovie!=null?viewMovie.getPoster():"");
                                if(posterImg!=null && !posterImg.isEmpty()) {
                            %>
                            <img src="<%=posterImg%>" class="movie-display-image">
                            <% } %>
                        </div>
                        <div class="movie-form-row">
                            <label class="movie-form-label" >Movie Carousal</label>
                            <%
                                String carouselImg = (viewMovie!=null && viewMovie.getCarousal()!=null)?viewMovie.getCarousal():"";
                                if(!carouselImg.isEmpty()){
                            %>
                            <img src="<%=carouselImg%>" class="movie-display-image">
                            <% } else { %>
                            <div class="view-m-genre">No Carousal</div>
                            <% } %>
                        </div>
                    </div>
                </div>

                <div class="movie-slider-footer">
                    <button class="movie-btn-save" style="left:20px" onclick="hideReviewSlider()">Done</button>
                </div>
            </div>
        </div>


        <script>
            function showSlider() {
                document.getElementById('addMovieSlider').classList.add('active');
            }

            function hideSlider() {
                document.getElementById('addMovieSlider').classList.remove('active');
            }

            function hideEditSlider() {
                document.getElementById('editMovieSlider').classList.remove('active');
            }

            function hideReviewSlider() {
                document.getElementById('reviewMovieslider').classList.remove('active');
            }

            function previewImage(event, imgId) {
                var output = document.getElementById(imgId);
                output.src = URL.createObjectURL(event.target.files[0]);
                output.onload = function() {
                    URL.revokeObjectURL(output.src); // free memory
                }
            }

            <% if (edit) { %>
            document.getElementById('editMovieSlider').classList.add('active');
            <% } %>

            <% if (view) { %>
            document.getElementById('reviewMovieslider').classList.add('active');
            <% } %>
        </script>
    </body>
</html>
