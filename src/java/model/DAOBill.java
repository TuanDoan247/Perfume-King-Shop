package model;

import entity.Bill;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOBill extends DBConnect {

    public int insertBill(Bill bill) {
        int n = 0;
        String sql = "insert into Bill (oID, dateCreate, cname, cphone, cAddress, total,status, cid)\n"
                + "values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, bill.getoID());
            pre.setString(2, bill.getDateofTime());
            pre.setString(3, bill.getCname());
            pre.setString(4, bill.getCphone());
            pre.setString(5, bill.getcAddress());
            pre.setDouble(6, bill.getTotalMoney());
            pre.setInt(7, bill.getStatus());
            pre.setInt(8, bill.getCid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int addBill(Bill bill) {
        int n = 0;
        String sql = "insert into Bill (oID, cname, cphone, cAddress, total, status, cid)\n"
                + "values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, bill.getoID());
            pre.setString(2, bill.getCname());
            pre.setString(3, bill.getCphone());
            pre.setString(4, bill.getcAddress());
            pre.setDouble(5, bill.getTotalMoney());
            pre.setInt(6, bill.getStatus());
            pre.setInt(7, bill.getCid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int changeName(String name, String id) {
        int n = 0;
        String sql = "update Bill set cname = '" + name + "' where oid = '" + id + "' ";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int changeAddress(String address, String id) {
        int n = 0;
        String sql = "update Bill set cAddress = '" + address + "' where oid = '" + id + "' ";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int changePhone(String number, String id) {
        int n = 0;
        String sql = "update Bill set cphone = '" + number + "' where oid = '" + id + "' ";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int update(Bill bill, String id) {
        int n = 0;
        String sql = "update Bill\n"
                + "set dateCreate='" + bill.getDateofTime() + "', "
                + "cname='" + bill.getCname() + "', "
                + "cphone='" + bill.getCphone() + "', "
                + "cAddress='" + bill.getcAddress() + "', "
                + "total=" + bill.getTotalMoney() + ", "
                + "status = " + bill.getStatus() + " \n"
                + "where oID = '" + id + "'";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }
    
    public int changeStatus(String id, int status) {
        //code here
        int n = 0;
        String ssql = "update Bill set status = " + status + " where oid = '" + id + "'";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(ssql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    // kiến thức buổi tiếp theo 
    public void displayAll() {
        String sql = "select * from Bill";
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String oID = rs.getString(1);
                String date = rs.getString(2);
                String cname = rs.getString(3);
                String cphone = rs.getString(4);
                String cAddress = rs.getString(5);
                double total = rs.getDouble(6);
                int status = rs.getInt(7);
                int cid = rs.getInt(8);
                Bill bill = new Bill(oID, date, cname, cphone, cAddress, total, status, cid);
                System.out.println(bill);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    private static final String alpha = "abcdefghijklmnopqrstuvwxyz";
    private static final String alphaUpperCase = alpha.toUpperCase();
    private static final String digits = "0123456789";
    private static final String ALPHA_NUMERIC = alphaUpperCase + digits;
    
    private static Random rand = new Random();

    public static int randomNumber(int min, int max){
        return rand.nextInt((max - min) + 1) + min;
    }
    
    public String randomAlphaNumber(){
        StringBuilder sb = new StringBuilder();
        for(int i=0; i<3; i++){
            int number = randomNumber(0, ALPHA_NUMERIC.length() - 1);
            char ch = ALPHA_NUMERIC.charAt(number);
            sb.append(ch);
        }
        return sb.toString();
    }
    
    public ArrayList<Bill> getBill(){
        ArrayList<Bill> arr = new ArrayList<Bill>();
        String sql = "select * from Bill";
        ResultSet rs = getData(sql);
        
        try {
            while(rs.next()){
                String oid = rs.getString(1);
                String date = rs.getString(2);
                String cname = rs.getString(3);
                String cphone = rs.getString(4);
                String caddress = rs.getString(5);
                double total = rs.getDouble(6);
                int status = rs.getInt(7);
                int cid = rs.getInt(8);
                Bill bill = new Bill(oid, date, cname, cphone, caddress, total, status, cid);
                arr.add(bill);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }

    public static void main(String[] args) {
        DAOBill dao = new DAOBill();
        
        dao.changeStatus("IWB", 0);
    }
}
