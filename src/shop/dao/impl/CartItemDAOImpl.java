package shop.dao.impl;

import shop.dao.CartDAO;
import shop.dao.CartItemDAO;
import shop.db.DBConnect;
import shop.vo.Cart;
import shop.vo.CartItem;
import shop.vo.Commodity;
import shop.vo.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CartItemDAOImpl implements CartItemDAO {
    @Override
    public int addToShoppingCart(String cartID, int commodityid,int commodityNum) throws Exception {
        int flag = 0;
        String sql = "insert into cartitem values (?,?,?)";
        PreparedStatement ps = null;
        DBConnect dbc = null;
        try{
            dbc = new DBConnect();
            ps = dbc.getConnection().prepareStatement(sql);
            ps.setInt(2,commodityid);
            ps.setString(1,cartID);
            ps.setInt(3,commodityNum);
            ps.executeUpdate();
            flag = 1;
            ps.close();
            dbc.close();

        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
        return flag;

    }

    @Override
    public CartItem hasSameCommodity(String cartID, int commodityid) throws Exception {
        String sql = "select * from cartitem where cartID=? and commodityid=?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;
        CartItem cartItem = new CartItem();

        try{
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1, cartID);
            pstmt.setInt(2,commodityid);
            ResultSet rs = pstmt.executeQuery();
           if (rs.next()) {
               cartItem.setCartID(rs.getString("cartID"));
               cartItem.setCommodityid(rs.getInt("commodityid"));
               cartItem.setCommodityNum(rs.getInt("commodityNum"));
            }
            rs.close();
            pstmt.close();
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
        finally{
            dbc.close();
        }
        return cartItem;
    }

    @Override
    public void updateCommodityNum(String cartID, int commodityid, int commodityNum) throws Exception {
        String sql = "update cartitem set commodityNum=? where cartID=? and commodityid=?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try{
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setInt(1,commodityNum);
            pstmt.setString(2,cartID);
            pstmt.setInt(3,commodityid);
            pstmt.executeUpdate();
            pstmt.close();
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
        finally{
            dbc.close();
        }
    }


    @Override
    public ArrayList<CartItem> selectCartItemByCustomerID(String cartID) throws Exception {
            PreparedStatement pst = null;
            DBConnect dbco = null;
            String sql = "select cartID,img,commodityname,commodityNum,price,c.commodityid from cartitem c,commodity co where c.cartID=? and c.commodityid=co.commodityid";
            ArrayList<CartItem> cartItemArrayList = new ArrayList<CartItem>();

            try{
                dbco = new DBConnect();
                pst = dbco.getConnection().prepareStatement(sql);
                pst.setString(1,cartID );
                ResultSet res = pst.executeQuery();
                while (res.next()) {
                    CartItem cartItem = new CartItem();
                    cartItem.setCartID(res.getString("cartID"));
                    cartItem.setCommodityid(res.getInt("commodityid"));
                    cartItem.setCommodityNum(res.getInt("commodityNum"));

                    cartItem.setImg(res.getString("img"));
                    cartItem.setCommodityname(res.getString("commodityname"));
                    cartItem.setPrice(res.getInt("price"));

                    cartItemArrayList.add(cartItem);
                }
                res.close();
                pst.close();
                return cartItemArrayList;
            }
            catch(SQLException e){
                System.out.println(e.getMessage());
                return null;
            }
            finally{
                dbco.close();
            }

        }

    @Override
    public void CartDelete(String cartID, int commodityid) throws Exception {
        PreparedStatement pst = null;
        DBConnect dbco = null;
        String sql = "DELETE from cartitem where cartID=? and commodityid=?";


        try{
            dbco = new DBConnect();
            pst = dbco.getConnection().prepareStatement(sql);
            pst.setString(1,cartID );
            pst.setInt(2,commodityid);
            pst.executeUpdate();
            pst.close();
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
        finally{
            dbco.close();
        }

    }

    @Override
    public void changeCartProduct(String userId, int proID, int updown) throws Exception {
        PreparedStatement pst = null;
        DBConnect dbco = null;
        String sql = null;
        if(updown==1)
             sql = "update cartitem set commodityNum=commodityNum+1  where cartID=? and commodityid=?";
        else if(updown==-1)
             sql = "update cartitem set commodityNum=commodityNum-1  where cartID=? and commodityid=?";

        try{
            dbco = new DBConnect();
            pst = dbco.getConnection().prepareStatement(sql);
            pst.setString(1,userId );
            pst.setInt(2,proID);
            pst.executeUpdate();
            pst.close();
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        finally{
            dbco.close();
        }
    }
}
