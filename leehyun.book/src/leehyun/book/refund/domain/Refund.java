package leehyun.book.refund.domain;

import java.sql.Date;

public class Refund {
	private int refundNum;
	private Date refundDate;
	private String refundStatus;
	private int orderNum;

	public Refund() {
	}

	public Refund(int refundNum, Date refundDate, String refundStatus, int orderNum) {
		this.refundNum = refundNum;
		this.refundDate = refundDate;
		this.refundStatus = refundStatus;
		this.orderNum = orderNum;
	}

	public int getRefundNum() {
		return refundNum;
	}

	public Date getRefundDate() {
		return refundDate;
	}

	public String getRefundStatus() {
		return refundStatus;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setRefundNum(int refundNum) {
		this.refundNum = refundNum;
	}

	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}

	public void setRefundStatus(String refundStatus) {
		this.refundStatus = refundStatus;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

}