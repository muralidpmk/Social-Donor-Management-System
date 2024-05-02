<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    
    // JDBC connection parameters
    String url = "jdbc:mysql://localhost:3306/donormanage";
    String user = "root";
    String pass = ""; // Enter your database password here
    
    // Database connection
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);
        
        // Insert user into database
        pstmt = conn.prepareStatement("INSERT INTO users (username, password, email, role) VALUES (?, ?, ?, 'donor')");
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        pstmt.setString(3, email);
        int rowsAffected = pstmt.executeUpdate();
        
        // Check if registration was successful
        if (rowsAffected > 0) {
            out.println("<h2>Registration successful!</h2>");
            // Redirect to login page
            response.sendRedirect("login.jsp");
        } else {
            out.println("<h2>Registration failed!</h2>");
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    } catch (ClassNotFoundException ex) {
        ex.printStackTrace();
    } finally {
        // Close resources
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
