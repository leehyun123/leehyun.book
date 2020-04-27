package leehyun.book.orderBooks.dao.map;

import java.util.List;

import leehyun.book.orderBooks.domain.OrderBooks;

public interface OrderBooksMap {
	List<OrderBooks> getOrderBooks(int orderNum);
	int addOrderBooks(OrderBooks orderBooks);
	int delOrderBooks(int orderNum);
}
