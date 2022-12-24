package controllerOnly;

import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOCustomer;

@WebServlet(name = "ControllerCustomer_new", urlPatterns = {"/ControllerCustomer_new"})
public class ControllerCustomer_new extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DAOCustomer dao = new DAOCustomer();
            String action = request.getParameter("action");
            if (action == null) {
                action = "listAll";
            }

            if (action.equals("listAll")) {
                ResultSet rs = dao.getData("select * from Customer");
                request.setAttribute("kq", rs);
                RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/ControllerAdmin_control");
                dispatch.forward(request, response);
            }
            
            if(action.equals("insert")){
                String submit = request.getParameter("submit");
                if(submit == null){
                    dispath(request, response, "/Customer_Insert.jsp");
                }else{
                    String CName = request.getParameter("cname");
                    String CPhone = request.getParameter("cphone");
                    String CAddress = request.getParameter("caddress");
                    String Username = request.getParameter("username");
                    String Password = request.getParameter("password");
                    String status = request.getParameter("status");

                    int n = Integer.parseInt(status);
                    Customer obj = new Customer(CName, CPhone, CAddress, Username, Password, n);

                    dao.insertCustomer(obj);
                    response.sendRedirect("ControllerCustomer_new");
                }
            }
            
            if(action.equals("update")){
                String submit = request.getParameter("submit");
                if(submit == null){
                    String  id = request.getParameter("cid");
                    ResultSet rs = dao.getData("select * from Customer where cid = "+id+"");
                    request.setAttribute("ud", rs);
                    dispath(request, response, "/Customer_Update.jsp");
                }else{
                    String id = request.getParameter("cid");
                    String CName = request.getParameter("cname");
                    String CPhone = request.getParameter("cphone");
                    String CAddress = request.getParameter("caddress");
                    String Username = request.getParameter("username");
                    String Password = request.getParameter("password");
                    String status = request.getParameter("status");
                    
                    int cid = Integer.parseInt(id);
                    int n = Integer.parseInt(status);
                    Customer obj = new Customer(CName, CPhone, CAddress, Username, Password, n);

                    dao.updateCustomer(obj, cid);
                    response.sendRedirect("ControllerAdmin_control");
                }
            }
            
            if(action.equals("delete")){
                String cid = request.getParameter("cid");
                int id = Integer.parseInt(cid);
                dao.remove(id);
                response.sendRedirect("ControllerAdmin_control");
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
