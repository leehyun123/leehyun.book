package leehyun.book.user.service;

import java.util.List;

import leehyun.book.user.dao.UserDao;
import leehyun.book.user.dao.UserDaoImpl;
import leehyun.book.user.domain.User;

public class UserServiceImpl implements UserService {
	private UserDao userDao;

	public UserServiceImpl() {
		this.userDao = new UserDaoImpl();
	}

	@Override
	public List<User> listUsers() {
		return userDao.getUsers();
	}

	@Override
	public User findUser(int userNo) {
		return userDao.getUser(userNo);
	}

	@Override
	public boolean join(User user) {
		return userDao.addUser(user);
	}

	@Override
	public boolean correctUser(User user) {
		return userDao.updateUser(user);
	}

	@Override
	public boolean secede(int userNo) {
		return userDao.delUser(userNo);
	}
}