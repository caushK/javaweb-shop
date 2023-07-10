package shop.dao;


import shop.servlet.CartDeleteServlet;
import shop.vo.CartItem;
import shop.vo.Commodity;

import java.util.ArrayList;

public interface CartItemDAO {
    public int addToShoppingCart(String cartID, int commodityid,int commodityNum) throws Exception;
    public CartItem hasSameCommodity(String cartID, int commodityid) throws Exception;
    public void updateCommodityNum(String cartID, int commodityid,int commodityNum) throws Exception;
    public ArrayList<CartItem> selectCartItemByCustomerID(String cartID) throws Exception;
    public void CartDelete(String cartID, int commodityid) throws Exception;

    void changeCartProduct(String userId, int proID, int updown) throws Exception;


}
