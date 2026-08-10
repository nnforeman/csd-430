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
     * Assignment: Module 7 Project Part 2
     * Purpose: Inserts a new state record and displays all records.
     */

    String stateName =
            request.getParameter("stateName");

    String cityLocation =
            request.getParameter("cityLocation");

    String travelCategory =
            request.getParameter("travelCategory");

    String visitType =
            request.getParameter("visitType");

    String reasonEnjoyed =
            request.getParameter("reasonEnjoyed");

    String errorMessage = null;
    String confirmationMessage = null;
    List<StateRecord> stateRecords = null;

    try {
        if (stateName == null || stateName.trim().isEmpty()
                || cityLocation == null
                || cityLocation.trim().isEmpty()
                || travelCategory == null
                || travelCategory.trim().isEmpty()
                || visitType == null
                || visitType.trim().isEmpty()
                || reasonEnjoyed == null
                || reasonEnjoyed.trim().isEmpty()) {

            errorMessage =
                    "All fields are required before adding a record.";

        } else {
            StateRecord newRecord = new StateRecord();

            newRecord.setStateName(stateName.trim());
            newRecord.setCityLocation(cityLocation.trim());
            newRecord.setTravelCategory(
                    travelCategory.trim());
            newRecord.setVisitType(visitType.trim());
            newRecord.setReasonEnjoyed(
                    reasonEnjoyed.trim());

            StateDAO stateDAO = new StateDAO();

            int generatedId =
                    stateDAO.insertState(newRecord);

            confirmationMessage =
                    "The new record was added successfully "
                    + "with state ID " + generatedId + ".";

            stateRecords = stateDAO.getAllStates();
        }

    } catch (Exception exception) {
        errorMessage = exception.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>State Records</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
<div class="container">

    <h1>State Travel Records</h1>

    <p class="description">
        The table below displays all records currently stored in
        the CSD430 database after the new record was submitted.
    </p>

    <h2>Record Description</h2>

    <p>
        Every row represents one state travel record. The primary
        key is generated automatically by the database.
    </p>

    <% if (errorMessage == null) { %>

        <p>
            <strong><%= confirmationMessage %></strong>
        </p>

        <h2>All Database Records</h2>

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
            </tbody>
        </table>

    <% } else { %>

        <p class="error">
            The record could not be added:
            <%= errorMessage %>
        </p>

    <% } %>

    <p>
        <a href="stateCreate.jsp">Add Another Record</a>
    </p>

    <p>
        <a href="index.jsp">Return to Project Index</a>
    </p>

</div>
</body>
</html>