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
public class EditServlet extends HttpServlet {

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
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditServlet at " + request.getContextPath() + "</h1>");
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
        String editP = request.getParameter("eid");
        DAO dao = new DAO();
        request.setAttribute("listcate", dao.getCategories());
        request.setAttribute("detail", dao.getProductsbyPID(editP));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Views/editproduct.jsp");
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
        String editP = request.getParameter("id");
        request.setCharacterEncoding("UTF-8");
        String name_str = request.getParameter("name");
        String price_str = request.getParameter("price");
        String link_str = request.getParameter("link");
        String des_str = request.getParameter("description");
        String cate_str = request.getParameter("categories");
        DAO dao = new DAO();
        if (name_str.isEmpty() || price_str.isEmpty() || link_str.isEmpty() || des_str.isEmpty() || cate_str.isEmpty()) {
            request.setAttribute("error1", "Nhập đầy đủ");
            request.setAttribute("listcate", dao.getCategories());
            request.getRequestDispatcher("Views/editproduct.jsp").forward(request, response);
        } else {
            try {
                double price = Double.parseDouble(price_str);
                if (price <= 0) {
                    request.setAttribute("error2", "Nhập giá lớn hơn 0");
                    request.setAttribute("listcate", dao.getCategories());
                    request.getRequestDispatcher("Views/editproduct.jsp").forward(request, response);
                } else {
                    dao.Editproduct(name_str, cate_str, price_str, link_str, des_str, editP);
                    response.sendRedirect("AdminServlet");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error3", "Nhập giá là số");
                request.setAttribute("listcate", dao.getCategories());
                request.getRequestDispatcher("Views/editproduct.jsp").forward(request, response);
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
