package leehyun.book.page.dao;

public interface PageDao {
	int getTotRowCnt();
	int getSearchRowCnt(String words);
}
