<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    /*
     * Name: Natasha Foreman
     * Course: CSD 430 - Server Side Development
     * Assignment: Module 7 Project Part 2
     * Purpose: Gathers data for a new state travel record.
     */
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add a State Record</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
<div class="container">

    <h1>Add a State Travel Record</h1>

    <p class="description">
        Use this form to add a new travel record to the CSD430
        database. The primary-key value will be generated
        automatically when the form is submitted.
    </p>

    <h2>Overall Data Description</h2>

    <p>
        Each record describes a state and location that was visited,
        the category and type of trip, and the reason the experience
        was enjoyable.
    </p>

    <h2>Field Descriptions</h2>

    <ul>
        <li>
            <strong>State Name:</strong>
            Name of the state visited.
        </li>

        <li>
            <strong>City/Location:</strong>
            City or area visited within the state.
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

    <h2>New Record Information</h2>

    <form action="stateCreateResult.jsp" method="post">

        <label for="stateName">State Name:</label>
        <input
            type="text"
            id="stateName"
            name="stateName"
            maxlength="50"
            required>

        <label for="cityLocation">City/Location:</label>
        <input
            type="text"
            id="cityLocation"
            name="cityLocation"
            maxlength="100"
            required>

        <label for="travelCategory">
            Travel Category:
        </label>

        <select
            id="travelCategory"
            name="travelCategory"
            required>

            <option value="">Select a category</option>
            <option value="City">City</option>
            <option value="Family">Family</option>
            <option value="Mountain">Mountain</option>
            <option value="Music">Music</option>
            <option value="Outdoor">Outdoor</option>
            <option value="Theme Park">Theme Park</option>
        </select>

        <label for="visitType">Visit Type:</label>

        <select
            id="visitType"
            name="visitType"
            required>

            <option value="">Select a visit type</option>
            <option value="Day Trip">Day Trip</option>
            <option value="Weekend Trip">Weekend Trip</option>
            <option value="Vacation">Vacation</option>
        </select>

        <label for="reasonEnjoyed">
            Reason Enjoyed:
        </label>

        <textarea
            id="reasonEnjoyed"
            name="reasonEnjoyed"
            rows="4"
            maxlength="255"
            required></textarea>

        <input type="submit" value="Add State Record">

    </form>

    <p>
        <a href="index.jsp">Return to Project Index</a>
    </p>

</div>
</body>
</html>