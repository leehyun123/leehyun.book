package leehyun.book.refund.dao.map;

import java.util.List;

import leehyun.book.refund.domain.Refund;

public interface RefundMap {
	List<Refund> getRefunds();
	
	List<Refund> getUserRefunds(int userNum);
	
	int addRefund(Refund refund);
	
	int updateRefund(Refund refund);
	
	int delRefund(int refundNum);
}
