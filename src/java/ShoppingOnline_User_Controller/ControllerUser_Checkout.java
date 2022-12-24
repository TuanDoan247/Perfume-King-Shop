package ShoppingOnline_User_Controller;

import ShoppingOnline_Cart.Cart_Item;
import entity.Bill;
import entity.BillDetail;
import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAOBill;
import model.DAOBillDetail;
import model.DAOCustomer;

@WebServlet(name = "ControllerUser_Checkout", urlPatterns = {"/ControllerUser_Checkout"})
public class ControllerUser_Checkout extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //lấy vè session hiện tại
            HttpSession session = request.getSession();
            
            //xuất ra id từ username và lấy thông tin theo id
            int cid = 0;
 
            String username = (String) session.getAttribute("namelogin");
            DAOCustomer daoCus = new DAOCustomer();
            ArrayList<Customer> listCus = daoCus.getCustomer();
            for(Customer cus: listCus){
                if(cus.getUsername().equals(username)){
                    cid = cus.getCid();
                }
            }
            
            // lấy id oid ngẫu nhiên
            DAOBill daoBill = new DAOBill();
            String oidrand = daoBill.randomAlphaNumber();

            // lấy total price form cart
            ArrayList<Cart_Item> listCart = (ArrayList<Cart_Item>) session.getAttribute("cart");
            double sum = 0;
            for (int i = 0; i < listCart.size(); i++) {
                sum = sum + listCart.get(i).getTotal();
            }

            String submit = request.getParameter("submit");
            if (submit == null) {
                //lấy thông tin từ gốc từ Customer
                ResultSet rsCus = daoCus.getData("select * from Customer where cid=" + cid + "");
                request.setAttribute("rsCus", rsCus);
                request.getRequestDispatcher("/ShoppingOnline_Checkout_ShowBill.jsp").forward(request, response);
            }else{
                String cname = request.getParameter("cname");
                String cphone = request.getParameter("cphone");
                String caddress = request.getParameter("caddress");
                // Add dữ liệu trên vào Bill
                Bill objBill = new Bill(oidrand, cname, cphone, caddress, sum, 1, cid);
                daoBill.addBill(objBill);

                // Add dữ liệu vào BillDetail
                String oid = "";
                ArrayList<Bill> listBill = daoBill.getBill();
                for (Bill bill : listBill) {
                    if (bill.getCid() == cid) {
                        oid = bill.getoID();
                    }
                }

                DAOBillDetail daoBillDetail = new DAOBillDetail();
                for (int i = 0; i < listCart.size(); i++) {
                    String pid = listCart.get(i).getProductID();
                    int quantity = listCart.get(i).getQuantity();
                    int price = (int) listCart.get(i).getPrice();
                    int total = (int) listCart.get(i).getTotal();
                    BillDetail objBillDetail = new BillDetail(pid, oid, quantity, price, total);
                    daoBillDetail.insertBillDetail(objBillDetail);
                }
                
                listCart.removeAll(listCart);
           
                response.sendRedirect("Controller_TrangChu");
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
