/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
public class CartServlet extends HttpServlet {

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
            out.println("<title>Servlet CartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        HttpSession session = request.getSession();
        Users id = (Users) session.getAttribute("account");
        int userid = id.getUserid();
        String uid = Integer.toString(userid);
        String pid_str = request.getParameter("product_id");
        String pname = request.getParameter("product_name");
        String sizename = request.getParameter("sizename");
        String quantity_str = request.getParameter("quantity");
        int quantitybook = Integer.parseInt(quantity_str);
        int pid = Integer.parseInt(pid_str);
        DAO dao = new DAO();
        double price = dao.getProductsbyPID(pid_str).getPrice();
        Size s = dao.getSizequantity(pid, sizename);
        if (quantitybook > s.getQuantity()) {
            request.setAttribute("listcate", dao.getCategories());
            request.setAttribute("detail", dao.getProductsbyPID(pid_str));
            request.setAttribute("size", dao.getSizesByPID(pid_str));
            request.setAttribute("error1", "Nhập quá số lượng");
            request.getRequestDispatcher("Views/DetailProduct.jsp").forward(request, response);
        } else {
            double total = price * quantitybook;
            String totalAsString = Double.toString(total);
            dao.addCart(uid, pid_str, pname, sizename, quantity_str, totalAsString);
            request.setAttribute("listcate", dao.getCategories());
            request.setAttribute("detail", dao.getProductsbyPID(pid_str));
            request.setAttribute("size", dao.getSizesByPID(pid_str));
            request.setAttribute("success", "Đã thêm vào giỏ hàng");
            request.getRequestDispatcher("Views/DetailProduct.jsp").forward(request, response);
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
