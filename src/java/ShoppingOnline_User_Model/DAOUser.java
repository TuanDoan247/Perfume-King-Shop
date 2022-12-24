package ShoppingOnline_User_Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.DBConnect;



public class DAOUser extends DBConnect{
    public boolean checkLoginAndSignUp(String username, String password){
        boolean isValid = false;
        try{
            String sql = "select * from Customer where username = ? and password = ?";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, password);
            
            ResultSet rs = pre.executeQuery();
            
            if(rs.next()){
                isValid = true;
            }else{
                isValid = false;
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return isValid;
    }
    
    
}
