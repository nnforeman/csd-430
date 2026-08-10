<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.StateRecord" %>
<%@ page import="database.StateDAO" %>

<%
    /*
        Name: Natasha Foreman
        Course: CSD 430 - Server Side Development
        Date: 7/12/26
        Assignment: Modules 5.3 and 6.3 Project Part 1
        Purpose: Retrieves one state record using the selected primary key and displays the results in an HTML table.
    */

    StateRecord stateRecord = null;
    String errorMessage = null;
    String selectedValue = request.getParameter("stateId");

    if (selectedValue == null || selectedValue.trim().isEmpty()) {
        errorMessage = "No state record ID was selected.";
    } else {
        try {
            int stateId = Integer.parseInt(selectedValue);

            StateDAO stateDAO = new StateDAO();
            stateRecord = stateDAO.getStateById(stateId);

            if (stateRecord == null) {
                errorMessage = "No record was found for state ID " + stateId + ".";
            }

        } catch (NumberFormatException exception) {
            errorMessage = "The selected state ID is invalid.";
        } catch (Exception exception) {
            errorMessage = exception.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>State Record Details</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
<div class="container">

    <h1>State Record Details</h1>

    <p class="description">
        The table below displays the values selected on the previous page.
    </p>

    <h2>Field Descriptions</h2>

    <ul>
        <li><strong>State ID:</strong> Unique primary key for the record.</li>
        <li><strong>State Name:</strong> Name of the state visited.</li>
        <li><strong>City/Location:</strong> City or location visited.</li>
        <li><strong>Travel Category:</strong> General category of the travel experience.</li>
        <li><strong>Visit Type:</strong> Type or length of the trip.</li>
        <li><strong>Reason Enjoyed:</strong> Explanation of why the visit was enjoyable.</li>
    </ul>

    <% if (errorMessage == null) { %>

        <h2>Selected Database Record</h2>

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
                <tr>
                    <td><%= stateRecord.getStateId() %></td>
                    <td><%= stateRecord.getStateName() %></td>
                    <td><%= stateRecord.getCityLocation() %></td>
                    <td><%= stateRecord.getTravelCategory() %></td>
                    <td><%= stateRecord.getVisitType() %></td>
                    <td><%= stateRecord.getReasonEnjoyed() %></td>
                </tr>
            </tbody>
        </table>

    <% } else { %>

        <p class="error">
            <%= errorMessage %>
        </p>

    <% } %>

    <p>
        <a href="stateSelect.jsp">Select Another Record</a>
    </p>

    <p>
        <a href="index.jsp">Return to Project Index</a>
    </p>

</div>
</body>
</html>