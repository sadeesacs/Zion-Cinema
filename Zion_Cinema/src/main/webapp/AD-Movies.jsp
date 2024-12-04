<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Movies</title>
        
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

            <button class="add-item" style="font-size: 15px">
                <button class="add-item" onclick="showSlider()">
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
                <div class="movie">
                    <p class="movie-id">0001</p>
                    <p class="movie-name">Pirates of the Caribbean: Dead Men Tell No Tales</p>
                    <p class="movie-genre">Adventure</p>
                    <p class="movie-duration">1 h 30 mints</p>
                    <div class="movie-actions">
                        <div class="view" onclick="showReviewSlider()"><i class="bi bi-eye-fill"></i></div>
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="movie">
                    <p class="movie-id">0001</p>
                    <p class="movie-name">Pirates of the Caribbean: Dead Men Tell No Tales</p>
                    <p class="movie-genre">Adventure</p>
                    <p class="movie-duration">1 h 30 mints</p>
                    <div class="movie-actions">
                        <div class="view" onclick="showReviewSlider()"><i class="bi bi-eye-fill"></i></div>
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="movie">
                    <p class="movie-id">0001</p>
                    <p class="movie-name">Pirates of the Caribbean: Dead Men Tell No Tales</p>
                    <p class="movie-genre">Adventure</p>
                    <p class="movie-duration">1 h 30 mints</p>
                    <div class="movie-actions">
                        <div class="view" onclick="showReviewSlider()"><i class="bi bi-eye-fill"></i></div>
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="movie">
                    <p class="movie-id">0001</p>
                    <p class="movie-name">Pirates of the Caribbean: Dead Men Tell No Tales</p>
                    <p class="movie-genre">Adventure</p>
                    <p class="movie-duration">1 h 30 mints</p>
                    <div class="movie-actions">
                        <div class="view" onclick="showReviewSlider()"><i class="bi bi-eye-fill"></i></div>
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="movie">
                    <p class="movie-id">0001</p>
                    <p class="movie-name">Pirates of the Caribbean: Dead Men Tell No Tales</p>
                    <p class="movie-genre">Adventure</p>
                    <p class="movie-duration">1 h 30 mints</p>
                    <div class="movie-actions">
                        <div class="view" onclick="showReviewSlider()"><i class="bi bi-eye-fill"></i></div>
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="movie">
                    <p class="movie-id">0001</p>
                    <p class="movie-name">Pirates of the Caribbean: Dead Men Tell No Tales</p>
                    <p class="movie-genre">Adventure</p>
                    <p class="movie-duration">1 h 30 mints</p>
                    <div class="movie-actions">
                        <div class="view" onclick="showReviewSlider()"><i class="bi bi-eye-fill"></i></div>
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="movie">
                    <p class="movie-id">0001</p>
                    <p class="movie-name">Pirates of the Caribbean: Dead Men Tell No Tales</p>
                    <p class="movie-genre">Adventure</p>
                    <p class="movie-duration">1 h 30 mints</p>
                    <div class="movie-actions">
                        <div class="view" onclick="showReviewSlider()"><i class="bi bi-eye-fill"></i></div>
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="movie">
                    <p class="movie-id">0001</p>
                    <p class="movie-name">Pirates of the Caribbean: Dead Men Tell No Tales</p>
                    <p class="movie-genre">Adventure</p>
                    <p class="movie-duration">1 h 30 mints</p>
                    <div class="movie-actions">
                        <div class="view" onclick="showReviewSlider()"><i class="bi bi-eye-fill"></i></div>
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="movie">
                    <p class="movie-id">0001</p>
                    <p class="movie-name">Pirates of the Caribbean: Dead Men Tell No Tales</p>
                    <p class="movie-genre">Adventure</p>
                    <p class="movie-duration">1 h 30 mints</p>
                    <div class="movie-actions">
                        <div class="view" onclick="showReviewSlider()"><i class="bi bi-eye-fill"></i></div>
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="movie">
                    <p class="movie-id">0001</p>
                    <p class="movie-name">Pirates of the Caribbean: Dead Men Tell No Tales</p>
                    <p class="movie-genre">Adventure</p>
                    <p class="movie-duration">1 h 30 mints</p>
                    <div class="movie-actions">
                        <div class="view" onclick="showReviewSlider()"><i class="bi bi-eye-fill"></i></div>
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="movie">
                    <p class="movie-id">0001</p>
                    <p class="movie-name">Pirates of the Caribbean: Dead Men Tell No Tales</p>
                    <p class="movie-genre">Adventure</p>
                    <p class="movie-duration">1 h 30 mints</p>
                    <div class="movie-actions">
                        <div class="view" onclick="showReviewSlider()"><i class="bi bi-eye-fill"></i></div>
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="movie">
                    <p class="movie-id">0001</p>
                    <p class="movie-name">Pirates of the Caribbean: Dead Men Tell No Tales</p>
                    <p class="movie-genre">Adventure</p>
                    <p class="movie-duration">1 h 30 mints</p>
                    <div class="movie-actions">
                        <div class="view" onclick="showReviewSlider()"><i class="bi bi-eye-fill"></i></div>
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="movie">
                    <p class="movie-id">0001</p>
                    <p class="movie-name">Pirates of the Caribbean: Dead Men Tell No Tales</p>
                    <p class="movie-genre">Adventure</p>
                    <p class="movie-duration">1 h 30 mints</p>
                    <div class="movie-actions">
                        <div class="view" onclick="showReviewSlider()"><i class="bi bi-eye-fill"></i></div>
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
            </div>
        </div>
        
        


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

                <!-- Scrollable Form Section -->
                <div class="movie-slider-form">
                    <form>
                        <div class="movie-form">
                            
                            <div class="movie-form-row" style="margin-top: 20px;">
                                <label for="movie-name" class="movie-form-label">Movie Name</label>
                                <input class="form-m-name" type="text" id="movie-name" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-desc" class="movie-form-label">Movie Description</label>
                                <textarea class="form-m-desc" id="movie-desc"></textarea>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-duration" class="movie-form-label">Movie Duration</label>
                                <input class="form-m-duration" type="text" id="movie-duration" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-year" class="movie-form-label">Movie Year</label>
                                <input class="form-m-year" type="text" id="movie-year" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-rating" class="movie-form-label">Movie Rating</label>
                                <input class="form-m-rating" type="text" id="movie-rating" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 01</label>
                                <input class="form-m-genre" type="text" id="movie-genre1" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 02</label>
                                <input class="form-m-genre" type="text" id="movie-genre2" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 03</label>
                                <input class="form-m-genre" type="text" id="movie-genre3" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 04</label>
                                <input class="form-m-genre" type="text" id="movie-genre4" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-status" class="movie-form-label">Show Status</label>
                                <div class="status-select">
                                    <select>
                                        <option value="NowShowing">Now Showing</option>
                                        <option value="Comming Soon">Coming Soon</option>
                                    </select>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-trailer" class="movie-form-label">Movie Trailer</label>
                                <input class="form-m-trailer" type="text" id="movie-trailer" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label">Movie Banner</label>
                                <div class="m-image-select">
                                    <label class="custom-file-upload">
                                        <img src="images/Upload.png" class="m-img-3" />
                                        <input type="file" accept=".jpeg, .webp, .png" />
                                    </label>
                                    <div class="div-20">Drag your images here</div>
                                    <div class="div-21">(Only *.jpeg, *.webp and *.png images will be accepted)</div>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label">Movie Poster</label>
                                <div class="m-image-select">
                                    <label class="custom-file-upload">
                                        <img src="images/Upload.png" class="m-img-3" />
                                        <input type="file" accept=".jpeg, .webp, .png" />
                                    </label>
                                    <div class="div-20">Drag your images here</div>
                                    <div class="div-21">(Only *.jpeg, *.webp and *.png images will be accepted)</div>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label" >Movie Carousal</label>
                                <div class="m-image-select">
                                    <label class="custom-file-upload">
                                        <img src="images/Upload.png" class="m-img-3" />
                                        <input type="file" accept=".jpeg, .webp, .png" />
                                    </label>
                                    <div class="div-20">Drag your images here</div>
                                    <div class="div-21">(Only *.jpeg, *.webp and *.png images will be accepted)</div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- Fixed Footer -->
                <div class="movie-slider-footer">
                    
                    <button class="movie-btn-cancel" type="button" onclick="hideSlider()">Cancel</button>
                    <button class="movie-btn-save" type="submit">Add Movie</button>
                </div>
            </div>
        </div>

        
        
        
        
        <!--Edit Item Slider-->
         <div class="movie-slider" id="editMovieSlider">
            <div class="movie-slider-container">
                <div class="movie-slider-header">
                    <div class="movie-slider-title">Edit Movie Details</div>
                    <img class="close-movie-slider" src="images/Cancelslide.png" onclick="hideEditSlider()" />
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
                                <input class="form-m-name" type="text" id="movie-name" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-desc" class="movie-form-label">Movie Description</label>
                                <textarea class="form-m-desc" id="movie-desc"></textarea>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-duration" class="movie-form-label">Movie Duration</label>
                                <input class="form-m-duration" type="text" id="movie-duration" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-year" class="movie-form-label">Movie Year</label>
                                <input class="form-m-year" type="text" id="movie-year" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-rating" class="movie-form-label">Movie Rating</label>
                                <input class="form-m-rating" type="text" id="movie-rating" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 01</label>
                                <input class="form-m-genre" type="text" id="movie-genre1" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 02</label>
                                <input class="form-m-genre" type="text" id="movie-genre2" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 03</label>
                                <input class="form-m-genre" type="text" id="movie-genre3" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-genre" class="movie-form-label">Movie Genre 04</label>
                                <input class="form-m-genre" type="text" id="movie-genre4" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-status" class="movie-form-label">Show Status</label>
                                <div class="status-select">
                                    <select>
                                        <option value="NowShowing">Now Showing</option>
                                        <option value="Comming Soon">Coming Soon</option>
                                    </select>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-trailer" class="movie-form-label">Movie Trailer</label>
                                <input class="form-m-trailer" type="text" id="movie-trailer" />
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label">Movie Banner</label>
                                <div class="image-select-banner">
                                    <label class="file-upload-banner">
                                        <img src="images/pic2.png" class="img-preview-banner" />
                                        <input type="file" id="movie-Banner" accept=".jpeg, .webp, .png" style="display: none;" />
                                    </label>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label">Movie Poster</label>
                                <div class="image-select-banner">
                                    <label class="file-upload-banner">
                                        <img src="images/pic1.png" class="img-preview-banner" />
                                        <input type="file" id="movie-Banner" accept=".jpeg, .webp, .png" style="display: none;" />
                                    </label>
                                </div>
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label" >Movie Carousal</label>
                                <div class="image-select-banner">
                                    <label class="file-upload-banner">
                                        <img src="images/banner1.jpg" class="img-preview-banner" />
                                        <input type="file" id="movie-Banner" accept=".jpeg, .webp, .png" style="display: none;" />
                                    </label>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- Fixed Footer -->
                <div class="movie-slider-footer">
                    
                    <button class="movie-btn-cancel" type="button" onclick="hideEditSlider()">Cancel</button>
                    <button class="movie-btn-save" type="submit">Save Changes</button>
                </div>
            </div>
        </div>

        
        
        
        
        
        <!--View Item Slider-->
         <div class="movie-slider" id="reviewMovieslider">
            <div class="movie-slider-container">
                <div class="movie-slider-header">
                    <div class="movie-slider-title">View Movie Details</div>
                    <img class="close-movie-slider" src="images/Cancelslide.png" onclick="hideReviewSlider()" />
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
                                <img src="images/pic2.png" class="movie-display-image" style="width:300px;height:250px">
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label">Movie Poster</label>
                                <img src="images/pic1.png" class="movie-display-image">
                            </div>
                            <div class="movie-form-row">
                                <label for="movie-Banner" class="movie-form-label" >Movie Carousal</label>
                                <img src="images/banner1.jpg" class="movie-display-image">
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

            function showEditSlider() {
                document.getElementById('editMovieSlider').classList.add('active');
            }

            function hideEditSlider() {
                document.getElementById('editMovieSlider').classList.remove('active');
            }

            function showReviewSlider() {
                document.getElementById('reviewMovieslider').classList.add('active');
            }

            function hideReviewSlider() {
                document.getElementById('reviewMovieslider').classList.remove('active');
            }
        </script>
        
        
    </body>
</html>
