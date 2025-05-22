<%-- 
    Document   : listMarks
    Created on : 22 May 2025, 4:51:17 pm
    Author     : hp
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("index.html");
        return;
    }

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management", "root", "root");

    String sql = "SELECT s.name AS student_name, sub.name AS subject_name, e.type AS exam_type, m.mark " +
                 "FROM marks m " +
                 "JOIN student s ON m.student_id = s.id " +
                 "JOIN subject sub ON m.subject_id = sub.id " +
                 "JOIN exam e ON m.exam_id = e.id";

    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Marks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="sidebar">
        <a href="dashboard.jsp">👩‍💼 Admin Panel</a>
        <a href="registerStudent.jsp">📝 Register Student</a>
        <a href="listStudents.jsp">📋 View Students</a>
        <a href="keyinMark.jsp">🧮 Key In Marks</a>
        <a href="listMarks.jsp">📊 View Marks</a>
        <hr>
        <a href="index.html">🚪 Logout</a>
    </div>

    <div class="main-content">
        <h2 class="mb-4">Student Exam Marks</h2>
        <div class="table-responsive rounded-3 shadow">
            <table class="table table-bordered text-center table-sm mb-0" style="font-size: 80%; width: 100%;">
            <thead class=" text-white table-dark" style="position: sticky; top: 0; z-index: 1;">
                <tr>
                    <th>Student Name</th>
                    <th>Subject</th>
                    <th>Exam</th>
                    <th>Mark</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("student_name") %></td>
                    <td><%= rs.getString("subject_name") %></td>
                    <td><%= rs.getString("exam_type") %></td>
                    <td><%= rs.getInt("mark") %></td>
                </tr>
                <%
                    }
                    con.close();
                %>
            </tbody>
        </table>
        </div>
        <a href="dashboard.jsp" class="btn btn-secondary shadow mt-4"> Back to Dashboard</a>
    </div>
    
</body>
</html>
