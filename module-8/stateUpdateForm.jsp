<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="beans.StateRecord" %>
<%@ page import="database.StateDAO" %>

<%
    /*
     * Name: Natasha Foreman
     * Course: CSD 430 - Server Side Development
     * Assignment: Module 8 Project Part 3
     * Purpose: Loads the selected database record and places the editable values into an HTML form.
     */

    StateRecord stateRecord = null;
    String errorMessage = null;

    String selectedValue =
            request.getParameter("stateId");

    if (selectedValue == null
            || selectedValue.trim().isEmpty()) {

        errorMessage =
                "No state record ID was selected.";

    } else {

        try {

            int stateId =
                    Integer.parseInt(selectedValue);

            StateDAO stateDAO =
                    new StateDAO();

            stateRecord =
                    stateDAO.getStateById(stateId);

            if (stateRecord == null) {
                errorMessage =
                        "No record was found for state ID "
                        + stateId + ".";
            }

        } catch (NumberFormatException exception) {

            errorMessage =
                    "The selected state ID is invalid.";

        } catch (Exception exception) {

            errorMessage =
                    exception.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Update State Record</title>
    <link rel="stylesheet"
          type="text/css"
          href="style.css">
</head>

<body>

<div class="container">

    <h1>Update State Travel Record</h1>

    <p class="description">
        The selected record is displayed below.
        The primary-key value cannot be changed.
        Update any of the remaining fields and submit the form to save the changes.
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
            General category of the travel experience.
        </li>

        <li>
            <strong>Visit Type:</strong>
            Type or length of the trip.
        </li>

        <li>
            <strong>Reason Enjoyed:</strong>
            Explanation of why the visit was enjoyable.
        </li>
    </ul>

    <% if (errorMessage == null) { %>

        <h2>Record Information</h2>

        <form action="stateUpdateResult.jsp"
              method="post">

            <label>State ID:</label>

            <p>
                <strong>
                    <%= stateRecord.getStateId() %>
                </strong>
            </p>

            <input type="hidden"
                   name="stateId"
                   value="<%= stateRecord.getStateId() %>">

            <label for="stateName">
                State Name:
            </label>

            <input type="text"
                   id="stateName"
                   name="stateName"
                   maxlength="50"
                   value="<%= stateRecord.getStateName() %>"
                   required>

            <label for="cityLocation">
                City/Location:
            </label>

            <input type="text"
                   id="cityLocation"
                   name="cityLocation"
                   maxlength="100"
                   value="<%= stateRecord.getCityLocation() %>"
                   required>

            <label for="travelCategory">
                Travel Category:
            </label>

            <input type="text"
                   id="travelCategory"
                   name="travelCategory"
                   maxlength="50"
                   value="<%= stateRecord.getTravelCategory() %>"
                   required>

            <label for="visitType">
                Visit Type:
            </label>

            <input type="text"
                   id="visitType"
                   name="visitType"
                   maxlength="50"
                   value="<%= stateRecord.getVisitType() %>"
                   required>

            <label for="reasonEnjoyed">
                Reason Enjoyed:
            </label>

            <textarea id="reasonEnjoyed"
                      name="reasonEnjoyed"
                      rows="4"
                      maxlength="255"
                      required><%= stateRecord.getReasonEnjoyed() %></textarea>

            <input type="submit"
                   value="Update Record">

        </form>

    <% } else { %>

        <p class="error">
            <%= errorMessage %>
        </p>

    <% } %>

    <p>
        <a href="stateUpdateSelect.jsp">
            Select Another Record
        </a>
    </p>

    <p>
        <a href="index.jsp">
            Return to Project Index
        </a>
    </p>

</div>

</body>
</html>