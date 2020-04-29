package leehyun.book.refund.dao;

import java.util.List;

import leehyun.book.refund.domain.RefundBooks;

public interface RefundBooksDao {
	List<RefundBooks> getRefundBooks(int refundNum);
	
	int addRefundBooks(RefundBooks refundBooks);
	
	int delRefundBooks(int refundNum);
}
