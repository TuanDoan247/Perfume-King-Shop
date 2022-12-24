package controllerOnly;

import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOProduct;

@WebServlet(name = "ControllerProduct_new", urlPatterns = {"/ControllerProduct_new"})
public class ControllerProduct_new extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DAOProduct dao = new DAOProduct();
            
           
            
            String action = request.getParameter("action");
            if (action == null) {
                action = "listAll";
            }

            if (action.equals("listAll")) {
                //model
                ResultSet rs = dao.getData("select pid, pname, quantity, price, image, description, Product.status, Category.cateName\n"
                        + "from Product inner join Category\n"
                        + "on Product.cateID = Category.cateID\n");
                // date view
                request.setAttribute("kq", rs);
                // select view 
                RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/ControllerAdmin_control");
                dispatch.forward(request, response);
            }

            if (action.equals("update")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    String pid = request.getParameter("pid");
                    ResultSet rs = dao.getData("select * from Product where pid='" + pid + "'");
                    request.setAttribute("rs", rs);
                    ResultSet rsCate = dao.getData("select Category.cateID, cateName, Category.status\n"
                            + "from Category inner join Product \n"
                            + "on Category.cateID = Product.cateID\n"
                            + "where Product.pid = '"+pid+"'");
                    request.setAttribute("rsCate", rsCate);
                    dispath(request, response, "/Product_Update.jsp");
                } else {
                    String id = request.getParameter("pid");
                    String name = request.getParameter("pname");
                    String quantity = request.getParameter("quantity");
                    String price = request.getParameter("price");
                    String image = request.getParameter("image");
                    String des = request.getParameter("des");
                    String status = request.getParameter("status");
                    String cate = request.getParameter("cate");

                    int quan = Integer.parseInt(quantity);
                    double pri = Double.parseDouble(price);
                    int sta = Integer.parseInt(status);
                    int cateID = Integer.parseInt(cate);

                    Product obj = new Product(id, name, quan, pri, image, des, sta, cateID);
                    dao.updateProduct(obj);
//                    dispath(request, response, "/ControllerProduct_new");  // lệnh này tạm để đây chưa biết làm gì
                    response.sendRedirect("ControllerProduct_new");
                }
            }

            if (action.equals("delete")) {
                String pid = request.getParameter("pid");
                dao.removeProduct(pid);
                response.sendRedirect("ControllerProduct_new");
            }

            if (action.equals("insert")) {
                String submit = request.getParameter("submit");
                if(submit == null){
                ResultSet rsCate = dao.getData("select * from Category");
                request.setAttribute("rsCate", rsCate);
                dispath(request, response, "/Product_Insert.jsp");
                }else{
                    String id = request.getParameter("pid");
                    String name = request.getParameter("pname");
                    String quantity = request.getParameter("quantity");
                    String price = request.getParameter("price");
                    String image = request.getParameter("image");
                    String des = request.getParameter("des");
                    String status = request.getParameter("status");
                    String cate = request.getParameter("cate");

                    int quan = Integer.parseInt(quantity);
                    double pri = Double.parseDouble(price);
                    int sta = Integer.parseInt(status);
                    int cateID = Integer.parseInt(cate);

                    Product obj = new Product(id, name, quan, pri, image, des, sta, cateID);
                    dao.addProduct(obj);
//                    dispath(request, response, "/ControllerProduct_new");  // lệnh này tạm để đây chưa biết làm gì
                    response.sendRedirect("ControllerProduct_new");
                }
            }
        }
    }

    public void dispath(HttpServletRequest request,
            HttpServletResponse response, String url) throws ServletException, IOException {
        RequestDispatcher disp = request.getRequestDispatcher(url);
        //run
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
