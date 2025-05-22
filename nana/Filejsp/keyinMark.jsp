<%-- 
    Document   : keyinMark
    Created on : 22 May 2025, 4:51:04 pm
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

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management", "root", "root");

    Statement stmt1 = con.createStatement();
    ResultSet students = stmt1.executeQuery("SELECT * FROM student");

    Statement stmt2 = con.createStatement();
    ResultSet subjects = stmt2.executeQuery("SELECT * FROM subject");

    Statement stmt3 = con.createStatement();
    ResultSet exams = stmt3.executeQuery("SELECT * FROM exam");
%>
<%
    String showModal = request.getParameter("success");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Key In Mark</title>
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
            <h2 class="mb-4">Key In Marks</h2>
            <div class="w-50 container p-3 bg-white shadow rounded-3">
            <form action="KeyinMarkServlet" method="post">
                <div class="mb-3">
                    <label class="form-label fw-bold">Select Student</label>
                    <select name="student_id" class="form-select shadow-sm" required>
                        <option value="">-- Choose Student --</option>
                        <%
                            while (students.next()) {
                        %>
                            <option value="<%= students.getInt("id") %>">
                                <%= students.getString("name") %> (IC: <%= students.getString("ic_number") %>)
                            </option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Select Subject</label>
                    <select name="subject_id" class="form-select shadow-sm" required>
                        <option value="">-- Choose Subject --</option>
                        <%
                            while (subjects.next()) {
                        %>
                            <option value="<%= subjects.getInt("id") %>">
                                <%= subjects.getString("name") %>
                            </option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Select Exam</label>
                    <select name="exam_id" class="form-select shadow-sm" required>
                        <option value="">-- Choose Exam --</option>
                        <%
                            while (exams.next()) {
                        %>
                            <option value="<%= exams.getInt("id") %>">
                                <%= exams.getString("type") %>
                            </option>
                        <%
                            }
                            con.close();
                        %>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Enter Mark</label>
                    <input type="number" class="form-control shadow-sm" name="mark" min="0" max="100" required>
                </div>

                <button type="submit" class="btn btn-success shadow">Submit Mark</button>
                <a href="dashboard.jsp" class="btn btn-secondary shadow">Back to Dashboard</a>
                <!-- Modal -->
                <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="successModalLabel">✅ Success!</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        Student save mark successfully!
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
                      </div>
                    </div>
                  </div>
                </div>
            </form>
            </div>
        </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<% if ("true".equals(showModal)) { %>
<script>
const successModal = new bootstrap.Modal(document.getElementById('successModal'));
successModal.show();
</script>
<% } %>    
</body>
</html>
