package leehyun.book.refund.domain;

public class RefundBooks {
	private int refundCnt;
	private int refundNum;
	private long isbn;

	public RefundBooks() {
	}
	
	public RefundBooks(int refundCnt, int refundNum, long isbn) {
		this.refundCnt = refundCnt;
		this.refundNum = refundNum;
		this.isbn = isbn;
	}

	public int getRefundCnt() {
		return refundCnt;
	}

	public int getRefundNum() {
		return refundNum;
	}

	public long getIsbn() {
		return isbn;
	}

	public void setRefundCnt(int refundCnt) {
		this.refundCnt = refundCnt;
	}

	public void setRefundNum(int refundNum) {
		this.refundNum = refundNum;
	}

	public void setIsbn(long isbn) {
		this.isbn = isbn;
	}

}
