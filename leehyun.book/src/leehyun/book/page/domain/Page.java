package leehyun.book.page.domain;

public class Page {
	private int currentPage; // 현재 페이지
	private int rowCnt; // 나열하는 목록 갯수

	public Page() {
		this(1, 8);
	}

	public Page(int currentPage) {
		this(currentPage, 8);
	}

	public Page(int currentPage, int rowCnt) {
		this.currentPage = currentPage;
		this.rowCnt = rowCnt;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getRowCnt() {
		return rowCnt;
	}

	public void setRowCnt(int rowCnt) {
		this.rowCnt = rowCnt;
	}
}
