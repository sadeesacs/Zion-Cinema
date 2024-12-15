<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.ADMovieListDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="model.ADMovieList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Movies</title>
        <style>
            .icon-button {
                background: none; /* Removes the default background */
                border: none; /* Removes the default border */
                padding: 0; /* Removes default padding */
                margin: 0; /* Adjusts margin if needed */
                cursor: pointer; /* Makes it look clickable */
            }

            .icon-button {
                color: inherit;
            }
        </style>
        <link rel="stylesheet" href="StyleSheet10.css" />
        
    </head>
    <body>
        
        <!-- Header of the Admin ADDashboard -->
        <header>
            <div class="header">
                <div class="Logo"><img src="images/icons/logo.png" /></div>
                <div class="zion-cinema"><a href="HomePage.html">Zion Cinema</a></div>

                <div class="search-bar">
                    <span>Search here.....</span>
                        <span style="left: 210px;color:white"><i class="bi bi-search"></i></span>
                </div>
                <%
                    // Check if session exists and retrieve the username attribute
                    String username = (session != null) ? (String) session.getAttribute("username") : null;

                    if (username != null) {
                %>
                <div class="AD-username"><%= username %></div>
                <div class="word-admin">Admin</div>
                <%
                } else {
                %>
                <div class="AD-username">Session expired or not logged in.</div>
                <%
                    }
                %>
                <div class="user-icon" ><i class="bi bi-person-fill"></i></div>

                <img src="images/icons/notificationicon.png" class="notification-icon">
                <img src="images/icons/messagesicon.png" class="message-icon">
            </div>
        </header>
        
        
        
        <!-- Navigational Panel of the Admin ADDashboard -->
        <div class="navigation">
            <ul class="nav-menu">
                <a href="AD-Dashboard.jsp">
                    <li class="nav-item">
                        <img src="images/icons/Dashboardicon.png"></img>
                        <span>Dashboard</span>
                    </li>
                </a>
                <a href="AD-Movies.jsp">
                    <li class="nav-item active">
                        <img src="images/icons/Movieicon.png"></img>
                        <span>Movies</span>
                    </li>
                </a>
                <a href="AD-FoodMenu.jsp">
                    <li class="nav-item ">
                        <img src="images/icons/Foodicon.png"></img>
                        <span>Food Menu</span>
                    </li>
                </a>
                <a href="AD-Transactions.jsp">
                    <li class="nav-item">
                        <img src="images/icons/Billicon.png"></img>
                        <span>Transactions</span>
                    </li>
                </a>
                <a href="AD-CustomerInquiries.jsp">
                    <li class="nav-item ">
                        <img src="images/icons/Inquiryicon.png"></img>
                        <span>Customer Inquiries</span>
                    </li>
                </a>
                <a href="AD-Customers.jsp">
                    <li class="nav-item ">
                        <img src="images/icons/customericon.png"></img>
                        <span>Customers</span>
                    </li>
                </a>
                    <li class="nav-item">
                        <img src="images/icons/Settingicon.png"></img>
                        <span>Settings</span>
                    </li>
            </ul>
            <button class="logout">
                <img src="images/icons/Logouticon.png"></img>
                <span>Logout</span>
            </button>
        </div>
        
        
        <div class="middle-container">

            <div class="product-cat">Movies</div>

            <button class="add-item" style="font-size: 15px">
                <button class="add-item" onclick="showSlider()">
                    <i class="bi bi-plus-circle"></i>
                    <p>Add Movie</p>
            </button>

            <div class="header-container" style="top:60px;">
                <span class="header-top" style="margin-left:20px">Movie ID</span>
                <span class="header-top" style="margin-left:150px">Movie Name</span>
                <div class="header-top" style="margin-left:720px">Duration</div>
                <div class="header-top" style="margin-left:870px">Action</div>                
            </div>
                
            <div class="content-container" style="margin-top:150px;height: 70%">
                <%
                    // Fetching the list of Customer inquiries
                    List<ADMovieList> Movie = ADMovieListDAO.getAllMovies();
                    //Loop to display data
                    if (!Movie.isEmpty()) {
                        // data type,variable,array name
                        for (ADMovieList Movies : Movie) {
                %>
                <div class="movie">
                    <p class="movie-id"><%=Movies.getMovieID()%></p>
                    <p class="movie-name"><%=Movies.getMovieName()%></p>
                    <p class="movie-duration"><%=Movies.getDuration()%></p>
                    <div class="movie-actions">
<%--                        <div class="view" onclick="showReviewSlider()"><i class="bi bi-eye-fill"></i></div>--%>

                        <div class="edit" onclick="return editFormID('<%=Movies.getMovieID()%>')">
                            <i class="bi bi-pencil-fill"></i>
                        </div>


                        <form action="DeleteMovie" method="post">
                            <!-- Hidden input for foodID -->
                            <input type="hidden" name="MovieID" value="<%=Movies.getMovieID()%>" />
                            <button class="icon-button " type="submit" name="delete">
                                <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                            </button>
                        </form>

                    </div> 
                </div>
                <%
                    }
                }
                else{
                %>
                <p>
                    <span class="header-top" style="margin-left:500px"> No Movies on the List</span>
                </p>

                <%
                    }
                %>

            </div>
        </div>
        
        


        <!--Add Item Slider-->
         <div class="movie-slider" id="addMovieSlider">
            <div class="movie-slider-container">
                <div class="movie-slider-header">
                    <div class="movie-slider-title">Add Movie Details</div>
                    <img class="close-movie-slider" src="images/icons/Cancelslide.png" onclick="hideSlider2()" />
                    <div class="movie-slider-hline">
                        <hr size="2" color="#F5C51B" />
                    </div>
                </div>

                <!-- Scrollable Form Section -->
                <div class="movie-slider-form">
                    <form action="AddMovie" method="post" enctype="multipart/form-data">
                        <div class="movie-form">
                            
                            <div class="movie-form-row" style="margin-top: 20px;">
                                <label for="movie-name" class="movie-form-label">Movie Name</label>
                                <input class="form-m-name" name="name" type="text" id="movie-name" required />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-desc" class="movie-form-label">Movie Description</label>
                                <textarea class="form-m-desc" name="description" id="movie-desc" required></textarea>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-duration" class="movie-form-label">Movie Duration</label>
                                <input class="form-m-duration" name="duration" type="text" id="movie-duration" required />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-year" class="movie-form-label">Movie Year</label>
                                <input class="form-m-year" name="year" type="text" id="movie-year" required />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-rating" class="movie-form-label">Movie Rating</label>
                                <input class="form-m-rating" name="rating" type="text" id="movie-rating" required />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 01</label>
                                <div class="genre-select">
                                    <select name="genre1" >
                                        <option value="1">Action</option>
                                        <option value="2">Comedy</option>
                                        <option value="3">Drama</option>
                                        <option value="4">Horror</option>
                                        <option value="5">Romance</option>
                                        <option value="6">Sci-Fi</option>
                                        <option value="7">Adventure</option>
                                    </select>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 02</label>
                                <div class="genre-select">
                                    <select name="genre2" >
                                        <option value="1">Action</option>
                                        <option value="2">Comedy</option>
                                        <option value="3">Drama</option>
                                        <option value="4">Horror</option>
                                        <option value="5">Romance</option>
                                        <option value="6">Sci-Fi</option>
                                        <option value="7">Adventure</option>
                                    </select>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 03</label>
                                <div class="genre-select">
                                    <select name="genre3" >
                                        <option value="1">Action</option>
                                        <option value="2">Comedy</option>
                                        <option value="3">Drama</option>
                                        <option value="4">Horror</option>
                                        <option value="5">Romance</option>
                                        <option value="6">Sci-Fi</option>
                                        <option value="7">Adventure</option>
                                    </select>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 04</label>
                                <div class="genre-select">
                                    <select name="genre4" >
                                        <option value="1">Action</option>
                                        <option value="2">Comedy</option>
                                        <option value="3">Drama</option>
                                        <option value="4">Horror</option>
                                        <option value="5">Romance</option>
                                        <option value="6">Sci-Fi</option>
                                        <option value="7">Adventure</option>
                                    </select>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-status" class="movie-form-label">Show Status</label>
                                <div class="status-select">
                                    <select name="status" required>
                                        <option value="NowShowing">Now Showing</option>
                                        <option value="Comming Soon">Coming Soon</option>
                                    </select>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-trailer" class="movie-form-label">Movie Trailer</label>
                                <input class="form-m-trailer" type="text" name="trailer" id="movie-trailer"  required />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label">Movie Banner</label>
                                <div class="m-image-select">
                                    <label class="custom-file-upload">
                                        <img src="images/icons/Upload.png" class="m-img-3" />
                                        <input type="file" name="banner" accept=".jpeg, .webp, .png"  />
                                    </label>
                                    <div class="div-20">Drag your images/icons here</div>
                                    <div class="div-21">(Only *.jpeg, *.webp and *.png images/icons will be accepted)</div>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label">Movie Poster</label>
                                <div class="m-image-select">
                                    <label class="custom-file-upload">
                                        <img src="images/icons/Upload.png" class="m-img-3" />
                                        <input type="file" name="poster" accept=".jpeg, .webp, .png"  />
                                    </label>
                                    <div class="div-20">Drag your images/icons here</div>
                                    <div class="div-21">(Only *.jpeg, *.webp and *.png images/icons will be accepted)</div>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label" >Movie Carousal</label>
                                <div class="m-image-select">
                                    <label class="custom-file-upload">
                                        <img src="images/icons/Upload.png" class="m-img-3" />
                                        <input type="file" name="carousal" accept=".jpeg, .webp, .png"  />
                                    </label>
                                    <div class="div-20">Drag your images/icons here</div>
                                    <div class="div-21">(Only *.jpeg, *.webp and *.png images/icons will be accepted)</div>
                                </div>
                            </div>
                        </div>

                </div>

                <!-- Fixed Footer -->
                <div class="movie-slider-footer">
                    
                    <button class="movie-btn-cancel" type="button" onclick="hideSlider()">Cancel</button>
                    <button class="movie-btn-save" type="submit">Add Movie</button>
                </div>
                </form>
            </div>
        </div>

        
        
        
        
        <!--Edit Item Slider-->
         <div class="movie-slider" id="editMovieSlider">
            <div class="movie-slider-container">
                <div class="movie-slider-header">
                    <div class="movie-slider-title">Edit Movie Details</div>
                    <img class="close-movie-slider" src="images/icons/Cancelslide.png" onclick="hideEditSlider2()" />
                    <div class="movie-slider-hline">
                        <hr size="2" color="#F5C51B" />
                    </div>
                </div>

                <!-- Scrollable Form Section -->
                <div class="movie-slider-form">
                    <form id="editMovieForm" action="EditMovie" method="post" enctype="multipart/form-data">
                        <div class="movie-form">

                            <input type="hidden" name="MovieID" value="" />

                            <div class="movie-form-row" style="margin-top: 20px;">
                                <label for="movie-name" class="movie-form-label">Movie Name</label>
                                <input class="form-m-name" name="name" type="text" id="movie-name" required />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-desc" class="movie-form-label">Movie Description</label>
                                <textarea class="form-m-desc" name="description" id="movie-desc" required></textarea>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-duration" class="movie-form-label">Movie Duration</label>
                                <input class="form-m-duration" name="duration" type="text" id="movie-duration" required />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-year" class="movie-form-label">Movie Year</label>
                                <input class="form-m-year" name="year" type="text" id="movie-year" required />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-rating" class="movie-form-label">Movie Rating</label>
                                <input class="form-m-rating" name="rating" type="text" id="movie-rating" required />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 01</label>
                                <div class="genre-select">
                                    <select name="genre1">
                                        <option value="1">Action</option>
                                        <option value="2">Comedy</option>
                                        <option value="3">Drama</option>
                                        <option value="4">Horror</option>
                                        <option value="5">Romance</option>
                                        <option value="6">Sci-Fi</option>
                                        <option value="7">Adventure</option>
                                    </select>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 02</label>
                                <div class="genre-select">
                                    <select name="genre2" >
                                        <option value="1">Action</option>
                                        <option value="2">Comedy</option>
                                        <option value="3">Drama</option>
                                        <option value="4">Horror</option>
                                        <option value="5">Romance</option>
                                        <option value="6">Sci-Fi</option>
                                        <option value="7">Adventure</option>
                                    </select>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 03</label>
                                <div class="genre-select">
                                    <select name="genre3" >
                                        <option value="1">Action</option>
                                        <option value="2">Comedy</option>
                                        <option value="3">Drama</option>
                                        <option value="4">Horror</option>
                                        <option value="5">Romance</option>
                                        <option value="6">Sci-Fi</option>
                                        <option value="7">Adventure</option>
                                    </select>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 04</label>
                                <div class="genre-select">
                                    <select name="genre4" >
                                        <option value="1">Action</option>
                                        <option value="2">Comedy</option>
                                        <option value="3">Drama</option>
                                        <option value="4">Horror</option>
                                        <option value="5">Romance</option>
                                        <option value="6">Sci-Fi</option>
                                        <option value="7">Adventure</option>
                                    </select>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-status" class="movie-form-label">Show Status</label>
                                <div class="status-select">
                                    <select name="status" required>
                                        <option value="NowShowing">Now Showing</option>
                                        <option value="Comming Soon">Coming Soon</option>
                                    </select>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-trailer" class="movie-form-label">Movie Trailer</label>
                                <input class="form-m-trailer" type="text" name="trailer" id="movie-trailer"  required />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label">Movie Banner</label>
                                <div class="m-image-select">
                                    <label class="custom-file-upload">
                                        <img src="images/icons/Upload.png" class="m-img-3" />
                                        <input type="file" name="banner" accept=".jpeg, .webp, .png"  />
                                    </label>
                                    <div class="div-20">Drag your images/icons here</div>
                                    <div class="div-21">(Only *.jpeg, *.webp and *.png images/icons will be accepted)</div>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label">Movie Poster</label>
                                <div class="m-image-select">
                                    <label class="custom-file-upload">
                                        <img src="images/icons/Upload.png" class="m-img-3" />
                                        <input type="file" name="poster" accept=".jpeg, .webp, .png"  />
                                    </label>
                                    <div class="div-20">Drag your images/icons here</div>
                                    <div class="div-21">(Only *.jpeg, *.webp and *.png images/icons will be accepted)</div>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label" >Movie Carousal</label>
                                <div class="m-image-select">
                                    <label class="custom-file-upload">
                                        <img src="images/icons/Upload.png" class="m-img-3" />
                                        <input type="file" name="carousal" accept=".jpeg, .webp, .png"  />
                                    </label>
                                    <div class="div-20">Drag your images/icons here</div>
                                    <div class="div-21">(Only *.jpeg, *.webp and *.png images/icons will be accepted)</div>
                                </div>
                            </div>
                        </div>

                </div>

                <!-- Fixed Footer -->
                <div class="movie-slider-footer">
                    
                    <button class="movie-btn-cancel" type="button" onclick="hideEditSlider()">Cancel</button>
                    <button class="movie-btn-save" type="submit">Save Changes</button>
                </div>
            </div>
             </form>
        </div>

        
        
        
        
        
        <!--View Item Slider-->
         <div class="movie-slider" id="reviewMovieslider">
            <div class="movie-slider-container">
                <div class="movie-slider-header">
                    <div class="movie-slider-title">View Movie Details</div>
                    <img class="close-movie-slider" src="images/icons/Cancelslide.png" onclick="hideReviewSlider()" />
                    <div class="movie-slider-hline">
                        <hr size="2" color="#F5C51B" />
                    </div>
                </div>

                <!-- Scrollable Form Section -->
                <div class="movie-slider-form">
                    <form>
                        <div class="movie-form">
                            
                            <div class="movie-form-row" style="margin-top: 20px;">
                                <label for="movie-name" class="movie-form-label">Movie Name</label>
                                <div class="view-m-name">Pirates of the Caribbean : Dead Men Tell No Tales</div>
                            </div>
                            <div class="movie-form-row" style="margin-top: 20px;" >
                                <label for="movie-desc" class="movie-form-label" >Movie Description</label>
                                <div class="view-m-desc">Embark on the final adventure with Captain Jack Sparrow as he faces the vengeful Captain Salazar, who has escaped from the Devil’s Triangle with a deadly ghost crew. With the legendary Trident of Poseidon as the key to survival.</div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-duration" class="movie-form-label">Movie Duration</label>
                                <div class="view-m-duration">1h 30 mints</div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-year" class="movie-form-label">Movie Year</label>
                                <div class="view-m-year">2024</div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-rating" class="movie-form-label">Movie Rating</label>
                                <div class="view-m-rating">PG</div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 01</label>
                                <div class="view-m-genre">Adevnture</div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 02</label>
                                <div class="view-m-genre">Comedy</div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 03</label>
                                <div class="view-m-genre">Thriller</div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 04</label>
                                <div class="view-m-genre">Horror</div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-status" class="movie-form-label">Show Status</label>
                                <div class="view-m-status">Now Showing</div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-trailer" class="movie-form-label">Movie Trailer</label>
                                <div class="view-m-trailer">https://youtu.be/jiToByGtVuA?si=pkDYcYL4_j_OLd9f</div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label">Movie Banner</label>
                                <img src="images/icons/pic2.png" class="movie-display-image" style="width:300px;height:250px">
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label">Movie Poster</label>
                                <img src="images/icons/pic1.png" class="movie-display-image">
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label" >Movie Carousal</label>
                                <img src="images/icons/banner1.jpg" class="movie-display-image">
                            </div>
                        </div>
                    </form>
                </div>

                <!-- Fixed Footer -->
                <div class="movie-slider-footer">
                    
                    
                    <button class="movie-btn-save" style="left:20px" type="submit" onclick="hideReviewSlider()">Done</button>
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

            function hideSlider2() {
                document.getElementById('addMovieSlider').classList.remove('active');
                location.reload();
            }

            function showEditSlider() {
                document.getElementById('editMovieSlider').classList.add('active');
            }

            function hideEditSlider() {
                document.getElementById('editMovieSlider').classList.remove('active');
            }

            function hideEditSlider2() {
                document.getElementById('editMovieSlider').classList.remove('active');
                location.reload();
            }

            function showReviewSlider() {
                document.getElementById('reviewMovieslider').classList.add('active');
            }

            function hideReviewSlider() {
                document.getElementById('reviewMovieslider').classList.remove('active');
            }

            function editFormID(MovieID) {
                // Get references to elements
                const form = document.getElementById('editMovieForm');
                const editSlider = document.getElementById('editMovieSlider');
                const MovieIDInput = form.querySelector('[name="MovieID"]');

                // Ensure foodID is set in the hidden input
                if (MovieIDInput) {
                    MovieIDInput.value = MovieID;
                }

                // Explicitly show the edit slider
                if (editSlider) {
                    editSlider.classList.add('active');
                    console.log('Edit slider should be open now');
                } else {
                    console.error('Edit slider element not found');
                }

                // Prevent default form submission
                return false;
            }
        </script>
        
        
    </body>
</html>
