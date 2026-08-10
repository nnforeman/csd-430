<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.StateDAO" %>
<%@ page import="java.util.List" %>

<%
    /*
        Name: Natasha Foreman
        Course: CSD 430 - Server Side Development
        Date: 7/12/26
        Assignment: Modules 5.3 and 6.3 Project Part 1
        Purpose: Retrieves all values from the database and displays them in a dropdown menu.
    */

    StateDAO stateDAO = new StateDAO();
    List<Integer> stateIds = null;
    String errorMessage = null;

    try {
        stateIds = stateDAO.getAllStateIds();
    } catch (Exception exception) {
        errorMessage = exception.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select a State Record</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
<div class="container">

    <h1>Select a State Record</h1>

    <p class="description">
        Select a unique state record ID from the dropdown menu.
        The matching record will be retrieved from the CSD430 database.
    </p>

    <h2>Overall Data Description</h2>
    <p>
        The database contains travel information about states and locations.
    </p>

    <h2>Record Selection</h2>

    <% if (errorMessage == null) { %>

        <form action="stateDisplay.jsp" method="get">

            <label for="stateId">State Record ID:</label>

            <select id="stateId" name="stateId" required>
                <option value="">Select a record</option>

                <% for (Integer stateId : stateIds) { %>
                    <option value="<%= stateId %>">
                        <%= stateId %>
                    </option>
                <% } %>
            </select>

            <input type="submit" value="Display Record">

        </form>

    <% } else { %>

        <p class="error">
            The database records could not be loaded:
            <%= errorMessage %>
        </p>

    <% } %>

    <p>
        <a href="index.jsp">Return to Project Index</a>
    </p>

</div>
</body>
</html>