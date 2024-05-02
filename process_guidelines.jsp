<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    // Database connection variables
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/donormanage", "root", "");

        // Retrieve form data
        String guidelineTitle = request.getParameter("guideline_title");
        String guidelineDescription = request.getParameter("guideline_description");

        // Insert new guideline into the database
        String insertSql = "INSERT INTO added_guidelines (guideline_title, guideline_description) VALUES (?, ?)";
        pstmt = conn.prepareStatement(insertSql);
        pstmt.setString(1, guidelineTitle);
        pstmt.setString(2, guidelineDescription);
        int rowsAffected = pstmt.executeUpdate();

        // Check if guideline was successfully added
        if (rowsAffected > 0) {
            // Redirect to view added guidelines page
            response.sendRedirect("view_added_guidelines.jsp");
        } else {
            out.println("<h2>Error: Guideline Not Added.</h2>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close database resources
        if (pstmt != null) {
            try {
                pstmt.close();
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
