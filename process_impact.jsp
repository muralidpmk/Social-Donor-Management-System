<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/donormanage", "root", "");

        // Retrieve impact reports
        String selectSql = "SELECT * FROM impact_reports";
        pstmt = conn.prepareStatement(selectSql);
        rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Impact Assessment Results</title>
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
    </style>
</head>
<body>
    <div class="navbar">
        <a href="index.jsp">Home</a>
        <a href="donor.jsp">Donor Management</a>
        <a href="project.jsp">Project and Survey Creation</a>
        <a href="impact.jsp">Social Impact Assessment</a>
        <a href="communication.jsp">Communication Facilitation</a>
        <a href="report.jsp">Reporting and Documentation</a>
        <a href="guidelines.jsp">Donor Guidelines and Instructions</a>
    </div>
    <div class="content">
        <h1>Impact Assessment Results</h1>
        <table>
            <tr>
                <th>Project Name</th>
                <th>Impact Description</th>
                <th>Date</th>
            </tr>
            <% while(rs.next()) { %>
            <tr>
                <td><%= rs.getString("project_name") %></td>
                <td><%= rs.getString("impact_description") %></td>
                <td><%= rs.getString("report_date") %></td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>
<%
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
        if(pstmt != null) {
            try {
                pstmt.close();
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
