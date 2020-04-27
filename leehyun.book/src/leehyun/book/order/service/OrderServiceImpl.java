package leehyun.book.order.service;

import java.util.List;

import leehyun.book.order.dao.OrderDao;
import leehyun.book.order.dao.OrderDaoImpl;
import leehyun.book.order.domain.Order;

public class OrderServiceImpl implements OrderService{
	private OrderDao orderDao;
	
	public OrderServiceImpl() {
		this.orderDao = new OrderDaoImpl();
	}
	
	@Override
	public List<Order> listOrders(){
		return orderDao.getOrders();
	}
	
	@Override
	public List<Order> listUserOrders(int userNum){
		return orderDao.getUserOrders(userNum);
	}
	
	@Override
	public Order findOrder(int orderNum) {
		return orderDao.getOrder(orderNum);
	}
	
	@Override
	public boolean purchase(Order order) {
		return orderDao.addOrder(order)>0;
	}
	
	@Override
	public boolean correctOrder(Order order) {
		return orderDao.updateOrder(order)>0;
	}
	
	@Override
	public boolean cancelOrder(int orderNum) {
		return orderDao.delOrder(orderNum)>0;
	}
}

