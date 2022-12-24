
package controllerOnly;

import entity.admin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOAdmin;


@WebServlet(name = "ControllerAdmin_new", urlPatterns = {"/ControllerAdmin_new"})
public class ControllerAdmin_new extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DAOAdmin dao = new DAOAdmin();
            String action = request.getParameter("action");
            if(action == null){
                action = "listAll";
            }
            
            if(action.equals("listAll")){
                ResultSet rs = dao.getData("select * from Admin");
                String title = "Admin";
                request.setAttribute("kq", rs);
                request.setAttribute("title", title);
                dispath(request, response, "/Admin_View.jsp");
            }
            
            if(action.equals("insert")){
                String submit = request.getParameter("submit");
                if(submit == null){
                    dispath(request, response, "/Admin_Insert.jsp");
                }else{
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    
                    admin obj = new admin(username, password);
                    dao.insertAdmin(obj);
                    response.sendRedirect("ControllerAdmin_new");
                }
            }
            
            if(action.equals("update")){
                String submit = request.getParameter("submit");
                if(submit == null){
                    String id = request.getParameter("adminID");
                    int adminID = Integer.parseInt(id);
                    ResultSet rs = dao.getData("select * from admin where adminID = "+adminID+"");
                    request.setAttribute("ud", rs);
                    dispath(request, response, "/Admin_Update.jsp");
                }else{
                    String id = request.getParameter("adminID");
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    
                    int adminID = Integer.parseInt(id);
                    admin obj = new admin(username, password);
                    dao.Update(obj, adminID);
                    response.sendRedirect("ControllerAdmin_new");
                }
            }
            
            if(action.equals("delete")){
                String id = request.getParameter("adminID");
                int adminID = Integer.parseInt(id);
                dao.remove(adminID);
                response.sendRedirect("ControllerAdmin_new");
            }
        }
    }
    
    public void dispath(HttpServletRequest request, 
            HttpServletResponse response, String url) throws ServletException, IOException{
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
