package leehyun.book.user.dao.map;

import java.util.List;

import leehyun.book.user.domain.User;

public interface UserMap {
	List<User> getUsers();

	User getUser(int userNo); 

	int addUser(User user);

	int updateUser(User user);
	
	int delUser(int userNo);
	
	User pwUser(String userId);
}