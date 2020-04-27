package leehyun.book.order.dao;

import java.util.List;

import leehyun.book.config.Configuration;
import leehyun.book.order.dao.map.OrderMap;
import leehyun.book.order.domain.Order;

public class OrderDaoImpl implements OrderDao{
	private OrderMap orderMapper;
	
	public OrderDaoImpl() {
		this.orderMapper = Configuration.getMapper(OrderMap.class);
	}
	
	@Override
	public List<Order> getOrders(){
		return orderMapper.getOrders();
	}
	
	@Override
	public List<Order> getUserOrders(int userNum){
		return orderMapper.getUserOrders(userNum);
	}
	
	@Override
	public Order getOrder(int orderNum) {
		return orderMapper.getOrder(orderNum);
	}
	
	@Override
	public int addOrder(Order order) {
		return orderMapper.addOrder(order);
	}
	
	@Override
	public int updateOrder(Order order) {
		return orderMapper.updateOrder(order);
	}
	
	@Override
	public int delOrder(int orderNum) {
		return orderMapper.delOrder(orderNum);
	}
}
