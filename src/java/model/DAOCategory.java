package model;

import entity.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DAOCategory extends DBConnect{
    public int insertCategory(Category cate){
        int n = 0;
        
        String sql = "insert into Category(cateName, status)" +
                     "values(?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, cate.getCateName());
            pre.setInt(2, cate.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    
    public int updateCategory(Category cate, int id){
        int n = 0;
        String sql = "update Category set "
                + "cateName='"+cate.getCateName()+"', "
                + "status="+cate.getStatus()+" "
                + "where cateID="+id+"";
        Statement state;
        try {
            state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int delete(int id){
        int n = 0;
        String sql = "delete from Category where cateID = "+id+"";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public ArrayList<Category> getCategory(){
        ArrayList<Category> arr = new ArrayList<Category>();
        
        String sql = "select * from Category";
        ResultSet rsCate = getData(sql);
        try{
            while(rsCate.next()){
                int cateid = rsCate.getInt(1);
                String cateName = rsCate.getString(2);
                int status = rsCate.getInt(3);
                Category cate = new Category(cateid, cateName, status);
                arr.add(cate);
            }
        }catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }
    
    public static void main(String[] args) {
        DAOCategory dao = new DAOCategory();
    }
}
