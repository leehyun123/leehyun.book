package leehyun.book.order.dao;

import java.util.List;

import leehyun.book.order.domain.Order;

public interface OrderDao {
	List<Order> getOrders(); 		//주문정보목록
	Order getOrder(int orderNum);	//주문정보하나
	int addOrder(Order order);		//주문정보추가
	int updateOrder(Order order);	//주문정보수정
	int delOrder(int orderNum);		//주문정보삭제
}