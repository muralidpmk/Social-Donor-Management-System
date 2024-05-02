<!DOCTYPE html>
<html>
<head>
    <title>Project and Survey Creation</title>
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
    </style>
</head>
<body>
    <div class="navbar">
        <a href="index.jsp">Home</a>
        <a href="donor.jsp">Donor Management</a>
        <a href="project.jsp">Project and Survey Creation</a>
        <a href="impact.jsp">Social Impact Assessment</a>
        <a href="communication.jsp">Communication Facilitation</a>
        <a href="guidelines.jsp">Donor Guidelines and Instructions</a>
    </div>
    <div class="content">
        <h1>Project and Survey Creation</h1>
        <form action="process.jsp" method="post">
            <label for="project_name">Project Name</label>
            <input type="text" id="project_name" name="project_name" required>

            <label for="project_description">Project Description</label>
            <textarea id="project_description" name="project_description" rows="4" required></textarea>

            <label for="survey_questions">Survey Questions</label>
            <textarea id="survey_questions" name="survey_questions" rows="4" required></textarea>

            <button type="submit">Create Project and Survey</button>
        </form>
    </div>
</body>
</html>
