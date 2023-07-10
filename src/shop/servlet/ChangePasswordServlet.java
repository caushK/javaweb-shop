package shop.servlet;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

import shop.dao.UserDAO;
import shop.dao.impl.UserDAOImpl;
import shop.vo.User;

public class ChangePasswordServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException{  }
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException{
		User user = new User();
		user.setUsername(req.getParameter("username"));
		user.setPassword(req.getParameter("newPassword1"));
		String newPassword1 = req.getParameter("newPassword1");
		String newPassword2 = req.getParameter("newPassword2");
		
		UserDAO dao = new UserDAOImpl();
		
		if(newPassword1.equals(newPassword2)){
			
			if(newPassword1.equals("")){
				HttpSession session = req.getSession();
				session.setAttribute("info", "Password cannot be empty!");
				res.sendRedirect("./infoPage.jsp");
			}
			else{
				
				try{
					dao.userChangePassword(user);
				}
				catch(Exception e){
					e.printStackTrace();
				}
				
				HttpSession session = req.getSession();
				session.setAttribute("info", "Password modified successfully");
				res.sendRedirect("./infoPage.jsp");
			}

			
		}
		else{
			HttpSession session = req.getSession();
			session.setAttribute("info", "The two new passwords are inconsistent, please enter again!");
			res.sendRedirect("./infoPage.jsp");
		}
		
	}
}
