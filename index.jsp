<!DOCTYPE html>
<html>
<head>
    <title>Social Donor Management System</title>
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

        .navbar-right {
            float: right;
        }

        .content {
            padding: 20px;
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background for content */
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            color: #333; /* Updated content text color */
        }

        h1 {
            color: #333;
        }

        p {
            color: #666;
        }

        /* Feature Box Styles */
        .feature-box {
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background for feature boxes */
            padding: 20px;
            margin-top: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            color: #333; /* Updated feature box text color */
        }

        .feature-box h2 {
            color: #333;
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }

        .feature-box ul {
            list-style-type: none;
            padding: 0;
        }

        .feature-box li {
            margin-bottom: 10px;
        }

        /* Responsive Design */
        @media screen and (max-width: 600px) {
            .navbar a {
                float: none;
                display: block;
                text-align: left;
            }
            .navbar-right {
                float: none;
            }
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="index.jsp">Home</a>
        <div class="navbar-right">
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </div>
    </div>
    <div class="content">
        <h1>Welcome to Social Donor Management System</h1>
        <p>Manage donor relationships, track contributions, and assess social impact effectively.</p>
        <div class="feature-box">
            <h2>Features</h2>
            <ul>
                <li>Efficient donor management</li>
                <li>Project and survey creation</li>
                <li>Social impact assessment</li>
                <li>Communication facilitation</li>
                <li>Reporting and documentation</li>
                <li>Donor guidelines and instructions</li>
            </ul>
        </div>
    </div>
</body>
</html>
