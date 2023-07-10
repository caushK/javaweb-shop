package shop.servlet;

import shop.dao.CartItemDAO;
import shop.dao.CommodityDao;

import shop.dao.impl.CartItemDAOImpl;
import shop.dao.impl.CommodityDaoImpl;

import shop.vo.CartItem;
import shop.vo.Commodity;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        ArrayList<CartItem> cartItemArrayList = new ArrayList<CartItem>();
        CartItemDAO cartItemDAO = new CartItemDAOImpl();
        try {
            cartItemArrayList = cartItemDAO.selectCartItemByCustomerID(username);
        } catch (Exception e) {
            e.printStackTrace();
        }






    }
}
