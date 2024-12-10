<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="StyleSheet5.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background: url('images/adminlogin-background.png') no-repeat center center fixed; background-size: cover;">
    <div class="container">
        <div class="Adlogin-container">
            <div class="EM-heading">Zion Cinema</div>
            <div class="ADlog-head-1" >Admin Login</div>
            <div class="ADlog-head-2">Please enter your details</div>
            <div class="ADlogin-form">
                <form>
                    <label for="username" >User Name</label>
                        <input type="text" id="username" name="username">

                        <label for="password">Password</label>
                        <label for="forgot-password"></label>
                        <input type="password" id="password" name="password">
                        <br>

                        <button type="login">Login</button>
                </form>
            </div>
        </div>
    </div>
    
</body>
</html>