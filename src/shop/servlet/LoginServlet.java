package shop.servlet;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

import shop.dao.UserDAO;
import shop.dao.impl.UserDAOImpl;
import shop.vo.User;

public class LoginServlet extends HttpServlet {
	private String userID;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException{  }
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException{
		User user = new User();
		user.setUsername(req.getParameter("username"));
		user.setPassword(req.getParameter("password"));
		
		UserDAO dao = new UserDAOImpl();

		int flag = 0;
		try{
			userID = dao.getUserID(user);
			flag = dao.queryByUsername(user);

		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		if(flag == 1){
			HttpSession session = req.getSession();
			session.setAttribute("userID",userID);
			session.setAttribute("username", user.getUsername());//鎵�鏈夌殑username鏀规垚id
			res.sendRedirect("./index.jsp");
		}
		else{
			HttpSession session = req.getSession();
			session.setAttribute("info", "The username or password you entered is incorrect!");
			res.sendRedirect("./infoPage.jsp");
		}
		
	}
		
}
