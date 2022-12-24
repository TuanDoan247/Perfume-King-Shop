
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


@WebServlet(name = "ControllerBill_new", urlPatterns = {"/ControllerBill_new"})
public class ControllerBill_new extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DAOBill dao = new DAOBill();
            String action = request.getParameter("action");
            if(action == null){
                action = "listAll";
            }
            
            if(action.equals("listAll")){
                String sql = "select * from Bill";
                ResultSet rs = dao.getData(sql);
                String title = "List Bill";
                request.setAttribute("kq", rs);
                request.setAttribute("title", title);
                dispath(request, response, "/Bill_View.jsp");
            }
            
            if(action.equals("update")){
                String submit = request.getParameter("submit");
                if(submit == null){
                    String id = request.getParameter("oid");
                    ResultSet rs = dao.getData("select * from Bill where oid = '" + id + "'");
                    request.setAttribute("ud", rs);
                    ResultSet rsCus = dao.getData("select Customer.cid from Bill inner join Customer\n"
                            + "on Bill.cid = Customer.cid\n"
                            + "where Bill.oID = '" + id + "'");
                    request.setAttribute("rsCus", rsCus);
                    dispath(request, response, "/Bill_Update.jsp");
                }else{
                    String id = request.getParameter("oid");
                    String date = request.getParameter("date");
                    String cname = request.getParameter("cname");
                    String phone = request.getParameter("cphone");
                    String caddress = request.getParameter("caddress");
                    String total = request.getParameter("total");
                    String status = request.getParameter("status");
                    String cId = request.getParameter("cid");

                    int sta = Integer.parseInt(status);
                    double totalM = Double.parseDouble(total);

                    int CusId = Integer.parseInt(cId);

                    Bill obj = new Bill(id, date, cname, phone, caddress, totalM, sta, CusId);
                    int x = dao.update(obj, id);
                    if (x > 0) {
                        response.sendRedirect("ControllerBill_new");
                    }
                }
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
