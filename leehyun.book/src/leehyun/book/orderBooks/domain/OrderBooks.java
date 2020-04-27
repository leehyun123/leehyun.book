package leehyun.book.orderBooks.domain;

public class OrderBooks {
	private int orderCnt;
	private int orderNum;
	private int isbn;

	public OrderBooks() {
	}

	public OrderBooks(int orderCnt, int orderNum, int isbn) {
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

	public int getIsbn() {
		return isbn;
	}

	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}
}
