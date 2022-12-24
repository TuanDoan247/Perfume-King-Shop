
package Project_Controller_Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOBill;
import model.DAOCustomer;
import model.DAOProduct;


@WebServlet(name = "ControllerAdmin_control", urlPatterns = {"/ControllerAdmin_control"})
public class ControllerAdmin_control extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DAOCustomer daoCus = new DAOCustomer();
            DAOBill daoBill = new DAOBill();
            DAOProduct daoProd = new DAOProduct();
            String action = request.getParameter("action");
            
            String check = "";
            
            if(action == null){
                action = "listcustomer";
            }
            
            if(action.equals("listcustomer")){
                ResultSet rs = daoCus.getData("select * from Customer");
                String title = "Customer list";

                request.setAttribute("kq", rs);
                request.setAttribute("title", title);
                check = "cus";
                request.setAttribute("check", check);
                dispath(request, response, "/Project_Admin_Index.jsp");
            }
            
            
            if(action.equals("product")){
                //model
                ResultSet rs = daoProd.getData("select pid, pname, quantity, price, image, description, Product.status, Category.cateName\n"
                        + "from Product inner join Category\n"
                        + "on Product.cateID = Category.cateID\n");
                // some information
                String title = "Product list";
                // date view
                request.setAttribute("kq", rs);
                request.setAttribute("title", title);
                check = "prod";
                request.setAttribute("check", check);
                // select view 
                RequestDispatcher disp = request.getRequestDispatcher("/Project_Admin_Index.jsp");
                // run
                disp.forward(request, response);
            }

            if(action.equals("bill")){
                String sql = "select * from Bill";
                ResultSet rs = daoBill.getData(sql);
                String title = "List Bill";
                request.setAttribute("kq", rs);
                request.setAttribute("title", title);
                check = "bill";
                request.setAttribute("check", check);
                dispath(request, response, "/Project_Admin_Index.jsp");
            }

        }
    }
    
    public void dispath(HttpServletRequest request,
            HttpServletResponse response, String url) throws ServletException, IOException {
        RequestDispatcher disp = request.getRequestDispatcher(url);
        disp.forward(request, response);
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
        processRequest(request, response);
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
