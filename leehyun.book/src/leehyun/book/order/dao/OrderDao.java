package leehyun.book.order.dao;

import java.util.List;

import leehyun.book.order.domain.Order;

public interface OrderDao {
	List<Order> getOrders(); 		//주문정보목록
	List<Order> getUserOrders(int userNum);	//회원주문정보목록
	List<Order> getAdminOrders(String deliveryStatus);
	List<Order> pickOrder(String words); //주문정보검색
	int getOrderNum();
	Order getOrder(int orderNum);	//주문정보하나
	int addOrder(Order order);		//주문정보추가
	int updateOrder(Order order);	//주문정보수정
	int delOrder(int orderNum);		//주문정보삭제
}

