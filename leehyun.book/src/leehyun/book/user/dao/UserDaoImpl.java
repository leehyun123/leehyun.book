package leehyun.book.user.dao;

import java.util.ArrayList;
import java.util.List;

import leehyun.book.config.Configuration;
import leehyun.book.user.dao.map.UserMap;
import leehyun.book.user.domain.User;

public class UserDaoImpl implements UserDao {
	private List<User> users;
	boolean isCheck;
	UserMap mapper;

	public UserDaoImpl() {
		this.users = new ArrayList<User>();
		this.mapper = Configuration.getMapper(UserMap.class);
	}

	@Override
	public List<User> getUsers() {
		users = mapper.getUsers();
		return users;
	}

	@Override
	public User getUser(int userNo) {
		User user = mapper.getUser(userNo);
		return user;
	}

	@Override
	public boolean addUser(User user) {
		isCheck = false;
		int cnt = mapper.addUser(user);
		if (cnt > 0)
			isCheck = true;
		return isCheck;
	}

	@Override
	public boolean updateUser(User user) {
		isCheck = false;
		int cnt = mapper.updateUser(user);
		if (cnt > 0)
			isCheck = true;
		return isCheck;
	}

	@Override
	public boolean delUser(int userNo) {
		isCheck = false;
		int cnt = mapper.delUser(userNo);
		if (cnt > 0)
			isCheck = true;
		return isCheck;
	}
}