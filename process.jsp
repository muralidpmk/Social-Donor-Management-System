<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Processing Form</title>
    <!-- Additional CSS styles -->
</head>
<body>

    <%!
        // Method to create project and survey in the database
        private void createProjectAndSurvey(String projectName, String projectDescription, String surveyQuestions) {
            Connection conn = null;
            PreparedStatement stmtProject = null;
            PreparedStatement stmtSurvey = null;
            try {
                // Database connection
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/donormanage", "root", "");
                
                // Insert project details
                String queryProject = "INSERT INTO projects (organization_id, project_name, description, status) VALUES (?, ?, ?, 'pending')";
                stmtProject = conn.prepareStatement(queryProject, Statement.RETURN_GENERATED_KEYS);
                stmtProject.setInt(1, 2); // Assuming organization_id for the project
                stmtProject.setString(2, projectName);
                stmtProject.setString(3, projectDescription);
                stmtProject.executeUpdate();
                
                // Get the auto-generated project ID
                ResultSet rs = stmtProject.getGeneratedKeys();
                int projectId = 0;
                if (rs.next()) {
                    projectId = rs.getInt(1);
                }
                
                // Insert survey details
                String querySurvey = "INSERT INTO surveys (project_id, survey_question) VALUES (?, ?)";
                stmtSurvey = conn.prepareStatement(querySurvey);
                stmtSurvey.setInt(1, projectId);
                stmtSurvey.setString(2, surveyQuestions);
                stmtSurvey.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close resources
                try {
                    if (stmtProject != null) stmtProject.close();
                    if (stmtSurvey != null) stmtSurvey.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        }
    %>
    
    <%
        // Retrieve form data and call createProjectAndSurvey method
        String projectName = request.getParameter("project_name");
        String projectDescription = request.getParameter("project_description");
        String surveyQuestions = request.getParameter("survey_questions");
        createProjectAndSurvey(projectName, projectDescription, surveyQuestions);
    %>
    <p>Project and Survey created successfully.</p>
    <a href="project.jsp">Back to Project and Survey Creation</a>
</body>
</html>
