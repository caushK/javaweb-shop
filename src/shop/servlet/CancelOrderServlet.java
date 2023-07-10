package shop.servlet;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

import shop.dao.OrderDAO;
import shop.dao.impl.OrderDAOImpl;
import shop.vo.SubOrder;

public class CancelOrderServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException{ 

	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException{
		SubOrder order = new SubOrder();
		
		order.setSubOrderid(req.getParameter("subOrderId"));
		
		OrderDAO dao = new OrderDAOImpl();

		try{
			dao.cancelOrder(order);
		}
		catch(Exception e){
			e.printStackTrace();
		}

		HttpSession session = req.getSession();
		session.setAttribute("info", "This order has been cancelled.");
		res.sendRedirect("./infoPage.jsp");

	}
}
