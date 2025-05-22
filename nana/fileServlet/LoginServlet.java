/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    // Fixed admin credentials
    private static final String ADMIN_USERNAME = "nana";
    private static final String ADMIN_PASSWORD = "admin123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");


        // Strict match
        if (username.equals(ADMIN_USERNAME) && password.equals(ADMIN_PASSWORD)) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", ADMIN_USERNAME);
            response.sendRedirect("dashboard.jsp");
        } else {
            // Failed login
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('❌ Invalid username or password!');window.location='index.html';</script>");
        }
        
        
        // prevent null crash
        if (username == null || password == null) {
            response.sendRedirect("index.html");
            return;
        }

        username = username.trim();
        password = password.trim();
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

