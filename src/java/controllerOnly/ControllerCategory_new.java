
package controllerOnly;

import entity.Category;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOCategory;


@WebServlet(name = "ControllerCategory_new", urlPatterns = {"/ControllerCategory_new"})
public class ControllerCategory_new extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DAOCategory dao = new DAOCategory();
            String action = request.getParameter("action");
            
            if(action == null){
                action = "listAll";
            }
            
            if(action.equals("listAll")){
                ResultSet rs = dao.getData("select * from Category");
                String title = "LIst Category";
                
                request.setAttribute("kq", rs);
                request.setAttribute("title", title);
                
                dispath(request, response, "/Category_View.jsp");
            }
            
            if(action.equals("insert")){
                String submit = request.getParameter("submit");
                if(submit == null){
                    dispath(request, response, "/Category_Insert.jsp");
                }else{
                    String cateName = request.getParameter("catename");
                    String status = request.getParameter("status");
                  
                    // convert
                    int sta = Integer.parseInt(status);

                    Category obj = new Category(cateName, sta);

                    dao.insertCategory(obj);

                    // show result
                    response.sendRedirect("ControllerCategory_new");
                }
            }
            
            if(action.equals("update")){
                String submit = request.getParameter("submit");
                if(submit == null){
                    String id = request.getParameter("cateID");
                    int cateid = Integer.parseInt(id);
                    ResultSet rs = dao.getData("select * from Category where cateID="+cateid+"");
                    request.setAttribute("kq", rs);
                    dispath(request, response, "/Category_Update.jsp");
                }else{
                    String id = request.getParameter("cateID");
                    String cateName = request.getParameter("catename");
                    String status = request.getParameter("status");
                  
                    // convert
                    int cateID = Integer.parseInt(id);
                    int sta = Integer.parseInt(status);

                    Category obj = new Category(cateName, sta);

                    dao.updateCategory(obj, cateID);

                    // show result
                    response.sendRedirect("ControllerCategory_new");
                }
            }
            
            if(action.equals("delete")){
                String id = request.getParameter("cateID");
                int cateid = Integer.parseInt(id);
                dao.delete(cateid);
                response.sendRedirect("ControllerCategory_new");
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
