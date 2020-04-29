package leehyun.book.order.service;

import java.util.List; 

import leehyun.book.order.domain.OrderBooks;

public interface OrderBooksService {
	List<OrderBooks> listOrderBooks(int orderNum);

	boolean purchaseOrderBooks(OrderBooks orderBooks);

	boolean cancelOrderBooks(int orderNum);
}
