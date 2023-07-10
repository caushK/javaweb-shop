package shop.dao.impl;

import shop.dao.UserDAO;
import shop.db.DBConnect;
import shop.vo.User;

import java.sql.*;

public class UserDAOImpl implements UserDAO {

	/**
	 * queryByUsername
	 */
	public int queryByUsername(User user) throws Exception {
		
		int flag = 0;

		String sql = "select * from customer where name=?";
		PreparedStatement pstmt = null;
		DBConnect dbc = null;
		
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, user.getUsername());
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString("password").equals(user.getPassword())){
					flag = 1;
				}
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
		return flag;
	}

	
	/**
	 * userRegister
	 */
	public int userRegister(User user) throws Exception {
		
		int flag = 0;

		String sql = "insert into customer values (?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = null;
		PreparedStatement pst = null;
		PreparedStatement pstmt = null;
		DBConnect dbco = null;
		DBConnect dbc = null;
		
		try{
			if(user.getUsername().length() > 0 && user.getPassword().length() > 0 && user.getTelephone().length() > 0){
				dbco = new DBConnect();
				pst = dbco.getConnection().prepareStatement("select * from customer where name=?");
				pst.setString(1, user.getUsername());
				ResultSet res = pst.executeQuery();
				boolean next = res.next();

				if(next == false){
					dbc = new DBConnect();
					ps = dbc.getConnection().prepareStatement("select max(customerid) from customer");
					ResultSet rs = ps.executeQuery();
					rs.next();
					String maxid = String.valueOf(rs.getInt(1)+1);
						
					pstmt = dbc.getConnection().prepareStatement(sql);
					
					pstmt.setString(1, maxid);
					pstmt.setString(2, user.getUsername());
					pstmt.setString(3, user.getPassword());
					pstmt.setString(4, user.getTelephone());
					pstmt.setString(5, user.getCountry());
					pstmt.setString(6, user.getState());
					pstmt.setString(7, user.getCity());
					pstmt.setString(8, user.getDetailedAddress());
					pstmt.setString(9, "1");
					
					pstmt.executeUpdate();
					
					rs.close();
					pstmt.close();
					ps.close();
					dbc.close();
					
					flag = 1;
				}
				else{
					flag = -1;
				}
				res.close();
				pst.close();
				dbco.close();
			}		
		}
		catch(SQLException e){
			System.out.println(e.getMessage());
		}
		return flag;
	}

	
	/**
	 * userChangePassword
	 */
	public void userChangePassword(User user) throws Exception {

		String sql = "update customer set password=? where name=?";
		PreparedStatement pstmt = null;
		DBConnect dbc = null;
		
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, user.getPassword());
			pstmt.setString(2, user.getUsername());
			
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
	 * userChangeInfo
	 */
	public void userChangeInfo(User user) throws Exception {
		
		String sql = "update customer set telephone=?, country=?, state=?, city=?, detailedAddress=? where name=?";
		PreparedStatement pstmt = null;
		DBConnect dbc = null;
		
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, user.getTelephone());
			pstmt.setString(2, user.getCountry());
			pstmt.setString(3, user.getState());
			pstmt.setString(4, user.getCity());
			pstmt.setString(5, user.getDetailedAddress());
			pstmt.setString(6, user.getUsername());
			
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
	 * getUserInfo
     * @param username
     */
	public User getUserInfo(User username) throws Exception {
		
		String sql = "select * from customer where name=?";
		PreparedStatement pstmt = null;
		DBConnect dbc = null;
		User nowUser = new User();
		
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, String.valueOf(username.getUsername()));
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				nowUser.setId(rs.getString(1));
				nowUser.setUsername(rs.getString(2));
				nowUser.setPassword(rs.getString(3));
				nowUser.setTelephone(rs.getString(4));
				nowUser.setCountry(rs.getString(5));
				nowUser.setState(rs.getString(6));
				nowUser.setCity(rs.getString(7));
				nowUser.setDetailedAddress(rs.getString(8));
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
		return nowUser;
	}

	@Override
	public String getUserID(User user) throws Exception {
		String sql = "select customerid from customer where name=?";
		PreparedStatement pstmt = null;
		DBConnect dbc = null;
		User nowUser = new User();
		String customerid = "";

		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, String.valueOf(user.getUsername()));

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				nowUser.setId(rs.getString(1));
			}
			customerid = nowUser.getId();


			rs.close();
			pstmt.close();
		}
		catch(SQLException e){
			System.out.println(e.getMessage());
		}
		finally{
			dbc.close();
		}
		return customerid;
	}

}
