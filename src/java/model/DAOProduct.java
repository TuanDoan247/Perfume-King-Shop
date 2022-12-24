package model;

import entity.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOProduct extends DBConnect {
//    DBConnect dbConn;
//    Connection connect;
//
//    public DAOProduct(DBConnect dbconn) {
//        this.dbConn=dbconn;
//        connect=dbconn.conn;
//    }
//    DAO: insert, update,delete,search(select)

    public int insertProduct(Product pro) {
        int n = 0;
        String sql = "insert into Product(pid,pname,quantity,price,image,description,status,cateID) "
                + "values('" + pro.getPid() + "','" + pro.getPname() + "'," + pro.getQuantity()
                + "," + pro.getPrice() + ",'" + pro.getImage() + "','" + pro.getDescription() + "'," + pro.getStatus() + ","
                + pro.getCateID() + ")";
        // System.out.println(sql);
        try {
            //Statemetn
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return n;
    }

    public int addProduct(Product pro) {
        int n = 0;
        String sql = "insert into Product(pid,pname,quantity,price,image,description,status,cateID) "
                + "values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            //            set parameter ?
//            pre.setDataType(index,value);
//            DataType is datatype of field (attribute of table)
//            index of position of ? start 1
//            value is value parameter (pro)
            pre.setString(1, pro.getPid());
            pre.setString(2, pro.getPname());
            pre.setInt(3, pro.getQuantity());
            pre.setDouble(4, pro.getPrice());
            pre.setString(5, pro.getImage());
            pre.setString(6, pro.getDescription());
            pre.setInt(7, pro.getStatus());
            pre.setInt(8, pro.getCateID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateProduct(Product pro) {
        int n = 0;
        String sql = "update Product set "
                + "pname='" + pro.getPname() + "', "
                + "quantity=" + pro.getQuantity() + ", "
                + "price=" + pro.getPrice() + ", "
                + "image='" + pro.getImage() + "',  "
                + "description='" + pro.getDescription() + "', "
                + "status=" + pro.getStatus() + ", "
                + "cateID=" + pro.getCateID() + "\n"
                + "where pid='" + pro.getPid() + "'";
        //code here
        Statement state;
        try {
            state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateQuantity(String id, int quan) {
        //code here
        int n = 0;
        String sql = "update Product set\n"
                + "quantity = quantity + " + quan + "\n"
                + "where pid = '" + id + "'";
        Statement state;
        try {
            state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int changeStatus(String id, int status) {
        //code here
        int n = 0;
        String ssql = "update product set status = " + status + " where pid = '" + id + "'";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(ssql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int removeProduct(String id) {
        int n = 0;
//        code here
        String sqlCheck = "select * from BillDetail where pid = '" + id + "'";
        ResultSet rs = getData(sqlCheck);
        try {
            if (rs.next()) {

            } else {
                String sql = "delete from Product where pid = '" + id + "'";
                Statement state = conn.createStatement();
                n = state.executeUpdate(sql);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    // Kiến thức buổi tiếp theo về Result and ArrayList
    public ArrayList<Product> getProduct(int id) {
        ArrayList<Product> arr = new ArrayList<Product>();

        String sql = "";
        
        if(id > 0){
            sql = "select * from Product where cateID = " + id;
        }else{
            sql = "select * from Product";
        }
        
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                String pid = rs.getString("pid"); // String pid = rs.getString(1);
                String pname = rs.getString(2); // String pname = rs.getString("pname");
                int quantity = rs.getInt(3);
                double price = rs.getDouble(4);
                String image = rs.getString("image");
                String des = rs.getString("description");
                int status = rs.getInt("status");
                int cateid = rs.getInt(8);
                Product pro = new Product(pid, pname, quantity, price, image, des, status, cateid);
                arr.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }

    public ResultSet getPrice(double from, double to) {
        String sql = "Select * from Product where price between " + from + " to " + to;
        return getData(sql);
    }

    public ResultSet getName(String name) {
        String sql = "Select * from Product where pname like '%" + name + "%'";
        return getData(sql);
    }

    public ResultSet SortByPriceASC(String name) {
        String sql = "select * from Product\n"
                + "order by\n"
                + "case\n"
                + "	when pname = '" + name + "' then price end asc";
        return getData(sql);
    }

    public ResultSet SortByPriceDESC(String name) {
        String sql = "select * from Product\n"
                + "order by\n"
                + "case\n"
                + "	when pname = '" + name + "' then price end desc";
        return getData(sql);
    }

    public void displayAll() {
        String sql = "select * from Product";
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String pid = rs.getString("pid"); // String pid = rs.getString(1);
                String pname = rs.getString(2); // String pname = rs.getString("pname");
                int quantity = rs.getInt(3);
                double price = rs.getDouble(4);
                String image = rs.getString("image");
                String des = rs.getString("description");
                int status = rs.getInt("status");
                int cateid = rs.getInt(8);
                Product pro = new Product(pid, pname, quantity, price, image, des, status, cateid);
                System.out.println(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        DAOProduct dao = new DAOProduct();

    }
}
