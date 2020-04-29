package leehyun.book.refund.service;

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
	public List<Refund> listUserRefunds(int userNum){
		return refundDao.getUserRefunds(userNum);
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
