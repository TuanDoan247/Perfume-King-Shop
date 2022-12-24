package controllerOnly;

import entity.Bill;
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
import model.DAOBillDetail;

@WebServlet(name = "ControllerBillDetail_new", urlPatterns = {"/ControllerBillDetail_new"})
public class ControllerBillDetail_new extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DAOBillDetail dao = new DAOBillDetail();
            DAOBill daoBill = new DAOBill();
            String action = request.getParameter("action");
            String oid = request.getParameter("oid");

            String submit = request.getParameter("submit");
            if (submit == null) {
                if (action == null) {
                    action = "listAll";
                }

                if (action.equals("listAll")) {
                    
                    request.setAttribute("oid", oid);
                    ResultSet rs = dao.getData("select * from BillDetail where oid = '" + oid + "'");
                    request.setAttribute("kq", rs);
                    ResultSet rsBill = dao.getData("select * from Bill where oid = '" + oid + "'");
                    request.setAttribute("udBill", rsBill);
                    dispath(request, response, "/BillDetail_View.jsp");
                }

                if (action.equals("update")) {
                    if (submit == null) {
                        ResultSet rsUpdate = dao.getData("select * from BillDetail where oID = '" + oid + "'");
                        request.setAttribute("rsUpdate", rsUpdate);
                        ResultSet rsProduct = dao.getData("select * from Product");
                        request.setAttribute("rsProduct", rsProduct);
                        ResultSet rsBill = dao.getData("select * from Bill");
                        request.setAttribute("rsBill", rsBill);
                        dispath(request, response, "/BillDetail_Update.jsp");
                    } else {

                        response.sendRedirect("ControllerBillDetail_new");
                    }
                }
            } else {
                String oidBill = request.getParameter("billid");
                String number = request.getParameter("status");
                int newstatus = Integer.parseInt(number);
                

                daoBill.changeStatus(oidBill, newstatus);

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
