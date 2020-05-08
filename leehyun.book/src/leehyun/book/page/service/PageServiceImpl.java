package leehyun.book.page.service;

import leehyun.book.page.dao.PageDao;
import leehyun.book.page.dao.PageDaoImpl;
import leehyun.book.page.domain.Page;

public class PageServiceImpl implements PageService {
	private PageDao pageDao;
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int totRowCnt;
	private int pageNumCnt;
	private Page page;
	
	public PageServiceImpl(int pageNumCnt, Page page) {
		this.pageDao = new PageDaoImpl();
		this.totRowCnt = getTotRowCnt();
		this.pageNumCnt = pageNumCnt;
		this.page = page;
		init();
	}
	
	public Page getPage() {
		return page;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	private int getTotRowCnt() {
		return pageDao.getTotRowCnt();
	}
	
	private void init() {
		// 한 화면에서 끝 페이지
		endPage = (int)(Math.ceil(page.getCurrentPage() / (double)pageNumCnt) * pageNumCnt);
		// 한 화면에서 시작 페이지
		startPage = (endPage-pageNumCnt) + 1;
		// 마지막 화면에서 끝 페이지
		int lastEndPage = (int)(Math.ceil(totRowCnt/(double)page.getRowCnt()));
		
		if(endPage > lastEndPage) endPage = lastEndPage;
		
		prev = startPage == 1 ? false:true;
		next = endPage * page.getRowCnt() >= totRowCnt ? false:true;
	}
}
