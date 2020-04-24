package leehyun.book.book.dao;

import java.util.ArrayList;
import java.util.List;

import leehyun.book.book.dao.map.BookMap;
import leehyun.book.book.domain.Book;
import leehyun.book.config.Configuration;

public class BookDaoImpl implements BookDao {

	private List<Book> books;
	boolean isCheck;
	BookMap mapper;

	public BookDaoImpl() {
		this.books = new ArrayList<Book>();
		this.mapper = Configuration.getMapper(BookMap.class);
	}

	/* 도서 리스트 */
	@Override
	public List<Book> getBooks() {
		return books = mapper.getBooks();
	}

	/* 도서 확인 */
	@Override
	public Book getBook(int isbn) {
		Book book = mapper.getBook(isbn);
		return book;
	}

	/* 도서 추가 */
	@Override
	public boolean addBook(Book book) {
		isCheck = false;
		int cnt = mapper.addBook(book);
		if (cnt > 0)
			isCheck = true;
		return isCheck;
	}

	/* 도서 수정 */
	@Override
	public boolean updateBook(Book book) {
		isCheck = false;
		int cnt = mapper.updateBook(book);
		if (cnt > 0)
			isCheck = true;
		return isCheck;
	}

	/* 도서 삭제 */
	@Override
	public boolean delBook(int isbn) {
		isCheck = false;
		int cnt = mapper.delBook(isbn);
		if (cnt > 0)
			isCheck = true;
		return isCheck;
	}
}
