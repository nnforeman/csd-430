package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * Name: Natasha Foreman
 * Course: CSD 430 - Server Side Development
 * Date: 7/26/26
 * Assignment: Modules 5.3, 6.3, and 7 Project Parts 1 and 2
 * Purpose: Creates JDBC connections to the CSD430 MySQL database.
 */
public final class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/CSD430?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USERNAME = "student1";
    private static final String PASSWORD = "pass";

    private DBConnection() {
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
}
