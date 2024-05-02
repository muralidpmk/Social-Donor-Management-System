<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    // JDBC connection parameters
    String url = "jdbc:mysql://localhost:3306/donormanage";
    String user = "root";
    String pass = ""; // Enter your database password here
    
    // Database connection
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);
        
        // Check if user exists and credentials are correct
        pstmt = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            // User authenticated, redirect to dashboard
            session.setAttribute("username", username);
            response.sendRedirect("dashboard.jsp");
        } else {
            out.println("<h2>Login failed! Invalid username or password.</h2>");
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    } catch (ClassNotFoundException ex) {
        ex.printStackTrace();
    } finally {
        // Close resources
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
