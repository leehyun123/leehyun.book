package leehyun.book.refund.dao;

import java.util.List;

import leehyun.book.config.Configuration;
import leehyun.book.refund.dao.map.RefundBooksMap;
import leehyun.book.refund.domain.RefundBooks;

public class RefundBooksDaoImpl implements RefundBooksDao{
	private RefundBooksMap refundBooksMapper;
	
	public RefundBooksDaoImpl() {
		this.refundBooksMapper = Configuration.getMapper(RefundBooksMap.class);
	}
	
	@Override
	public List<RefundBooks> getRefundBooks(int refundNum){
		return refundBooksMapper.getRefundBooks(refundNum);
	}
	
	@Override
	public int addRefundBooks(RefundBooks refundBooks) {
		return refundBooksMapper.addRefundBooks(refundBooks);
	}
	
	@Override
	public int delRefundBooks(int refundNum) {
		return refundBooksMapper.delRefundBooks(refundNum);
	}
}
