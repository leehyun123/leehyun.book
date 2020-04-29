package leehyun.book.orderBooks.service;

import java.util.List;

import leehyun.book.orderBooks.domain.OrderBooks;

public interface OrderBooksService {
	List<OrderBooks> listOrderBooks(int orderNum);

	boolean purchaseOrderBooks(OrderBooks orderBooks);

	boolean cancelOrderBooks(int orderNum);
}
