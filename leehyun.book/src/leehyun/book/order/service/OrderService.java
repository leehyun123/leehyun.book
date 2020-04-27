package leehyun.book.order.service;

import java.util.List;

import leehyun.book.order.domain.Order;

public interface OrderService {
	List<Order> listOrders();
	List<Order> listUserOrders(int userNum);
	Order findOrder(int orderNum);
	boolean purchase(Order order);
	boolean correctOrder(Order order);
	boolean cancelOrder(int orderNum);
}

