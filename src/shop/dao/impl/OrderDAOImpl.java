package shop.dao.impl;

import java.util.*;

import shop.dao.OrderDAO;
import shop.db.DBConnect;
import shop.vo.TotalOrder;
import shop.vo.SubOrder;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderDAOImpl implements OrderDAO {

	/**
	 * getTotalOrderInfo
	 */
	public ArrayList<TotalOrder> getTotalOrderInfo(TotalOrder order) throws Exception {
		
		String sql = "select * from totalorder where customerid=?";
		PreparedStatement pstmt = null;
		DBConnect dbc = null;
		
		ArrayList<TotalOrder> totalOrder = new ArrayList<TotalOrder>();
		
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, order.getCustomerId());
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				TotalOrder nowOrder = new TotalOrder();
				
				nowOrder.setTotalOrderId(rs.getString(1));
				nowOrder.setCustomerId(rs.getString(2));
				nowOrder.setTotalCost(rs.getString(3));
				nowOrder.setDate(rs.getString(4));
				nowOrder.setShippingCountry(rs.getString(5));
				nowOrder.setShippingState(rs.getString(6));
				nowOrder.setShippingCity(rs.getString(7));
				nowOrder.setShippingDetalAd(rs.getString(8));
				
				totalOrder.add(nowOrder);
			}
			rs.close();
			pstmt.close();
		}
		catch(SQLException e){
			System.out.println(e.getMessage());
		}
		finally{
			dbc.close();
		}
		return totalOrder;
	}

	
	/**
	 * cancelOrder
	 */
	public void cancelOrder(SubOrder order) throws Exception {

		String sql = "update suborder set state='cancelled' where SubOrderid=?";
		PreparedStatement pstmt = null;
		DBConnect dbc = null;
		
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, order.getSubOrderid());
			
			pstmt.executeUpdate();
			pstmt.close();
		}
		catch(SQLException e){
			System.out.println(e.getMessage());
		}
		finally{
			dbc.close();
		}
	}


	/**
	 * getTotalOrderInfoWithOrderBack
	 */
	public TotalOrder getTotalOrderInfoWithOrderBack(TotalOrder order)
			throws Exception {
		
		String sql = "select * from totalorder where totalorderid=?";
		PreparedStatement pstmt = null;
		DBConnect dbc = null;
		
		TotalOrder totalOrder = new TotalOrder();
		
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, order.getTotalOrderId());
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {		
				totalOrder.setTotalOrderId(rs.getString(1));
				totalOrder.setCustomerId(rs.getString(2));
				totalOrder.setTotalCost(rs.getString(3));
				totalOrder.setDate(rs.getString(4));
				totalOrder.setShippingCountry(rs.getString(5));
				totalOrder.setShippingState(rs.getString(6));
				totalOrder.setShippingCity(rs.getString(7));
				totalOrder.setShippingDetalAd(rs.getString(8));
			
			}
			rs.close();
			pstmt.close();
		}
		catch(SQLException e){
			System.out.println(e.getMessage());
		}
		finally{
			dbc.close();
		}
		return totalOrder;
	}
	
	/**
	 * getSubOrderInfo
	 */
	public ArrayList<SubOrder> getSubOrderInfo(TotalOrder order) throws Exception {
		
		String sql = "select s.SubOrderid,s.commodityid,s.number,s.price,"
				+ "s.spend,s.Shippingaddress,s.state,s.totalorderid,"
				+ "c.commodityname,c.img from suborder s,commodity c "
				+ "where totalorderid=? and s.commodityid=c.commodityid";
		PreparedStatement pstmt = null;
		DBConnect dbc = null;
		
		ArrayList<SubOrder> subOrder = new ArrayList<SubOrder>();
		
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, order.getTotalOrderId());
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				SubOrder nowOrder = new SubOrder();
				
				nowOrder.setSubOrderid(rs.getString("SubOrderid"));
				nowOrder.setCommodityid(rs.getString("commodityid"));
				nowOrder.setNumber(rs.getString("number"));
				nowOrder.setPrice(rs.getString("price"));
				nowOrder.setSpend(rs.getString("spend"));
				nowOrder.setShippingaddress(rs.getString("Shippingaddress"));
				nowOrder.setState(rs.getString("state"));
				nowOrder.setTotalorderid(rs.getString("totalorderid"));
				nowOrder.setCommodityname(rs.getString("commodityname"));
				nowOrder.setPicture(rs.getString("img"));
				
				subOrder.add(nowOrder);
			}
			rs.close();
			pstmt.close();
		}
		catch(SQLException e){
			System.out.println(e.getMessage());
		}
		finally{
			dbc.close();
		}
		return subOrder;
	}
	
	/**
	 * confirmReceipt
	 */
	public void confirmReceipt(SubOrder order) throws Exception {

		String sql = "update suborder set state='completed' where SubOrderid=?";
		PreparedStatement pstmt = null;
		DBConnect dbc = null;

		
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, order.getSubOrderid());
			
			pstmt.executeUpdate();
			pstmt.close();
		}
		catch(SQLException e){
			System.out.println(e.getMessage());
		}
		finally{
			dbc.close();
		}
	}

	@Override
	public String insertTotalOrder(TotalOrder totalOrder, int totalPrice, String id) throws Exception {
		String sql = "insert into totalorder values (?,?,?,?,?,?,?,?)";
		PreparedStatement ps = null;
		PreparedStatement pst = null;
		PreparedStatement pstmt = null;
		DBConnect dbco = null;
		DBConnect dbc = null;

		String maxid = "";
		int userID = Integer.valueOf(id);

		try{
			if(userID != 0 &&  totalPrice >= 0 &&totalOrder.getShippingCity().length() > 0 && totalOrder.getShippingCountry().length() > 0
			&& totalOrder.getShippingDetalAd().length() > 0 && totalOrder.getShippingState().length() > 0 ){
				dbco = new DBConnect();
				pst = dbco.getConnection().prepareStatement("select * from totalorder where totalorderid=?");
				pst.setString(1,totalOrder.getTotalOrderId());
				ResultSet res = pst.executeQuery();
				boolean next = res.next();

				if(next == false) {
					dbc = new DBConnect();
					ps = dbc.getConnection().prepareStatement("select max(totalorderid) from totalorder");
					ResultSet rs = ps.executeQuery();
					rs.next();
					maxid = String.valueOf(rs.getInt(1) + 1);

					Date date = new Date();
					SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

					pstmt = dbc.getConnection().prepareStatement(sql);
					
					pstmt.setString(1, maxid);
					pstmt.setString(2, id);
					pstmt.setString(3, String.valueOf(totalPrice));
					pstmt.setString(4, fm.format(date));		
					pstmt.setString(5, totalOrder.getShippingCountry());
					pstmt.setString(6, totalOrder.getShippingState());
					pstmt.setString(7, totalOrder.getShippingCity());
					pstmt.setString(8, totalOrder.getShippingDetalAd());

					pstmt.executeUpdate();

					rs.close();
					pstmt.close();
					ps.close();
					dbc.close();
				}

				res.close();
				pst.close();
				dbco.close();
			}
		}
		catch(SQLException e){
			System.out.println(e.getMessage());
		}


		return  maxid;
	}

	@Override
	public void insertSubOrder(int price, int commodityNum, int commodityid, int oneCommodityTPrice, String totalmaxid, SubOrder subOrder) throws Exception {
		String sql = "insert into suborder values (?,?,?,?,?,?,?,?)";
		PreparedStatement ps = null;
		PreparedStatement pst = null;
		PreparedStatement pstmt = null;
		DBConnect dbco = null;
		DBConnect dbc = null;

		try{
			if(price >= 0 &&  oneCommodityTPrice >= 0 && commodityNum > 0 && commodityid != 0 && totalmaxid.length() > 0){
				dbco = new DBConnect();
				pst = dbco.getConnection().prepareStatement("select * from suborder where SubOrderid=?");
				pst.setString(1,subOrder.getSubOrderid());
				ResultSet res = pst.executeQuery();
				boolean next = res.next();

				if(next == false) {
					dbc = new DBConnect();
					ps = dbc.getConnection().prepareStatement("select max(SubOrderid) from suborder");
					ResultSet rs = ps.executeQuery();
					rs.next();
					String maxid = String.valueOf(rs.getInt(1) + 1);

					pstmt = dbc.getConnection().prepareStatement(sql);

					pstmt.setString(1, maxid);
					pstmt.setString(2, String.valueOf(commodityid));
					pstmt.setString(3, String.valueOf(commodityNum));
					pstmt.setString(4, String.valueOf(price));
					pstmt.setString(5, String.valueOf(oneCommodityTPrice));
					pstmt.setString(6, "addr");
					pstmt.setString(7, "Ordered");
					pstmt.setString(8, totalmaxid);

					pstmt.executeUpdate();

					rs.close();
					pstmt.close();
					ps.close();
					dbc.close();
				}

				res.close();
				pst.close();
				dbco.close();
			}
		}
		catch(SQLException e){
			System.out.println(e.getMessage());
		}

	}


}
