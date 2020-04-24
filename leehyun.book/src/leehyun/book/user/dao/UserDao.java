package leehyun.book.user.dao;

import java.util.List;

import leehyun.book.user.domain.User;

public interface UserDao {	
	List<User> getUsers();

	User getUser(int userNo);

	boolean addUser(User user);

	boolean updateUser(User user);

	boolean delUser(int userNo);
}