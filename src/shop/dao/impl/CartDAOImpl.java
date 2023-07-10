package shop.dao.impl;

import shop.dao.CartDAO;
import shop.db.DBConnect;
import shop.vo.Cart;
import shop.vo.Commodity;
import shop.vo.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CartDAOImpl implements CartDAO {
    PreparedStatement pstmt = null;
    DBConnect dbc = null;
    ResultSet rs=null;
    ArrayList<Commodity> list=new ArrayList<>();

    @Override
    public Cart getCartByUserId(String userId) {
        try{
            dbc = new DBConnect();
            String sql = "select * from shoppingcart where customerid=?";
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1, userId);

            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                Commodity commodity = new Commodity();

            }
            pstmt.close();
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
        finally{
            dbc.close();
        }
        return null;
    }
}
