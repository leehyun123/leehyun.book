package leehyun.book.refund.dao;

import java.util.HashMap;
import java.util.List;

import leehyun.book.refund.domain.Refund;

public interface RefundDao {
	List<Refund> getRefunds();
	
	Refund getRefund(int refundNum);
	
	List<Refund> getUserRefunds(int userNum);
	
	List<Refund> getUserRefundsDate(HashMap<String, Object> map);
	
	List<Refund> pickRefund(HashMap<String, Object> map);
	
	List<Refund> pickRefundAdmin(String words);
	
	List<Refund> getOrderRefunds(int orderNum);
	
	int getRefundNum();
	
	int addRefund(Refund refund);
	
	int updateRefund(Refund refund);
	
	int delRefund(int refundNum);
}
