package Project_Controller_Admin;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAOAdmin;


@WebServlet(name = "ControllerAdmin_Login", urlPatterns = {"/ControllerAdmin_Login"})
public class ControllerAdmin_Login extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("usernameadmin");
            String password = request.getParameter("passwordadmin");
            
            DAOAdmin dao = new DAOAdmin();
            
            boolean isValid = dao.login(username, password);
            
            if(isValid){
                HttpSession session = request.getSession();
                session.setAttribute("nameAdminlogin", username);
                RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/ControllerAdmin_control");
                dispatch.forward(request, response);
            }else{
                RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/Project_AdminLogin.jsp");
                dispatch.forward(request, response);
            }
        }finally{
            out.close();
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
