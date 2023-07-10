package shop.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.applet.Applet;
import java.io.IOException;

import shop.dao.CartItemDAO;
import shop.dao.impl.CartItemDAOImpl;
import shop.vo.CartItem;


@WebServlet(name = "CartDeleteServlet")
public class CartDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CartItemDAO cartItemDAO = new CartItemDAOImpl();
        HttpSession session = request.getSession();
        CartItem cartItem = new CartItem();

        int commodityID = Integer.valueOf(request.getParameter("commodityID"));

            String username = request.getParameter("username");

            try {
                cartItemDAO.CartDelete(request.getParameter("username"),commodityID);
            } catch (Exception e) {
                e.printStackTrace();
            }

            session.setAttribute("username",username);
            response.sendRedirect("./basket.jsp");
    }
}
