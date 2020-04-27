package leehyun.book.order.dao.map;

import java.util.List;

import leehyun.book.order.domain.Order;

public interface OrderMap {
	List<Order> getOrders();
	List<Order> getUserOrders(int userNum);
	List<Order> getAdminOrders(String deliveryStatus);
	int getOrderNum();
	Order getOrder(int orderNum);
	int addOrder(Order order);
	int updateOrder(Order order);
	int delOrder(int orderNum);
}


