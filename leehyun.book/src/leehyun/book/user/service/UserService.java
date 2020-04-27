package leehyun.book.user.service;

import java.util.List;

import leehyun.book.user.domain.User;

public interface UserService {
	List<User> listUsers();

	User findUser(int userNo);

	boolean join(User user);

	boolean correctUser(User user);

	boolean secede(int userNo);
	
	User findPw(String userId);
}