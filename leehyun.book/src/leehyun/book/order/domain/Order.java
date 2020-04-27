package leehyun.book.order.domain;

import java.sql.Date;

public class Order {
	private int orderNum;
	private int userNum;
	private String receiver;
	private String baseAddr;
	private String detailAddr;
	private String receiverTel;
	private String request;
	private String paymentType;
	private Date orderDate;
	private int deliveryNum;
	private String deliveryStatus;

	public Order() {
	}

	public Order(int orderNum, int userNum, String receiver, String baseAddr, String detailAddr, String receiverTel,
			String request, String paymentType, Date orderDate, int deliveryNum, String deliveryStatus) {
		this.orderNum = orderNum;
		this.userNum = userNum;
		this.receiver = receiver;
		this.baseAddr = baseAddr;
		this.detailAddr = detailAddr;
		this.receiverTel = receiverTel;
		this.request = request;
		this.paymentType = paymentType;
		this.orderDate = orderDate;
		this.deliveryNum = deliveryNum;
		this.deliveryStatus = deliveryStatus;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public int getUserNum() {
		return userNum;
	}

	public String getReceiver() {
		return receiver;
	}

	public String getBaseAddr() {
		return baseAddr;
	}

	public String getDetailAddr() {
		return detailAddr;
	}

	public String getReceiverTel() {
		return receiverTel;
	}

	public String getRequest() {
		return request;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public int getDeliveryNum() {
		return deliveryNum;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public void setBaseAddr(String baseAddr) {
		this.baseAddr = baseAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	public void setReceiverTel(String receiverTel) {
		this.receiverTel = receiverTel;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public void setDeliveryNum(int deliveryNum) {
		this.deliveryNum = deliveryNum;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
}