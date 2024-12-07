<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.FoodMenuDAO" %>
<%@ page import="model.FoodMenu"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Food Menu</title>

        <link rel="stylesheet" href="StyleSheet10.css" />
    </head>
    <body>
        
        <!-- Header of the Admin Dashboard -->
        <header>
            <div class="header">
                <div class="Logo"><img src="images/icons/logo.png" /></div>
                <div class="zion-cinema"><a href="HomePage.jsp">Zion Cinema</a></div>

                <div class="search-bar">
                    <span>Search here.....</span>
                        <span style="left: 210px;color:white"><i class="bi bi-search"></i></span>
                </div>

                <div class="AD-username">Emma Watson</div>
                <div class="word-admin">Admin</div>

                <div class="user-icon" ><i class="bi bi-person-fill"></i></div>

                <img src="images/icons/notificationicon.png" class="notification-icon">
                <img src="images/icons/messagesicon.png" class="message-icon">
            </div>
        </header>
        
        
        
        <!-- Navigational Panel of the Admin Dashboard -->
        <div class="navigation">
            <ul class="nav-menu">
                <a href="AD-Dashbaord.jsp">
                    <li class="nav-item">
                        <img src="images/icons/Dashboardicon.png"></img>
                        <span>Dashboard</span>
                    </li>
                </a>
                <a href="AD-Movies.jsp">
                    <li class="nav-item">
                        <img src="images/icons/Movieicon.png"></img>
                        <span>Movies</span>
                    </li>
                </a>
                <a href="AD-FoodMenu.jsp">
                    <li class="nav-item active">
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

            <div class="product-cat">Food Menu</div>

            <button class="add-item">
                <button class="add-item" onclick="showSlider()">
                    <i class="bi bi-plus-circle"></i>
                    <p>Add Item</p>
            </button>

            <div class="header-container" style="top:60px;">
                <span class="header-top" style="margin-left:20px">Food ID</span>
                <span class="header-top" style="margin-left:170px">Food Name</span>
                <div class="header-top" style="margin-left:480px">Food Type</div>
                <div class="header-top" style="margin-left:670px">Unit Price</div>
                <div class="header-top" style="margin-left:870px">Action</div>                
            </div>


            <div class="content-container" style="margin-top:150px;height: 70%">


                <%
                    // Fetching the list of Customer inquiries
                    List<FoodMenu> Food = FoodMenuDAO.getAllInquiries();
                    //Loop to display data
                    if (!Food.isEmpty()) {
                        for (FoodMenu food : Food) {
                %>
                <div class="product">
                    <p class="product-id"><%=food.getFoodID() %></p>
                    <p class="product-name"><%=food.getName() %></p>
                    <p class="product-type"><%=food.getType() %></p>
                    <p class="product-unitprice">LKR <%=food.getPrice()%></p>
                    <div class="actions">
                        <div class="view" onclick="showReviewSlider()"><i class="bi bi-eye-fill"></i></div>
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <%
                    }
                      }
                        else{
                %>
                <p>
                    <span class="header-top" style="margin-left:500px"> No Food items found</span>
                </p>

                <%
                    }
                %>


        
         <!-- Slider Add Item Form -->
        <div class="slider" id="addItemSlider">
           <div class="slider-container">
               <div class="slider-header">
                   <div class="Add">Add Food Item</div>
                   <img class="close" srcset="images/icons/Cancelslide.png" class="img" onclick="hideSlider()" />
                   <div class="slider-hline" >
                       <hr size="2" color="#F5C51B">
                   </div>
               </div>

           <form>
               <div class="slider-form">
                   
                   <div class="form-label" style="margin-top: 30px;">
                       <label for="product-name">Food Item Name</label>
                   </div>
                   <input class="form-pname" type="text"/>
                   
                   <div class="form-label" style="margin-top: 130px;">
                       <label for="product-category">Food Type</label>
                   </div>
                   <div class="cat-select">
                       <select>
                           <option value="Popcorn">Popcorn</option>
                           <option value="Beverages">Beverages</option>
                           <option value="Coffee">Coffee</option>
                           <option value="Hot Kitchen">Hot Kitchen</option>
                           <option value="Snacks">Juice</option>
                       </select>
                   </div>
                   
                   <div class="form-label" style="margin-top: 220px;">
                       <label for="product-price">Unit Price</label>
                   </div>
                   <input class="form-price" type="text"/>
                   
                   <div class="form-label" style="margin-top: 330px;">
                       <label for="product-image">Food Item Image</label>
                   </div>
                   <div class="image-select">
                       <label class="custom-file-upload">
                           <img src="images/icons/Upload.png" class="img-3" />
                           <input type="file" accept=".jpeg, .webp, .png" />
                       </label>
                       <div class="div-20">Drag your images/icons here</div>
                       <div class="div-21">(Only *.jpeg, *.webp and *.png images/icons will be accepted)</div>
                   </div>

                   <div class="slider-endhline"  >
                       <hr size="2" color="#F5C51B" >
                   </div>

                   <button class="sbut-cancel">Cancel</button>
                   <button class="sbut-save">Add Item</button>
               </div>
           </form>
       </div>
            
            
        <!-- Slider edit Item Form -->
        <div class="slider" id="editItemSlider">
            
            <div class="slider-container">
                <div class="slider-header">
                    <div class="Add">Edit Food Item</div>
                    <img class="close" srcset="images/icons/Cancelslide.png" class="img" onclick="hideEditSlider()" />
                    <div class="slider-hline" >
                        <hr size="2" color="#F5C51B" >
                    </div>
                </div>

            <form>
                <div class="slider-form">
                    
                    <div class="form-label" style="margin-top: 30px;">
                       <label for="product-name">Food Item Name</label>
                   </div>
                   <input class="form-pname" type="text"/>
                   
                   <div class="form-label" style="margin-top: 130px;">
                       <label for="product-category">Food Type</label>
                   </div>
                   <div class="cat-select">
                       <select>
                           <option value="Popcorn">Popcorn</option>
                           <option value="Beverages">Beverages</option>
                           <option value="Coffee">Coffee</option>
                           <option value="Hot Kitchen">Hot Kitchen</option>
                           <option value="Snacks">Juice</option>
                       </select>
                   </div>
                   
                   <div class="form-label" style="margin-top: 220px;">
                       <label for="product-price">Unit Price</label>
                   </div>
                   <input class="form-pprice" type="text"/>
                   
                   <div class="form-label" style="margin-top: 330px;">
                       <label for="product-image">Food Item Image</label>
                   </div>
                   <div class="image-select">
                        <label class="custom-file-upload">
                            <img class="image-edit" src="images/icons/popcorn.png" />
                            <input type="file" id="edit-food-item-image" accept=".jpeg, .webp, .png" style="display: none;" />
                        </label>
                    </div>


                    <div class="slider-endhline"  >
                        <hr size="2" color="#F5C51B" >
                    </div>

                    <button class="sbut-cancel">Cancel</button>
                    <button class="sbut-save">Save Changes</button>
                </div>
            </form>
        </div>
            
            
        <!-- Slider review Item Form -->
        <div class="slider" id="reviewItemsslider">
            <div class="slider-container">

                <div class="slider-header">
                        <div class="Add">View Food Item</div>
                    <img class="close" srcset="images/icons/Cancelslide.png" class="img" onclick="hideReviewSlider()" />
                    <div class="slider-hline" >
                        <hr size="2" color="#F5C51B" >
                    </div>
                </div>

                <div class="slider-form">
                    
                    <div class="form-label" style="margin-top: 30px;">
                       <label for="product-name">Food Item Name</label>
                   </div>
                   <div class="view-pname">Sweet Popcron Large</div>
                   
                   <div class="form-label" style="margin-top: 130px;">
                       <label for="product-category">Food Type</label>
                   </div>
                   <div class="pcat-type">Popcorn</div>
                   
                   <div class="form-label" style="margin-top: 220px;">
                       <label for="product-price">Unit Price</label>
                   </div>
                   <div class="view-pprice">LKR 3500</div>
                   
                   <div class="form-label" style="margin-top: 330px;">
                       <label for="product-image">Food Item Image</label>
                   </div>
                   <img class="image-display" src="images/icons/popcorn.png">
                   
                    <div class="slider-endhline"  >
                        <hr size="2" color="#F5C51B" >
                    </div>

                    <button class="sbut-done" onclick="hideReviewSlider()">Done</button>
                </div>
        </div>


            
            
        <script>
            function showSlider() {
                document.getElementById('addItemSlider').classList.add('active');
            }

            function hideSlider() {
                document.getElementById('addItemSlider').classList.remove('active');
            }

            function showEditSlider() {
                document.getElementById('editItemSlider').classList.add('active');
            }

            function hideEditSlider() {
                document.getElementById('editItemSlider').classList.remove('active');
            }

            function showReviewSlider() {
                document.getElementById('reviewItemsslider').classList.add('active');
            }

            function hideReviewSlider() {
                document.getElementById('reviewItemsslider').classList.remove('active');
            }
        </script>
        
        
    </body>
</html>
