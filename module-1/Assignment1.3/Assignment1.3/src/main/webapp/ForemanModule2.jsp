<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
/*
Name: Natasha Foreman
Course: CSD 430 -  Server Side Development
Date: June 21st, 2026
Assignment: Module 2.2
Purpose: This JSP page creates a dynamic HTML table using Java Scriptlets.
*/

    String pageTitle = "States I Have Enjoyed Visiting";
    String description = "This page displays a list of states I have enjoyed visiting, including the state name, a city or location visited, and one reason I enjoyed the trip.";

    String[][] travelRecords = {
        {"Nebraska", "Omaha", "I enjoyed visiting the farmers market and exploring local places."},
        {"Oklahoma", "Oklahoma City", "I enjoyed visiting Bricktown and seeing the downtown area."},
        {"South Dakota", "Niobrara Area", "I enjoyed the outdoor scenery and peaceful river float experience."},
        {"Kansas", "Kansas City Area", "I enjoyed the food, shopping, and family-friendly attractions."},
        {"Missouri", "St. Louis", "I enjoyed the history, city views, and different attractions."}
    };
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= pageTitle %></title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>

    <div class="container">

        <h1><%= pageTitle %></h1>

        <p class="description">
            <%= description %>
        </p>

        <h2>Data Description</h2>
        <p>
            The table below contains five travel records. Each record includes three fields:
            state, city/location, and reason for enjoying the visit.
        </p>

        <h2>Field Descriptions</h2>
        <ul>
            <li><strong>State:</strong> The state that was visited.</li>
            <li><strong>City/Location:</strong> A city or area visited within the state.</li>
            <li><strong>Reason Enjoyed:</strong> A short explanation of what made the visit enjoyable.</li>
        </ul>
	<h2>Category: States Visited</h2>
        <h2>Travel Records</h2>

        <table>
            <thead>
                <tr>
                    <th>State</th>
                    <th>City/Location</th>
                    <th>Reason Enjoyed</th>
                </tr>
            </thead>

            <tbody>
                <%
                    // Loop through the travelRecords array and display each record in the HTML table.
                    for (int i = 0; i < travelRecords.length; i++) {
                %>
                    <tr>
                        <td><%= travelRecords[i][0] %></td>
                        <td><%= travelRecords[i][1] %></td>
                        <td><%= travelRecords[i][2] %></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>

    </div>

</body>
</html>