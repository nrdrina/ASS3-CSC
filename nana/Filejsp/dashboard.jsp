<%-- 
    Document   : dashboard
    Created on : 22 May 2025, 4:50:15 pm
    Author     : hp
--%>
<%@ page import="java.sql.*" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("index.html");
        return;
    }
%>
<%
    int anggun = 0, berlian = 0, cempaka = 0;

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management", "root", "root");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT kelas, COUNT(*) AS total FROM student GROUP BY kelas");

    while (rs.next()) {
        String kelas = rs.getString("kelas");
        int count = rs.getInt("total");
        if ("1 Anggun".equals(kelas)) anggun = count;
        else if ("1 Berlian".equals(kelas)) berlian = count;
        else if ("1 Cempaka".equals(kelas)) cempaka = count;
    }
    con.close();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="assets/css/style.css">
        <title>JSP Page</title>
        
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
        <h2>Welcome, <%= admin %> 👋</h2>

        <div class="row">
            <div class="col-md-4">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-body shadow">
                        <h5 class="card-title">1 Anggun</h5>
                        <p class="card-text fs-4"><%= anggun %> students</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 ">
                <div class="card text-white bg-success mb-3">
                    <div class="card-body shadow">
                        <h5 class="card-title">1 Berlian</h5>
                        <p class="card-text fs-4"><%= berlian %> students</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 ">
                <div class="card text-white bg-warning mb-3">
                    <div class="card-body shadow">
                        <h5 class="card-title">1 Cempaka</h5>
                        <p class="card-text fs-4"><%= cempaka %> students</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="mt-5" style="max-width: 300px; margin: auto;">
            <canvas id="classPieChart"></canvas>
        </div>
                    
    </div>
    <script>
        const ctx = document.getElementById('classPieChart').getContext('2d');
        const classPieChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['1 Anggun', '1 Berlian', '1 Cempaka'],
                datasets: [{
                    label: 'Total Students',
                    data: [<%= anggun %>, <%= berlian %>, <%= cempaka %>],
                    backgroundColor: [
                        'rgba(0, 123, 255, 0.7)',
                        'rgba(40, 167, 69, 0.7)',
                        'rgba(255, 193, 7, 0.7)'
                    ],
                    borderWidth: 1
                }]
            }
        });
    </script>
    </body>
</html>
