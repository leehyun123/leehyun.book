package leehyun.book.order.domain;

public class OrderBooks {
	private int orderCnt;
	private int orderNum;
	private long isbn;

	public OrderBooks() {
	}

	public OrderBooks(int orderCnt, int orderNum, long isbn) {
		this.orderCnt = orderCnt;
		this.orderNum = orderNum;
		this.isbn = isbn;
	}

	public int getOrderCnt() {
		return orderCnt;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public long getIsbn() {
		return isbn;
	}

	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public void setIsbn(long isbn) {
		this.isbn = isbn;
	}
}
