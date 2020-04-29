package leehyun.book.refund.service;

import java.util.List;

import leehyun.book.refund.domain.RefundBooks;

public interface RefundBooksService {
	List<RefundBooks> listRefundBooks(int refundNum);
	
	boolean requestRefundBooks(RefundBooks refundBooks);
	
	boolean cancelRefundBooks(int refundNum);
}
