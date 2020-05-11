package leehyun.book.page.dao;

import leehyun.book.config.Configuration;
import leehyun.book.page.dao.map.PageMap;

public class PageDaoImpl implements PageDao {
	private PageMap pageMap;
	
	public PageDaoImpl() {
		this.pageMap = Configuration.getMapper(PageMap.class);
	}
	
	@Override
	public int getTotRowCnt() {
		return pageMap.getTotRowCnt();
	}
	
	@Override
	public int getSearchRowCnt(String words) {
		return pageMap.getSearchRowCnt(words);
	}
}
