package shop.servlet;

import shop.dao.impl.CommodityDaoImpl;
import shop.vo.Commodity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/search" )
public class SearchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    	String commodityname=req.getParameter("commodityname");
        CommodityDaoImpl commodityDao = new CommodityDaoImpl();
        
        ArrayList<Commodity> list = commodityDao.searchCommodity(commodityname);

        HttpSession session=req.getSession();
        session.setAttribute("list",list);
        session.setAttribute("commodityname",commodityname);
        resp.sendRedirect("./search.jsp");
    }
}
