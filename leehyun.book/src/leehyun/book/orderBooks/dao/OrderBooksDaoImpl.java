package leehyun.book.orderBooks.dao;

import java.util.List;

import leehyun.book.config.Configuration;
import leehyun.book.orderBooks.dao.map.OrderBooksMap;
import leehyun.book.orderBooks.domain.OrderBooks;

public class OrderBooksDaoImpl implements OrderBooksDao{
	private OrderBooksMap orderBooksMapper;
	
	public OrderBooksDaoImpl() {
		this.orderBooksMapper = Configuration.getMapper(OrderBooksMap.class);
	}
	
	@Override
	public List<OrderBooks> getOrderBooks(int orderNum){
		return orderBooksMapper.getOrderBooks(orderNum);
	}
	
	@Override
	public int addOrderBooks(OrderBooks orderBooks) {
		return orderBooksMapper.addOrderBooks(orderBooks);
	}
	
	@Override
	public int delOrderBooks(int orderNum) {
		return orderBooksMapper.delOrderBooks(orderNum);
	}
}
