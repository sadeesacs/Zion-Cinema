
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Check Out</title>
    <style type="text/css">
        body {
            background-color: black;
            color: white;
            font-family:lora;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        table {
            border: 3px solid #F5C51B;
            border-collapse: collapse;
            padding: 10px;
            background-color: black;
        }

        table td {
            padding: 15px;
        }

        input[type="text"] {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            padding: 10px 20px;
            color: black;
            background-color: #F5C51B;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: gold;
        }

        h1 {
            color: white;
        }
    </style>
</head>
<body>
<div align="center">
    <h1>Check Out</h1>
    <br/>
    <form action="authorize_payment" method="post">

        <table>
            <tr>
                <td>Movie Name:</td>
                <td><input type="text" name="movieName" value="${sessionScope.movieName}" readonly /></td>
            </tr>
            <tr>
                <td>Total Food Price:</td>
                <td><input type="text" name="food" value="${sessionScope.totalFoodPrice}" readonly /></td>
            </tr>
            <tr>
                <td>Total Ticket Price:</td>
                <td><input type="text" name="tickets" value="${sessionScope.totalTicketPrice}" readonly /></td>
            </tr>
            <tr>
                <td>VAT (3%):</td>
                <td><input type="text" name="tax" value="${sessionScope.tax}" readonly /></td>
            </tr>
            <tr>
                <td>Total Amount:</td>
                <td><input type="text" name="total" value="${sessionScope.totalAmount}" readonly /></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Checkout" />
                </td>
            </tr>
        </table>
    </form>
</div>
</body>

</html>
