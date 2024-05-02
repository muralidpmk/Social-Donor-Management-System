<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add or Update Donor Profile</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <!-- Additional CSS styles -->
</head>
<body>
    <!-- Content -->
    <div class="content">
        <h1>Add or Update Donor Profile</h1>
        <%!
            // Method to add or update donor profile in the database
            private void addOrUpdateDonor(String name, String email, String phone) {
                Connection conn = null;
                PreparedStatement stmt = null;
                try {
                    // Database connection
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/donormanage", "root", "");
                    
                    // Check if the donor already exists
                    String query = "SELECT * FROM donor_profiles WHERE full_name = ?";
                    stmt = conn.prepareStatement(query);
                    stmt.setString(1, name);
                    ResultSet rs = stmt.executeQuery();
                    if (rs.next()) {
                        // Update the existing donor profile
                        query = "UPDATE donor_profiles SET email = ?, phone = ? WHERE full_name = ?";
                        stmt = conn.prepareStatement(query);
                        stmt.setString(1, email);
                        stmt.setString(2, phone);
                        stmt.setString(3, name);
                        stmt.executeUpdate();
                    } else {
                        // Insert a new donor profile
                        query = "INSERT INTO donor_profiles (full_name, email, phone) VALUES (?, ?, ?)";
                        stmt = conn.prepareStatement(query);
                        stmt.setString(1, name);
                        stmt.setString(2, email);
                        stmt.setString(3, phone);
                        stmt.executeUpdate();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // Close resources
                    try {
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException se) {
                        se.printStackTrace();
                    }
                }
            }
        %>
        <!-- Retrieve form data and call addOrUpdateDonor method -->
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            addOrUpdateDonor(name, email, phone);
        %>
        <p>Donor profile added or updated successfully.</p>
        <!-- Link to go back to the donor management page -->
        <a href="donor.jsp">Back to Donor Management</a>
    </div>
</body>
</html>
