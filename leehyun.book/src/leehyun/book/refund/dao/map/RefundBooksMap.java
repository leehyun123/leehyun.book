package leehyun.book.refund.dao.map;

import java.util.List;

import leehyun.book.refund.domain.RefundBooks;

public interface RefundBooksMap {
	List<RefundBooks> getRefundBooks(int refundNum);
	
	int addRefundBooks(RefundBooks refundBooks);
	
	int delRefundBooks(int refundNum);
}
