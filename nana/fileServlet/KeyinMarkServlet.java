/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/KeyinMarkServlet")
public class KeyinMarkServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int studentId = Integer.parseInt(request.getParameter("student_id"));
        int subjectId = Integer.parseInt(request.getParameter("subject_id"));
        int examId = Integer.parseInt(request.getParameter("exam_id"));
        int mark = Integer.parseInt(request.getParameter("mark"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_management", "root", "root");

            String query = "INSERT INTO marks (student_id, subject_id, exam_id, mark) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, studentId);
            ps.setInt(2, subjectId);
            ps.setInt(3, examId);
            ps.setInt(4, mark);
            ps.executeUpdate();

            con.close();
            response.sendRedirect("keyinMark.jsp?success=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
