/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
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
public class AddSize extends HttpServlet {

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
            out.println("<title>Servlet AddSize</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddSize at " + request.getContextPath() + "</h1>");
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
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Views/addsize.jsp");
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
        DAO dao = new DAO();
        String idP = request.getParameter("id");
        String sname = request.getParameter("sizename");
        String quantity_str = request.getParameter("quantity");
        try {
            if (idP.isEmpty() || sname.isEmpty() || quantity_str.isEmpty()) {
                request.setAttribute("error1", "Không được để trống");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Views/addsize.jsp");
                requestDispatcher.forward(request, response);
            } else {
                int quantity = Integer.parseInt(quantity_str);
                if (quantity <= 0) {
                    request.setAttribute("error2", "Số lượng cần lớn hơn 0");
                    request.getRequestDispatcher("Views/addsize.jsp").forward(request, response);
                } else {
                    if (dao.checkSizeInfo(idP, sname) !=null) {
                        request.setAttribute("error3", "Kích thước của sản phẩm đã tồn tại");
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Views/addsize.jsp");
                        requestDispatcher.forward(request, response);
                    } else {
                        dao.insertSize(idP, sname, quantity_str);
                        response.sendRedirect("managesize");
                    }
                }
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error2", "Số lượng cần lớn hơn 0");
            request.getRequestDispatcher("Views/addsize.jsp").forward(request, response);
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
