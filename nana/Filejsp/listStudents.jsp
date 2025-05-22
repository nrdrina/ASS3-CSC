<%-- 
    Document   : listStudents
    Created on : 22 May 2025, 4:50:50 pm
    Author     : hp
--%>

<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("index.html");
        return;
    }

    // Connect to DB
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management", "root", "root");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM student");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="">
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
    <h2 class="mb-4">Registered Students</h2>
    <div class="table-responsive rounded-3 shadow">
            <table class="table table-bordered text-center table-sm mb-0" style="font-size: 80%; width: 100%;">
            <thead class=" text-white table-dark" style="position: sticky; top: 0; z-index: 1;">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>IC Number</th>
                <th>Kelas</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            while(rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("ic_number") %></td>
                <td><%= rs.getString("kelas") %></td>
                <td>
                    <a href="DeleteStudentServlet?id=<%= rs.getInt("id") %>" 
                       onclick="return confirm('Are you sure to delete this student?');" 
                       class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
        <%
            }
            con.close();
        %>
        </tbody>
    </table>
    </div>
       
    <a href="dashboard.jsp" class="btn btn-secondary mt-4 shadow">Back to Dashboard</a>
    </div>
</body>
</html>

