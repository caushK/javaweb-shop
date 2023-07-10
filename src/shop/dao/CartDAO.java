package shop.dao;

import shop.vo.Cart;

public interface CartDAO {
    public Cart getCartByUserId(String userId);



}
