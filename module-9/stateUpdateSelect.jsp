<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="database.StateDAO" %>
<%@ page import="java.util.List" %>

<%
    /*
     * Name: Natasha Foreman
     * Course: CSD 430 - Server Side Development
     * Assignment: Module 8 Project Part 3
     * Purpose: Displays all state primary-key values in a dropdown.
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
    <title>Select State Record to Update</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>

<div class="container">

    <h1>Update a State Travel Record</h1>

    <p class="description">
        Select a state record ID from the dropdown menu.
        The selected record will be loaded into a form where the existing values can be updated.
    </p>

    <h2>Overall Data Description</h2>

    <p>
        The database contains travel records describing states and locations that have been visited, including travel category, visit type, and the reason each trip was enjoyed.
    </p>

    <h2>Select a Record</h2>

    <% if (errorMessage == null) { %>

        <form action="stateUpdateForm.jsp" method="post">

            <label for="stateId">
                State Record ID:
            </label>

            <select id="stateId"
                    name="stateId"
                    required>

                <option value="">
                    Select a record
                </option>

                <% for (Integer stateId : stateIds) { %>

                    <option value="<%= stateId %>">
                        <%= stateId %>
                    </option>

                <% } %>

            </select>

            <input type="submit"
                   value="Load Record">

        </form>

    <% } else { %>

        <p class="error">
            The database records could not be loaded:
            <%= errorMessage %>
        </p>

    <% } %>

    <p>
        <a href="index.jsp">
            Return to Project Index
        </a>
    </p>

</div>

</body>
</html>