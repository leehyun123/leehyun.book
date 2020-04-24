package leehyun.book.user.domain;

public class OrderBooks {
	private int orderCnt;

	public OrderBooks(int orderCnt) {
		super();
		this.orderCnt = orderCnt;
	}

	public int getOrderCnt() {
		return orderCnt;
	}

	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}

}
