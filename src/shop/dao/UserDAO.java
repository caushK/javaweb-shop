package shop.dao;

import shop.vo.User;

public interface UserDAO {
	public int queryByUsername(User user) throws Exception;
	public int userRegister(User user) throws Exception;
	public void userChangePassword(User user) throws Exception;
	public void userChangeInfo(User user) throws Exception;
	public User getUserInfo(User username) throws Exception;
	public String getUserID(User user) throws Exception;

	
}
