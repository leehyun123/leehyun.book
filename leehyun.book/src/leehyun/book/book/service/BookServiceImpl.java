package leehyun.book.book.service;

import java.util.List;

import leehyun.book.book.dao.BookDao;
import leehyun.book.book.dao.BookDaoImpl;
import leehyun.book.book.domain.Book;

public class BookServiceImpl implements BookService {

	private BookDao bookDao;

	public BookServiceImpl() {
		this.bookDao = new BookDaoImpl();
	}

	/* 도서 리스트 */
	@Override
	public List<Book> listBooks() {
		return bookDao.getBooks();
	}

	/* 장바구니 */
	@Override
	public List<Book> getCart(List<String> str) {
		return bookDao.getCart(str);
	}

	/* 도서 검색 */
	@Override
	public List<Book> searchBook(String words) {
		return bookDao.pickBook(words);
	}

	/* 도서 확인 */
	@Override
	public Book findBook(long isbn) {
		return bookDao.getBook(isbn);
	}

	/* 도서 추가 */
	@Override
	public boolean joinBook(Book book) {
		return bookDao.addBook(book);
	}

	/* 도서 수정 */
	@Override
	public boolean correctBook(Book book) {
		return bookDao.updateBook(book);
	}

	/* 도서 삭제 */
	@Override
	public boolean secede(int isbn) {
		return bookDao.delBook(isbn);
	}
}
