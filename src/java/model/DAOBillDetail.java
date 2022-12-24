package model;

import entity.BillDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOBillDetail extends DBConnect {

    public int insertBillDetail(BillDetail billd) {
        int n = 0;
        String sql = "insert into BillDetail (pid, oID, quantity, price, total)\n"
                + "values (?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, billd.getPid());
            pre.setString(2, billd.getoID());
            pre.setInt(3, billd.getQuantity());
            pre.setInt(4, billd.getPriceMoney());
            pre.setInt(5, billd.getTotalMoney());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBillDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }


    public int changeQuantity(int number, String id1, String id2) {
        int n = 0;
        String sql = "update BillDetail set quantity="+number+", total = "+number+"*price\n"
                + "where pid = '" + id1 + "' and oID = '" + id2 + "'";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int changePrice(int number, String id1, String id2) {
        int n = 0;
        String sql = "update BillDetail set price = " + number + "\n"
                + "where pid = '" + id1 + "' and oID = '" + id2 + "'";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    //kien thuc buoi tiep theo
    public ArrayList<BillDetail> getBillDetail() {
        ArrayList<BillDetail> arr = new ArrayList<BillDetail>();
        String sql = "select * from BillDetail";
        ResultSet rs = getData(sql);

        try {
            while (rs.next()) {
                String pid = rs.getString("pID");
                String oid = rs.getString("oID");
                int quantity = rs.getInt(3);
                int price = rs.getInt(4);
                int total = rs.getInt(5);
                BillDetail billd = new BillDetail(pid, oid, quantity, price, total);
                arr.add(billd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBillDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }

    public ResultSet getName(String id1, String id2) {
        String sql = "Select * from BillDetail where pid like '%" + id1 + "%' and oID like '%" + id2 + "%'";
        return getData(sql);
    }

    public void display() {
        String sql = "select * from BillDetail";
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
                String pid = rs.getString("pID");
                String oid = rs.getString("oID");
                int quantity = rs.getInt(3);
                int price = rs.getInt(4);
                int total = rs.getInt(5);
                BillDetail billd = new BillDetail(pid, oid, quantity, price, total);
                System.out.println(billd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBillDetail.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void main(String[] args) {
        DAOBillDetail dao = new DAOBillDetail();

//        int n = dao.insertBillDetail(new BillDetail("C05","DVT", 200, 10000, 2000000));
//        if(n > 0){
//            System.out.println("inserted");
//        }
//        int n = dao.changeQuantity(8, "C05", "DVT");
//        if(n > 0){
//            System.out.println("chngeed Quantity");
//        }
    }
}
