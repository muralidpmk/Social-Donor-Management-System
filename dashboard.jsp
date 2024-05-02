<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Social Donor Management System</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
            background-image: url('s.jpg'); /* Change 's.jpg' to your image file */
            background-size: cover;
            background-position: center;
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black background for navbar */
            overflow: hidden;
        }

        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        /* Content Styles */
        .content {
            padding: 20px;
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background for content */
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Back Button Styles */
        .back-button {
            margin-bottom: 20px;
        }

        /* Responsive Design */
        @media screen and (max-width: 600px) {
            .navbar a {
                float: none;
                display: block;
                text-align: left;
            }
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="index.jsp">Home</a>
        <a href="donor.jsp">Donor Management</a>
        <a href="project.jsp">Project and Survey Creation</a>
        <a href="impact.jsp">Social Impact Assessment</a>
        <a href="guidelines.jsp">Donor Guidelines and Instructions</a>
    </div>
    <div class="content">
        <h1>Dashboard</h1>
        <p>Welcome to the Dashboard of the Social Donor Management System.</p>
        
        <!-- Back Button to Home Page -->
        <div class="back-button">
            <a href="index.jsp">Back to Home</a>
        </div>
        
        <!-- Links to All Pages -->
        <h2>Quick Access</h2>
        <ul>
            <li><a href="donor.jsp">Donor Management</a></li>
            <li><a href="project.jsp">Project and Survey Creation</a></li>
            <li><a href="impact.jsp">Social Impact Assessment</a></li>
            <li><a href="guidelines.jsp">Donor Guidelines and Instructions</a></li>
        </ul>
    </div>
</body>
</html>
