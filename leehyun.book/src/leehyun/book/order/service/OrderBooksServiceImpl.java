package leehyun.book.order.service;

import java.util.List;

import leehyun.book.order.dao.OrderBooksDao;
import leehyun.book.order.dao.OrderBooksDaoImpl;
import leehyun.book.order.domain.OrderBooks;

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
