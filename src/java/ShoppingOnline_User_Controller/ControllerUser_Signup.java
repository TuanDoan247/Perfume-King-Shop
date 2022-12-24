package ShoppingOnline_User_Controller;

import ShoppingOnline_User_Model.DAOUser;
import entity.Customer;
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
import model.DAOCustomer;

@WebServlet(name = "ControllerUser_Signup", urlPatterns = {"/ControllerUser_Signup"})
public class ControllerUser_Signup extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/ShoppingOnline_Register.jsp");
                dispatch.forward(request, response);
            } else {
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                DAOUser dao = new DAOUser();

                boolean isValid = dao.checkLoginAndSignUp(username, password);

                if (!isValid) {
                    HttpSession session = request.getSession();
                    session.setAttribute("namesignup", username);

                    DAOCustomer daoCus = new DAOCustomer();

                    String cname = request.getParameter("cname");
                    String cphone = request.getParameter("cphone");
                    String caddress = request.getParameter("caddress");

                    Customer obj = new Customer(cname, cphone, caddress, username, password, 1);
                    daoCus.insertCustomer(obj);

                    RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/Controller_TrangChu");
                    dispatch.forward(request, response);
                } else {
                    // Nếu true thì tài khoản, mật khẩu đã tồn tại, nhập tài khoản mật khẩu khác
                    RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/ShoppingOnline_Register.jsp");
                    dispatch.forward(request, response);
                }
            }
        } finally {
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
