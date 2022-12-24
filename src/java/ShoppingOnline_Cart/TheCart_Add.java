package ShoppingOnline_Cart;

import ShoppingOnline_Cart.Cart_Item;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "TheCart_Add", urlPatterns = {"/TheCart_Add"})
public class TheCart_Add extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            ArrayList<Cart_Item> cart = null;

            if (session.getAttribute("cart") == null) {
                // chưa có giỏ hàng nào trong session
                cart = new ArrayList<>();
            } else {
                // đã có -> lấy lại ID Sesion
                cart = (ArrayList<Cart_Item>) session.getAttribute("cart");
            }

            
            
            if (action.equals("viewProd")) {

                String check = "";
                if (cart.isEmpty()) {
                    check = "true";
                    session.setAttribute("check", check);
                } else {
                    check = "false";
                    session.setAttribute("check", check);
                }
                request.getRequestDispatcher("/Project_ShowCart.jsp").forward(request, response);
            }

            if (action.equals("addProd")) {

                ArrayList<Product> listprod = (ArrayList<Product>) session.getAttribute("products");
                String pid = request.getParameter("pid");

                Product findProd = findByid(pid, listprod);

                if (findProd != null) {

                    //Kiểm tra xem trong giỏ hàng đã có sản phẩm này chưa?
                    boolean check = false;
                    for (Cart_Item item : cart) {
                        if (item.getProductID().equals(findProd.getPid())) {
                            item.setQuantity(item.getQuantity() + 1);
                            item.setTotal(item.getPrice() * item.getQuantity());
                            check = true;
                        }
                    }

                    if (check == false) {
                        Cart_Item item = new Cart_Item();
                        item.setProductID(findProd.getPid());
                        item.setName(findProd.getPname());
                        item.setPrice(findProd.getPrice());
                        item.setQuantity(1);
                        item.setImage(findProd.getImage());
                        item.setDescription(findProd.getDescription());

                        double total = item.getPrice() * item.getQuantity();
                        item.setTotal(total);
                        cart.add(item);
                    }
                    session.setAttribute("cart", cart);
                }
                request.getRequestDispatcher("/Project_TrangChu.jsp").forward(request, response);
            }

            if(action.equals("updateNewQuan")){
                ArrayList<Cart_Item> listCart = (ArrayList<Cart_Item>) session.getAttribute("cart");
                String id = request.getParameter("id");
                for(Cart_Item item: listCart){
                    if(item.getProductID().equals(id)){
                        int quantity = item.getQuantity();
                        quantity++;
                        item.setQuantity(quantity);
                        item.setTotal(item.getPrice() * item.getQuantity());
                        request.getRequestDispatcher("/Project_ShowCart.jsp").forward(request, response);
                    }
                }
                
            }
            
            if (action.equals("prodDetail")) {
                String check = "";
                if (cart.isEmpty()) {
                    check = "true";
                    session.setAttribute("check", check);
                } else {
                    check = "false";
                    session.setAttribute("check", check);
                }
                ArrayList<Product> listprod = (ArrayList<Product>) session.getAttribute("products");
                String pid = request.getParameter("pid");

                Product findProd = findByid(pid, listprod);

                session.setAttribute("Prod", findProd);
                request.getRequestDispatcher("/Project_ShowDetailProduct.jsp").forward(request, response);
            }
        }
    }

    Product findByid(String id, ArrayList<Product> list) {
        Product result = null;
        for (Product pro : list) {
            if (pro.getPid().equals(id)) {
                result = pro;
                break;
            }
        }
        return result;
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
