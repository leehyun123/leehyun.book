package leehyun.book.order.dao.map;

import java.util.List;

import leehyun.book.order.domain.OrderBooks;

public interface OrderBooksMap {
	List<OrderBooks> getOrderBooks(int orderNum);

	int addOrderBooks(OrderBooks orderBooks);

	int delOrderBooks(int orderNum);
}
