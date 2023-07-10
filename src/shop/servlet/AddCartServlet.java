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

@WebServlet("/AddCartServlet")
public class AddCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CartItemDAO cartItemDAO = new CartItemDAOImpl();
        HttpSession session = request.getSession();
        CartItem cartItem = new CartItem();
        int flag=0;
        int commodityID = Integer.valueOf(request.getParameter("commodityID"));
        if(!request.getParameter("username").equals( "null")){
            String username = request.getParameter("username");
            try {
                cartItem = cartItemDAO.hasSameCommodity(request.getParameter("username"),commodityID);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (cartItem.getCartID()==null){
                try {
                    flag=cartItemDAO.addToShoppingCart(username,commodityID,1);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if (flag==1){
                    response.sendRedirect("./basket.jsp");
                }
            }
            else {
                try {
                    cartItemDAO.updateCommodityNum(username,commodityID,cartItem.getCommodityNum()+1);
                    response.sendRedirect("./basket.jsp");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        }else {
            response.sendRedirect("./register.jsp");
        }


    }


}
