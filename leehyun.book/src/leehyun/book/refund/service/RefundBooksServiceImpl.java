package leehyun.book.refund.service;

import java.util.List;

import leehyun.book.refund.dao.RefundBooksDao;
import leehyun.book.refund.dao.RefundBooksDaoImpl;
import leehyun.book.refund.domain.RefundBooks;

public class RefundBooksServiceImpl implements RefundBooksService{
	private RefundBooksDao refundBooksDao;
	
	public RefundBooksServiceImpl() {
		this.refundBooksDao = new RefundBooksDaoImpl();
	}
	
	@Override
	public List<RefundBooks> listRefundBooks(int refundNum){
		return refundBooksDao.getRefundBooks(refundNum);
	}
	
	@Override
	public boolean requestRefundBooks(RefundBooks refundBooks) {
		return refundBooksDao.addRefundBooks(refundBooks)>0;
	}
	
	@Override
	public boolean cancelRefundBooks(int refundNum) {
		return refundBooksDao.delRefundBooks(refundNum)>0;
	}
}
