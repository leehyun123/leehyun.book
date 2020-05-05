package leehyun.book.refund.service;

import java.util.List;

import leehyun.book.refund.domain.Refund;

public interface RefundService {
	List<Refund> listRefunds();
	
	Refund findRefund(int refundNum);
	
	List<Refund> listUserRefunds(int userNum);
	
	List<Refund> listUserRefundsDate(int userNum, int date);
	
	List<Refund> listUserRefundsWord(int userNum, String words);
	
	List<Refund> listUserRefundsAdmin(String words);
	
	List<Refund> listOrderRefunds(int orderNum);
	
	int getRefundNum();
	
	boolean requestRefund(Refund refund);
	
	boolean correctRefund(Refund refund);
	
	boolean cancelRefund(int refundNum);
}
