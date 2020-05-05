package leehyun.book.order.dao.map;

import java.util.List;

import leehyun.book.order.domain.Order;

public interface OrderMap {
	List<Order> getOrders();

	List<Order> getUserOrders(int userNum);
	
	List<Order> getUserOrdersDate(int dat);
	
	List<Order> getAdminOrders(String deliveryStatus);

	List<Order> pickOrder(String words);

	int getOrderNum();

	Order getOrder(int orderNum);

	int addOrder(Order order);

	int updateOrder(Order order);
	
	int updateOrderCom();

	int delOrder(int orderNum);
}
