package shop.dao;

import java.util.*;

import shop.vo.TotalOrder;
import shop.vo.SubOrder;

public interface OrderDAO {
	public ArrayList<TotalOrder> getTotalOrderInfo(TotalOrder order) throws Exception;
	public TotalOrder getTotalOrderInfoWithOrderBack(TotalOrder order) throws Exception;
	public void cancelOrder(SubOrder order) throws Exception;
	public ArrayList<SubOrder> getSubOrderInfo(TotalOrder order) throws Exception;
	public void confirmReceipt(SubOrder order) throws Exception;
	public String insertTotalOrder(TotalOrder totalOrder,int totalPrice,String id) throws Exception;
	public void insertSubOrder(int price, int commodityNum, int commodityid, int oneCommodityTPrice ,String totalmaxid,SubOrder subOrder) throws Exception;
}
