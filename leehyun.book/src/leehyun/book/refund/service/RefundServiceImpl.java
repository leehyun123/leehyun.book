package leehyun.book.refund.service;

import java.util.HashMap;
import java.util.List;

import leehyun.book.refund.dao.RefundDao;
import leehyun.book.refund.dao.RefundDaoImpl;
import leehyun.book.refund.domain.Refund;

public class RefundServiceImpl implements RefundService{
	private RefundDao refundDao;
	
	public RefundServiceImpl() {
		this.refundDao = new RefundDaoImpl();
	}
	
	@Override
	public List<Refund> listRefunds(){
		return refundDao.getRefunds();
	}
	
	@Override
	public Refund findRefund(int refundNum){
		return refundDao.getRefund(refundNum);
	}
	
	@Override
	public List<Refund> listUserRefunds(int userNum){
		return refundDao.getUserRefunds(userNum);
	}
	
	@Override
	public List<Refund> listUserRefundsDate(int userNum, int date){
		HashMap<String, Object> map = new HashMap<>();
		map.put("userNum", userNum);
		map.put("date", date);
		return refundDao.getUserRefundsDate(map);
	}
	
	@Override
	public List<Refund> listUserRefundsWord(int userNum, String words){
		HashMap<String, Object> map = new HashMap<>();
		map.put("userNum", userNum);
		map.put("words", words);
		return refundDao.pickRefund(map);
	}
	
	@Override
	public List<Refund> listUserRefundsAdmin(String words){
		return refundDao.pickRefundAdmin(words);
	}
	
	@Override
	public List<Refund> listOrderRefunds(int orderNum){
		return refundDao.getOrderRefunds(orderNum);
	}
	
	@Override
	public int getRefundNum(){
		return refundDao.getRefundNum();
	}
	
	@Override
	public boolean requestRefund(Refund refund) {
		return refundDao.addRefund(refund)>0;
	}
	
	@Override
	public boolean correctRefund(Refund refund) {
		return refundDao.updateRefund(refund)>0;
	}
	
	@Override
	public boolean cancelRefund(int refundNum) {
		return refundDao.delRefund(refundNum)>0;
	}
}
