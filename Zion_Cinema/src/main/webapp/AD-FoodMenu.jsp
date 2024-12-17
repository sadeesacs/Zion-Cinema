<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.FoodItem"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Food Menu</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="StyleSheet10.css" />
    </head>
    <body>
        
        <!-- Header of the Admin Dashboard -->
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
        
        
        <!-- Navigational Panel of the Admin Dashboard -->
        <div class="navigation">
            <ul class="nav-menu">
                <a href="AD-Dashbaord.jsp">
                    <li class="nav-item">
                        <img src="images/icons/Dashboardicon.png"></img>
                        <span>Dashboard</span>
                    </li>
                </a>
                <a href="ADMoviesServlet">
                    <li class="nav-item">
                        <img src="images/icons/Movieicon.png"></img>
                        <span>Movies</span>
                    </li>
                </a>
                <a href="ADFoodMenuServlet">
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
                <a href="AD-Login.jsp" style="text-decoration: none;">
                    <li class="nav-item ">
                        <img src="images/icons/Logouticon.png"/>
                        <span>Logout</span>
                    </li>
                </a>
                <button>
        </div>
        
        
        <div class="middle-container">

            <div class="product-cat">Food Menu</div>

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
                    List<FoodItem> foods = (List<FoodItem>) request.getAttribute("foods");
                    boolean edit = request.getAttribute("edit") != null;
                    boolean view = request.getAttribute("view") != null;

                    FoodItem editItem = (FoodItem) request.getAttribute("editItem");
                    FoodItem viewItem = (FoodItem) request.getAttribute("viewItem");
                %>

                <%
                    if (foods != null) {
                        for (FoodItem fi : foods) {
                %>
                <div class="product">
                    <p class="product-id"><%=fi.getFoodId()%></p>
                    <p class="product-name"><%=fi.getName()%></p>
                    <p class="product-type"><%=fi.getType()%></p>
                    <p class="product-unitprice">LKR <%=fi.getPrice()%></p>
                    <div class="actions">
                        <div class="view"><a href="ADFoodMenuServlet?action=view&foodId=<%=fi.getFoodId()%>"><i class="bi bi-eye-fill"></i></a></div>
                        <div class="edit"><a href="ADFoodMenuServlet?action=editForm&foodId=<%=fi.getFoodId()%>"><i class="bi bi-pencil-fill"></i></a></div>
                        <div class="delete"><a href="ADFoodMenuServlet?action=delete&foodId=<%=fi.getFoodId()%>" onclick="return confirm('Are you sure you want to delete this item?')"><i class="bi bi-trash3-fill"></i></a></div>
                    </div> 
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
        
        
         <!-- Slider Add Item Form -->
        <div class="slider" id="addItemSlider">
           <div class="slider-container">
               <div class="slider-header">
                   <div class="Add">Add Food Item</div>
                   <img class="close" src="images/icons/Cancelslide.png" class="img" onclick="hideSlider()" />
                   <div class="slider-hline" >
                       <hr size="2" color="#F5C51B">
                   </div>
               </div>

           <form action="ADFoodMenuServlet?action=add" method="post" enctype="multipart/form-data">
               <div class="slider-form">
                   
                   <div class="form-label" style="margin-top: 30px;">
                       <label for="product-name">Food Item Name</label>
                   </div>
                   <input class="form-pname" type="text" name="foodName" required/>
                   
                   <div class="form-label" style="margin-top: 130px;">
                       <label for="product-category">Food Type</label>
                   </div>
                   <div class="cat-select">
                       <select name="foodType" required>
                           <option value="Popcorn">Popcorn</option>
                           <option value="Beverages">Beverages</option>
                           <option value="Coffee">Coffee</option>
                           <option value="Hot Kitchen">Hot Kitchen</option>
                           <option value="Juice">Juice</option>
                       </select>
                   </div>
                   
                   <div class="form-label" style="margin-top: 220px;">
                       <label for="product-price">Unit Price</label>
                   </div>
                   <input class="form-pprice" type="text" name="foodPrice" required/>
                   
                   <div class="form-label" style="margin-top: 330px;">
                       <label for="product-image">Food Item Image</label>
                   </div>
                   <div class="image-select">
                       <label class="custom-file-upload">
                           <img src="images/icons/Upload.png" class="img-3" id="addFoodPreview"/>
                           <input type="file" name="foodImage" accept=".jpeg,.webp,.png" required onchange="previewImage(event,'addFoodPreview')"/>
                       </label>
                       <div class="div-20">Drag your images here</div>
                       <div class="div-21">(Only *.jpeg, *.webp and *.png images will be accepted)</div>
                   </div>

                   <div class="slider-endhline"  >
                       <hr size="2" color="#F5C51B" >
                   </div>

                   <button class="sbut-cancel" type="button" onclick="hideSlider()">Cancel</button>
                   <button class="sbut-save" type="submit">Add Item</button>
               </div>
           </form>
       </div>


        <!-- Slider edit Item Form -->
        <% if (edit && editItem != null) { %>
        <div class="slider active" id="editItemSlider">
        <% } else { %>
        <div class="slider" id="editItemSlider">
        <% } %>
            
            <div class="slider-container">
                <div class="slider-header">
                    <div class="Add">Edit Food Item</div>
                    <img class="close" src="images/icons/Cancelslide.png" class="img" onclick="hideEditSlider()" />
                    <div class="slider-hline" >
                        <hr size="2" color="#F5C51B" >
                    </div>
                </div>

            <form action="ADFoodMenuServlet?action=update" method="post" enctype="multipart/form-data">
                <input type="hidden" name="foodId" value="<%=editItem!=null?editItem.getFoodId():""%>"/>
                <div class="slider-form">
                    
                    <div class="form-label" style="margin-top: 30px;">
                       <label for="product-name">Food Item Name</label>
                   </div>
                   <input class="form-pname" type="text" name="foodName" value="<%=editItem!=null?editItem.getName():""%>" required/>
                   
                   <div class="form-label" style="margin-top: 130px;">
                       <label for="product-category">Food Type</label>
                   </div>
                   <div class="cat-select">
                       <select name="foodType" required>
                           <option value="Popcorn" <%=editItem!=null && "Popcorn".equals(editItem.getType())?"selected":""%>>Popcorn</option>
                           <option value="Beverages" <%=editItem!=null && "Beverages".equals(editItem.getType())?"selected":""%>>Beverages</option>
                           <option value="Coffee" <%=editItem!=null && "Coffee".equals(editItem.getType())?"selected":""%>>Coffee</option>
                           <option value="Hot Kitchen" <%=editItem!=null && "Hot Kitchen".equals(editItem.getType())?"selected":""%>>Hot Kitchen</option>
                           <option value="Juice" <%=editItem!=null && "Juice".equals(editItem.getType())?"selected":""%>>Juice</option>
                       </select>
                   </div>
                   
                   <div class="form-label" style="margin-top: 220px;">
                       <label for="product-price">Unit Price</label>
                   </div>
                   <input class="form-pprice" type="text" name="foodPrice" value="<%=editItem!=null?editItem.getPrice():""%>" required/>
                   
                   <div class="form-label" style="margin-top: 330px;">
                       <label for="product-image">Food Item Image</label>
                   </div>
                   <div class="image-select">
                        <label class="custom-file-upload">
                            <img class="image-edit" src="<%=editItem!=null?editItem.getFoodImage():"images/Upload.png"%>" id="editFoodPreview"/>
                            <input type="file" name="foodImage" accept=".jpeg,.webp,.png" style="display: none;" onchange="previewImage(event,'editFoodPreview')"/>
                        </label>
                    </div>


                    <div class="slider-endhline"  >
                        <hr size="2" color="#F5C51B" >
                    </div>

                    <button class="sbut-cancel" type="button" onclick="hideEditSlider()">Cancel</button>
                    <button class="sbut-save" type="submit">Save Changes</button>
                </div>
            </form>
        </div>
            

        <!-- Slider review Item Form -->
        <% if (view && viewItem != null) { %>
        <div class="slider active" id="reviewItemsslider">
        <% } else { %>
        <div class="slider" id="reviewItemsslider">
        <% } %>
            <div class="slider-container">

                <div class="slider-header">
                        <div class="Add">View Food Item</div>
                    <img class="close" src="images/icons/Cancelslide.png" class="img" onclick="hideReviewSlider()" />
                    <div class="slider-hline" >
                        <hr size="2" color="#F5C51B" >
                    </div>
                </div>

                <div class="slider-form">
                    
                    <div class="form-label" style="margin-top: 30px;">
                       <label for="product-name">Food Item Name</label>
                   </div>
                   <div class="view-pname"><%=viewItem!=null?viewItem.getName():""%></div>
                   
                   <div class="form-label" style="margin-top: 130px;">
                       <label for="product-category">Food Type</label>
                   </div>
                   <div class="pcat-type"><%=viewItem!=null?viewItem.getType():""%></div>
                   
                   <div class="form-label" style="margin-top: 220px;">
                       <label for="product-price">Unit Price</label>
                   </div>
                   <div class="view-pprice">LKR <%=viewItem!=null?viewItem.getPrice():""%></div>
                   
                   <div class="form-label" style="margin-top: 330px;">
                       <label for="product-image">Food Item Image</label>
                   </div>
                   <%
                     String vImg = (viewItem!=null?viewItem.getFoodImage():"");
                     if(vImg!=null && !vImg.isEmpty()){
                   %>
                   <img class="image-display" src="<%=vImg%>">
                   <% } %>
                   
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

            function hideEditSlider() {
                document.getElementById('editItemSlider').classList.remove('active');
            }

            function hideReviewSlider() {
                document.getElementById('reviewItemsslider').classList.remove('active');
            }

            function previewImage(event, imgId) {
                var output = document.getElementById(imgId);
                output.src = URL.createObjectURL(event.target.files[0]);
                output.onload = function() {
                    URL.revokeObjectURL(output.src);
                }
            }

            <% if (edit) { %>
            document.getElementById('editItemSlider').classList.add('active');
            <% } %>

            <% if (view) { %>
            document.getElementById('reviewItemsslider').classList.add('active');
            <% } %>
        </script>
    </body>
</html>
