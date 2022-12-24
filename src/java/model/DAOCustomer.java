package model;

import entity.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOCustomer extends DBConnect{
    public int insertCustomer(Customer cus){
        int n = 0;
        String sql = "insert into Customer (cname, cphone, cAddress, username, password, status)" +
                     "values(?,?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, cus.getCname());
            pre.setString(2, cus.getCphone());
            pre.setString(3, cus.getcAddress());
            pre.setString(4, cus.getUsername());
            pre.setString(5, cus.getPassword());
            pre.setInt(6, cus.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int changePhone(String number, int id){
        int n = 0;
        String sql = "update Customer set cphone = '"+number+"' where cid = '"+id+"' ";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int  changeUsername(String name, int id){
        int n = 0;
        String sql = "update Customer set username = '"+name+"' where cid = '"+id+"' ";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int changePassword(String number, int id){
        int n = 0;
        String sql = "update Customer set password = '"+number+"' where cid = "+id+" ";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int updateCustomer(Customer cus, int id){
        int n=0;
        String sql = "update Customer set "
                + "cname='"+cus.getCname()+"', "
                + "cphone='"+cus.getCphone()+"', "
                + "cAddress='"+cus.getcAddress()+"', "
                + "username='"+cus.getUsername()+"', "
                + "password='"+cus.getPassword()+"', "
                + "status= "+ cus.getStatus() +""
                + "where cid = "+id+"";
        //code here
        Statement state;
        try {
            state = conn.createStatement();
            n=state.executeUpdate(sql);
        } catch (SQLException ex) {
           ex.printStackTrace();
        }
        return n;
    }
    
    public int remove(int id){
        int n = 0;
        String sql = "delete from Customer where cid = "+id+"";
        Statement state;
        try {
            state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }    
    // kien thuc buoi tiep theo
    public ArrayList<Customer> getCustomer(){
        ArrayList<Customer> arr = new ArrayList<Customer>();
        String sql = "select * from Customer";
        ResultSet rs = getData(sql);
        
        try {
            while(rs.next()){
               int cid = rs.getInt(1);
                String cname = rs.getString("cname");
                String cphone = rs.getString("cphone");
                String cAddress = rs.getString(4);
                String username = rs.getString(5);
                String password = rs.getString(6);
                int status = rs.getInt("status");
                Customer cus = new Customer(cid, cname, cphone, cAddress, username, password, status);
                arr.add(cus);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }
    
    public ResultSet getCname(String name){
        String sql = "select * from Customer where cname like '%"+name+"%'";
        return getData(sql);
    }
    
    public ResultSet getCphone(String name){
        String sql = "select cname, cphonefrom Customer where cname like '%"+name+"%' ";
        return getData(sql);
    }
    
    public ResultSet getAccount(String id){
        String sql = "select cname, username, password from Customer\n" +
                     "where cid like '%"+id+"%'";
        return getData(sql);
    }
    
    
    public void display(){
        String sql = "select * from Customer";
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                                   ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while(rs.next()){
                int cid = rs.getInt(1);
                String cname = rs.getString("cname");
                String cphone = rs.getString("cphone");
                String cAddress = rs.getString(4);
                String username = rs.getString(5);
                String password = rs.getString(6);
                int status = rs.getInt("status");
                Customer cus = new Customer(cid, cname, cphone, cAddress, username, password, status);
                System.out.println(cus);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void main(String[] args) {
        DAOCustomer dao = new DAOCustomer();
        
//        int n = dao.insertCustomer(new Customer("Tuan", "19001006", "Ha Noi", "TuanHansome", "Tuandeptrai", 1));
//        if( n > 0){
//            System.out.println("inserted");
//        }

//        int n = dao.changePhone("0389999678", 1);
//        if(n > 0){
//            System.out.println("Changed");
//        }

//        int n = dao.changeUsername("TuanVeryHandSome", 1);
//        if(n > 0){
//            System.out.println("Changed");
//        }

//        int n = dao.changePassword("TuanRatDeoTrai", 1);
//        if(n > 0){
//            System.out.println("Changed");
//        }

//          dao.display();
    }     
}
