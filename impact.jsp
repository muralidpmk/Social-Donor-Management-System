<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Social Impact Assessment</title>
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
            color: #333; /* Updated text color */
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

        .content {
            padding: 20px;
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background for content */
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333;
        }

        p {
            color: #666;
        }

        /* Form Styles */
        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Table Styles */
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

        /* Chart Styles */
        .chart-container {
            width: 100%;
            height: 400px;
            margin-top: 20px;
        }

        canvas {
            width: 100%;
            height: 100%;
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
        <h1>Social Impact Assessment</h1>
        <form action="process_impact.jsp" method="post">
            <label for="project_name">Project Name</label>
            <input type="text" id="project_name" name="project_name" required>

            <label for="impact_description">Impact Description</label>
            <textarea id="impact_description" name="impact_description" rows="4" required></textarea>

            <button type="submit">Assess Impact</button>
        </form>

        <!-- Sample Impact Report Table -->
        <h2>Recent Impact Reports</h2>
        <table>
            <tr>
                <th>Project Name</th>
                <th>Impact Description</th>
                <th>Date</th>
            </tr>
            <% 
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/donormanage", "root", "");
                    String sql = "SELECT * FROM impact_reports";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);
                    while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("project_name") %></td>
                <td><%= rs.getString("impact_description") %></td>
                <td><%= rs.getString("report_date") %></td>
            </tr>
            <% 
                    }
                } catch(Exception e) {
                    e.printStackTrace();
                } finally {
                    if(rs != null) {
                        try {
                            rs.close();
                        } catch(SQLException e) {
                            e.printStackTrace();
                        }
                    }
                    if(stmt != null) {
                        try {
                            stmt.close();
                        } catch(SQLException e) {
                            e.printStackTrace();
                        }
                    }
                    if(conn != null) {
                        try {
                            conn.close();
                        } catch(SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            %>
        </table>

        <!-- Sample Impact Chart -->
        <div class="chart-container">
            <canvas id="impactChart"></canvas>
        </div>
    </div>
</body>
</html>
