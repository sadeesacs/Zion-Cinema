package Db;

import java.sql.*;
public class dbcon {
    private static final String URL = "jdbc:mysql://localhost:3306/ZionCinema";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    private static Connection connection;

    public static Connection connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            Statement st = connection.createStatement();
            System.out.println("Connected to the database!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Failed to connect to the database!"+ e.getMessage());
        }
        return connection;
    }
}
