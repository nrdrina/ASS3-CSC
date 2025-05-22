<%-- 
    Document   : registerStudent
    Created on : 22 May 2025, 4:50:35 pm
    Author     : hp
--%>
<%
    String showModal = request.getParameter("success");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register Student</title>
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
                <h2 class="mb-4">Student Registration Form</h2>
                <div class="w-50 container p-3 rounded-3 shadow bg-white">
                <form action="RegisterStudentServlet" method="post">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Student Name</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">IC Number</label>
                        <input type="text" class="form-control" name="ic_number" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Select Class</label><br>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="kelas" value="1 Anggun" required>
                            <label class="form-check-label">1 Anggun</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="kelas" value="1 Berlian">
                            <label class="form-check-label">1 Berlian</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="kelas" value="1 Cempaka">
                            <label class="form-check-label">1 Cempaka</label>
                        </div>
                    </div>

<!--                    <button type="submit" class="btn btn-success shadow">Register Student</button>-->
                    <!-- Button trigger modal -->
                    <button type="submit" class="btn btn-success shadow" data-bs-toggle="modal" data-bs-target="#exampleModal">
                      Register Student
                    </button>

                    <!-- Modal -->
                    <!-- Modal -->
                    <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="successModalLabel">✅ Success!</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            Student registered successfully!
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

