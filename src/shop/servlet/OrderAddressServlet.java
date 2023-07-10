package shop.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

import shop.dao.CartItemDAO;
import shop.dao.OrderDAO;
import shop.dao.impl.CartItemDAOImpl;
import shop.dao.impl.OrderDAOImpl;
import shop.vo.CartItem;
import shop.vo.TotalOrder;

import shop.dao.UserDAO;
import shop.dao.impl.UserDAOImpl;
import shop.vo.User;
import shop.vo.SubOrder;

@WebServlet(name = "OrderAddressServlet")
public class OrderAddressServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        TotalOrder totalOrder = new TotalOrder();
        User user = new User();
        SubOrder subOrder = new SubOrder();

        CartItem item = new CartItem();

        OrderDAO dao = new OrderDAOImpl();
        ArrayList<CartItem> cartItem = new ArrayList<>();
        cartItem = (ArrayList) session.getAttribute("cartItem");
        String userID = (String) session.getAttribute("userID");


        String maxid ="";
        int totalPrice = 0;
        int oneCommodityTPrice = 0;
        
        
		//判断信息不为空
		if(request.getParameter("country").equals("") || 
				request.getParameter("state").equals("") || request.getParameter("city").equals("") || 
				request.getParameter("detailedAddress").equals("")||
				request.getParameter("country").equals("null") ||
				request.getParameter("state").equals("null") || request.getParameter("city").equals("null") || 
				request.getParameter("detailedAddress").equals("null")){

			
			session.setAttribute("info", "Information of recipient cannot be empty!");
			response.sendRedirect("./infoPage.jsp");
			
		}
		//判断购物车不为空
		else if(cartItem.size() == 0) {
			session.setAttribute("info", "You haven't bought anything yet...");
			response.sendRedirect("./infoPage.jsp");
		}
		else{

        for(int i = 0;i < cartItem.size();i++){

            item = cartItem.get(i);
            int price = item.getPrice();
            int commodityNum = item.getCommodityNum();
            totalPrice += price*commodityNum;
        }

        user.setTelephone(request.getParameter("telephone"));
        totalOrder.setShippingCountry(request.getParameter("country"));
        totalOrder.setShippingState(request.getParameter("state"));
        totalOrder.setShippingCity(request.getParameter("city"));
        totalOrder.setShippingDetalAd(request.getParameter("detailedAddress"));

//totalOrder
        try {
            maxid = dao.insertTotalOrder(totalOrder,totalPrice,userID);
        } catch (Exception e) {
            e.printStackTrace();
        }

//subOrder
        for(int i = 0;i < cartItem.size();i++){

            item = cartItem.get(i);
            int price = item.getPrice();
            int commodityNum = item.getCommodityNum();
            int commodityid = item.getCommodityid();
            oneCommodityTPrice = price*commodityNum;
            try {
                dao.insertSubOrder(price,commodityNum,commodityid,oneCommodityTPrice,maxid,subOrder);
            } catch (Exception e) {
                e.printStackTrace();
            }
          //Delete when check and pay
            String username = item.getCartID();
            CartItemDAO cartItemDAO = new CartItemDAOImpl();
            try {
                cartItemDAO.CartDelete(username,commodityid);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        session.setAttribute("info", "Your order has been placed!");
        response.sendRedirect("./infoPage.jsp");
		}
    }
}
