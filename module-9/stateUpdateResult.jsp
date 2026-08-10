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
     * Purpose: Updates the selected state record and displays the updated record in an HTML table.
     */

    StateRecord stateRecord = null;
    String errorMessage = null;
    String confirmationMessage = null;

    try {

        int stateId =
                Integer.parseInt(
                    request.getParameter("stateId"));

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

        if (stateName == null
                || stateName.trim().isEmpty()
                || cityLocation == null
                || cityLocation.trim().isEmpty()
                || travelCategory == null
                || travelCategory.trim().isEmpty()
                || visitType == null
                || visitType.trim().isEmpty()
                || reasonEnjoyed == null
                || reasonEnjoyed.trim().isEmpty()) {

            errorMessage =
                    "All fields are required.";

        } else {

            StateRecord updatedRecord =
                    new StateRecord(
                        stateId,
                        stateName.trim(),
                        cityLocation.trim(),
                        travelCategory.trim(),
                        visitType.trim(),
                        reasonEnjoyed.trim());

            StateDAO stateDAO =
                    new StateDAO();

            boolean updated =
                    stateDAO.updateState(updatedRecord);

            if (updated) {

                stateRecord =
                        stateDAO.getStateById(stateId);

                confirmationMessage =
                        "State record "
                        + stateId
                        + " was updated successfully.";

            } else {

                errorMessage =
                        "The record could not be updated.";
            }
        }

    } catch (NumberFormatException exception) {

        errorMessage =
                "The state ID is invalid.";

    } catch (Exception exception) {

        errorMessage =
                exception.getMessage();
    }
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Updated State Record</title>
    <link rel="stylesheet"
          type="text/css"
          href="style.css">
</head>

<body>

<div class="container">

    <h1>Updated State Travel Record</h1>

    <p class="description">
        The table below displays the state record after the submitted changes have been saved.
    </p>

    <h2>Record Description</h2>

    <p>
        Each column displays one field from the selected travel record. The State ID is the unique primary key and remains unchanged.
    </p>

    <% if (errorMessage == null) { %>

        <p>
            <strong>
                <%= confirmationMessage %>
            </strong>
        </p>

        <h2>Updated Database Record</h2>

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

                    <td>
                        <%= stateRecord.getStateId() %>
                    </td>

                    <td>
                        <%= stateRecord.getStateName() %>
                    </td>

                    <td>
                        <%= stateRecord.getCityLocation() %>
                    </td>

                    <td>
                        <%= stateRecord.getTravelCategory() %>
                    </td>

                    <td>
                        <%= stateRecord.getVisitType() %>
                    </td>

                    <td>
                        <%= stateRecord.getReasonEnjoyed() %>
                    </td>

                </tr>
            </tbody>

        </table>

    <% } else { %>

        <p class="error">
            The record could not be updated:
            <%= errorMessage %>
        </p>

    <% } %>

    <p>
        <a href="stateUpdateSelect.jsp">
            Update Another Record
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