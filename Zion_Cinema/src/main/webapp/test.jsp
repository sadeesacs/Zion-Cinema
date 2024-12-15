<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.TemporaryMovie" %>
<%@ page import="model.TemporarySeat" %>

<!DOCTYPE html>
<html>
<head>
    <title>Test Data Display</title>
</head>
<body>
    <h1>Temporary Movies Data</h1>
    <table border="1">
        <tr>
            <th>Movie ID</th>
            <th>Showtime ID</th>
            <th>User ID</th>
        </tr>
        <%
            List<TemporaryMovie> movies = (List<TemporaryMovie>) request.getAttribute("movies");
            for (TemporaryMovie movie : movies) {
        %>
        <tr>
            <td><%= movie.getMovieId() %></td>
            <td><%= movie.getShowtimeId() %></td>
            <td><%= movie.getUserId() %></td>
        </tr>
        <% } %>
    </table>

    <h1>Temporary Seats Data</h1>
    <table border="1">
        <tr>
            <th>Seat ID</th>
            <th>Ticket Type</th>
            <th>Price</th>
            <th>Showtime ID</th>
            <th>User ID</th>
        </tr>
        <%
            List<TemporarySeat> seats = (List<TemporarySeat>) request.getAttribute("seats");
            for (TemporarySeat seat : seats) {
        %>
        <tr>
            <td><%= seat.getSeatId() %></td>
            <td><%= seat.getTicketType() %></td>
            <td><%= seat.getPrice() %></td>
            <td><%= seat.getShowtimeId() %></td>
            <td><%= seat.getUserId() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
