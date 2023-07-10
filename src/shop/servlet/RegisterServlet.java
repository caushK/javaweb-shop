package shop.servlet;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

import shop.dao.UserDAO;
import shop.dao.impl.UserDAOImpl;
import shop.vo.User;

public class RegisterServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException{  }
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException{
		User user = new User();
		user.setUsername(req.getParameter("username"));
		user.setTelephone(req.getParameter("telephone"));
		user.setPassword(req.getParameter("password"));
		
		UserDAO dao = new UserDAOImpl();
		int flag = 0;
		try{
			flag = dao.userRegister(user);
		}
		catch(Exception e){
			e.printStackTrace();
		}

		
		if(flag == 1){
			HttpSession session = req.getSession();
			session.setAttribute("info", "Register success!");
			res.sendRedirect("./infoPage.jsp");
		}
		else if(flag == -1){
			HttpSession session = req.getSession();
			session.setAttribute("info", "This username has already been registered! Please register again.");
			res.sendRedirect("./infoPage.jsp");
		}
		else if(flag == 0){
			HttpSession session = req.getSession();
			session.setAttribute("info", "The information is incomplete! Please register again.");
			res.sendRedirect("./infoPage.jsp");
		}
		
	}
	
}
