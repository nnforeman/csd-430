<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="beans.StateRecord" %>
<%@ page import="database.StateDAO" %>
<%@ page import="java.util.List" %>

<%
    /*
     * Name: Natasha Foreman
     * Course: CSD 430 - Server Side Development
     * Date: 8/9/26
     * Assignment: Module 9 Project Part 4
     * Purpose: Displays all state records and allows the user to delete a selected record.
     */

    StateDAO stateDAO = new StateDAO();

    String confirmationMessage = null;
    String errorMessage = null;

    String selectedValue =
            request.getParameter("stateId");

    if (selectedValue != null
            && !selectedValue.trim().isEmpty()) {

        try {

            int stateId =
                    Integer.parseInt(selectedValue);

            boolean deleted =
                    stateDAO.deleteState(stateId);

            if (deleted) {

                confirmationMessage =
                        "State record "
                        + stateId
                        + " was deleted successfully.";

            } else {

                errorMessage =
                        "The selected record could not be deleted.";
            }

        } catch (NumberFormatException exception) {

            errorMessage =
                    "The selected state ID is invalid.";

        } catch (Exception exception) {

            errorMessage =
                    exception.getMessage();
        }
    }

    List<StateRecord> stateRecords = null;
    List<Integer> stateIds = null;

    try {

        stateRecords =
                stateDAO.getAllStates();

        stateIds =
                stateDAO.getAllStateIds();

    } catch (Exception exception) {

        errorMessage =
                exception.getMessage();
    }
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Delete State Record</title>
    <link rel="stylesheet"
          type="text/css"
          href="style.css">
</head>

<body>

<div class="container">

    <h1>Delete a State Travel Record</h1>

    <p class="description">
        This page displays all records currently stored in the database. Select a State ID from the dropdown menu to delete that record.
    </p>

    <h2>Overall Data Description</h2>

    <p>
        Each record includes the state, location, travel category, visit type, and reason the trip was enjoyed.
    </p>

    <h2>Field Descriptions</h2>

    <ul>
        <li>
            <strong>State ID:</strong>
            Unique primary key for the record.
        </li>

        <li>
            <strong>State Name:</strong>
            Name of the state visited.
        </li>

        <li>
            <strong>City/Location:</strong>
            City or area visited.
        </li>

        <li>
            <strong>Travel Category:</strong>
            General category of the trip.
        </li>

        <li>
            <strong>Visit Type:</strong>
            Type or length of the visit.
        </li>

        <li>
            <strong>Reason Enjoyed:</strong>
            Explanation of why the visit was enjoyable.
        </li>
    </ul>

    <% if (confirmationMessage != null) { %>

        <p>
            <strong>
                <%= confirmationMessage %>
            </strong>
        </p>

    <% } %>

    <% if (errorMessage != null) { %>

        <p class="error">
            <%= errorMessage %>
        </p>

    <% } %>

    <h2>Current Database Records</h2>

    <table>

        <thead>
            <tr>
                <th>State ID</th>
                <th>State Name</th>
                <th>City/Location</th>
                <th>Travel Category</th>
                <th>Visit Type</th>
                <th>Reason Enjoyed</th>
            </tr>
        </thead>

        <tbody>

            <% if (stateRecords != null) { %>

                <% for (StateRecord record : stateRecords) { %>

                    <tr>

                        <td>
                            <%= record.getStateId() %>
                        </td>

                        <td>
                            <%= record.getStateName() %>
                        </td>

                        <td>
                            <%= record.getCityLocation() %>
                        </td>

                        <td>
                            <%= record.getTravelCategory() %>
                        </td>

                        <td>
                            <%= record.getVisitType() %>
                        </td>

                        <td>
                            <%= record.getReasonEnjoyed() %>
                        </td>

                    </tr>

                <% } %>

            <% } %>

        </tbody>

    </table>

    <h2>Delete a Record</h2>

    <% if (stateIds != null && !stateIds.isEmpty()) { %>

        <form action="stateDelete.jsp"
              method="post">

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
                   value="Delete Record">

        </form>

    <% } else { %>

        <p>
            There are no remaining records available to delete.
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