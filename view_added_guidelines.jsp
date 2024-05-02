<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Added Guidelines</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        /* Additional Styles */
        body {
            background-image: url('s.jpg'); /* Change 's.jpg' to your image file */
            background-size: cover;
            background-position: center;
        }

        .content {
            padding: 20px;
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background for content */
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
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

        /* Back Button Styles */
        .back-button {
            margin-top: 20px;
        }

        .back-button button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .back-button button:hover {
            background-color: #45a049;
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
        <h1>View Added Guidelines</h1>
        <table>
            <tr>
                <th>Guideline Title</th>
                <th>Guideline Description</th>
            </tr>
            <% 
                // Retrieve added guidelines from the database
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/donormanage", "root", "");
                    String sql = "SELECT * FROM added_guidelines";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        String title = rs.getString("guideline_title");
                        String description = rs.getString("guideline_description");
            %>
            <tr>
                <td><%= title %></td>
                <td><%= description %></td>
            </tr>
            <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) {
                        try {
                            rs.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                    if (stmt != null) {
                        try {
                            stmt.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                    if (conn != null) {
                        try {
                            conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            %>
        </table>

        <!-- Back Button to Dashboard -->
        <div class="back-button">
            <button onclick="window.location.href='dashboard.jsp'">Back to Dashboard</button>
        </div>
    </div>
</body>
</html>
