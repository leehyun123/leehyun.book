package leehyun.book.orderBooks.dao;

import java.util.List;

import leehyun.book.orderBooks.domain.OrderBooks;

public interface OrderBooksDao {
	List<OrderBooks> getOrderBooks(int orderNum);
	int addOrderBooks(OrderBooks orderBooks);
	int delOrderBooks(int orderNum);
}
