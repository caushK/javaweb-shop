package shop.servlet;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

import shop.dao.UserDAO;
import shop.dao.impl.UserDAOImpl;
import shop.vo.User;

public class ChangeInfoServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException{  }
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException{
		User user = new User();
		String username = req.getParameter("username");
		String telephone = req.getParameter("telephone");
		String country = req.getParameter("country");
		String state = req.getParameter("state");
		String city = req.getParameter("city");
		String detailedAddress = req.getParameter("detailedAddress");
		
		user.setUsername(username);
		user.setTelephone(telephone);
		user.setCountry(country);
		user.setState(state);
		user.setCity(city);
		user.setDetailedAddress(detailedAddress);

		
		
		UserDAO dao = new UserDAOImpl();
		
		//判断信息不为空
		if(username.equals("") || telephone.equals("") || country.equals("") || 
				state.equals("") || city.equals("") || detailedAddress.equals("")||
				username.equals("null") || telephone.equals("null") || country.equals("null") ||
				state.equals("null") || city.equals("null") || detailedAddress.equals("null")){

			HttpSession session = req.getSession();
			session.setAttribute("info", "Your Information cannot be empty!");
			res.sendRedirect("./infoPage.jsp");
			
		}
		else{

			try{
				dao.userChangeInfo(user);
			}
			catch(Exception e){
				e.printStackTrace();
			}
			
			HttpSession session = req.getSession();
			session.setAttribute("info", "Information saved.");
			res.sendRedirect("./infoPage.jsp");
		}
	}
}
