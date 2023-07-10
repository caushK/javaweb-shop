package shop.servlet;

import shop.dao.CartItemDAO;
import shop.dao.impl.CartItemDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ChangeCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        int updown = Integer.parseInt(req.getParameter("updown"));
        int proID = Integer.parseInt(req.getParameter("proID"));
        CartItemDAO cartItemDAO = new CartItemDAOImpl();

        String userID = (String) session.getAttribute("username");
        try {
            cartItemDAO.changeCartProduct(userID, proID, updown);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

