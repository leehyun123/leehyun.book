package leehyun.book.refund.service;

import java.util.List;

import leehyun.book.refund.domain.Refund;

public interface RefundService {
	List<Refund> listRefunds();
	
	List<Refund> listUserRefunds(int userNum);
	
	boolean requestRefund(Refund refund);
	
	boolean correctRefund(Refund refund);
	
	boolean cancelRefund(int refundNum);
}
