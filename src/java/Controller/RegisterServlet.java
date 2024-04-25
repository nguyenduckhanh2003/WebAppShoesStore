/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Models.Users;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Views/register.jsp");
        requestDispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String repeat = request.getParameter("repeat");
        String regex = "^[a-zA-Z0-9]+@([a-z]{2,6}\\.[a-z]{2,6}|" + "[a-z]{2,6}\\.[a-z]{2,6})*$";
        if (email.isEmpty()||username.isEmpty()||password.isEmpty()||regex.isEmpty()) {
            request.setAttribute("empty1", "Nhập đầy đủ.");
        }
        if (!repeat.equals(password)) {
            request.setAttribute("pass", "Sai mật khẩu.");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("Views/register.jsp");
            requestDispatcher.forward(request, response);
        } else {
            if (!email.matches(regex)) {
                request.setAttribute("errormail", "Sai email.");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Views/register.jsp");
                requestDispatcher.forward(request, response);
            } else{
            DAO dao = new DAO();
            Users users = dao.checkUsersExist(username);
            if (users == null) {
                dao.RegisterUsers(username, password, email);
                response.sendRedirect("LoginServlet");
            } else {
                request.setAttribute("mess", "Tài khoản đã tồn tại.");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Views/register.jsp");
                requestDispatcher.forward(request, response);
            }
            }
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
