package ShoppingOnline_User_Controller;

import ShoppingOnline_User_Model.DAOUser;
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

@WebServlet(name = "ControllerUser_Login", urlPatterns = {"/ControllerUser_Login"})
public class ControllerUser_Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            DAOUser dao = new DAOUser();
            
            boolean isValid = dao.checkLoginAndSignUp(username, password);
            
            if(isValid){
                // khởi tạo sesssion
                HttpSession session = request.getSession();
                
                // thiết lập giá trị trong session
                session.setAttribute("namelogin", username);
                
                // chuyển đến View chứa dánh sách
                RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/Controller_TrangChu");
                dispatch.forward(request, response);
            }else{
                // trong TH thất bại sẽ quay lại form login
                RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/ShoppingOnline_Login.jsp");
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
