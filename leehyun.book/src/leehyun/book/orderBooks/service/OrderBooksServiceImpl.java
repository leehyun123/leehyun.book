package leehyun.book.orderBooks.service;

import java.util.List;

import leehyun.book.orderBooks.dao.OrderBooksDao;
import leehyun.book.orderBooks.dao.OrderBooksDaoImpl;
import leehyun.book.orderBooks.domain.OrderBooks;

public class OrderBooksServiceImpl implements OrderBooksService {
	private OrderBooksDao orderBooksDao;

	public OrderBooksServiceImpl() {
		this.orderBooksDao = new OrderBooksDaoImpl();
	}

	@Override
	public List<OrderBooks> listOrderBooks(int orderNum) {
		return orderBooksDao.getOrderBooks(orderNum);
	}

	@Override
	public boolean purchaseOrderBooks(OrderBooks orderBooks) {
		return orderBooksDao.addOrderBooks(orderBooks) > 0;
	}

	@Override
	public boolean cancelOrderBooks(int orderNum) {
		return orderBooksDao.delOrderBooks(orderNum) > 0;
	}
}
