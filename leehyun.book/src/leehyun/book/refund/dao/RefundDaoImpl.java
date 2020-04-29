package leehyun.book.refund.dao;

import java.util.List;

import leehyun.book.config.Configuration;
import leehyun.book.refund.dao.map.RefundMap;
import leehyun.book.refund.domain.Refund;

public class RefundDaoImpl implements RefundDao{
	private RefundMap refundMapper;
	
	public RefundDaoImpl() {
		this.refundMapper = Configuration.getMapper(RefundMap.class);
	}
	
	@Override
	public List<Refund> getRefunds(){
		return refundMapper.getRefunds();
	}
	
	@Override
	public List<Refund> getUserRefunds(int userNum){
		return refundMapper.getUserRefunds(userNum);
	}
	
	@Override
	public int addRefund(Refund refund) {
		return refundMapper.addRefund(refund);
	}
	
	@Override
	public int updateRefund(Refund refund) {
		return refundMapper.updateRefund(refund);
	}
	
	@Override
	public int delRefund(int refundNum) {
		return refundMapper.delRefund(refundNum);
	}
}
