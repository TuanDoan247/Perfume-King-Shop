package model;

import entity.admin;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DAOAdmin extends DBConnect {
    public boolean login(String username, String password){
        boolean isValid = false;
        String sql="select * from admin where username=? and password=?";
        try {
            PreparedStatement pre=conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            pre.setString(1, username);
            pre.setString(2, password);
            
            ResultSet rs = pre.executeQuery();
            
            if(rs.next()){
                isValid = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isValid;
    }
    
    public int insertAdmin(admin admin){
        int n = 0;
        String sql = "insert into admin (username, password)\n"
                + "values (?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, admin.getUsername());
            pre.setString(2, admin.getPassword());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int Update(admin admin, int id){
        int n = 0;
        String sql = "update admin set username = '" + admin.getUsername() + "', "
                + "password = '" + admin.getPassword() + "'\n"
                + "where adminID = " + id + "";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int remove(int id){
        int n = 0;
        String sql = "delete from admin where adminID = "+id+"";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return n;
    }
    
    public int changePassword(String password, int id){
        int n = 0;
        String sql = "update Admin  set password = '"+password+"' "
                + "where adminID = "+id+"";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return n;
    }
}
