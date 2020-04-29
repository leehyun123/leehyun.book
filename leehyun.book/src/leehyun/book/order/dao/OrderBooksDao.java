package leehyun.book.order.dao;

import java.util.List;

import leehyun.book.order.domain.OrderBooks;

public interface OrderBooksDao {
	List<OrderBooks> getOrderBooks(int orderNum);

	int addOrderBooks(OrderBooks orderBooks);

	int delOrderBooks(int orderNum);
}
