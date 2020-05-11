package leehyun.book.book.service;
import java.util.List;

import leehyun.book.book.domain.Book;
import leehyun.book.page.domain.Page;

public interface BookService {
	List<Book> listBooks(Page page);

	List<Book> getCart(List<String> str);

	List<Book> searchBook(String words, Page page);

	Book findBook(long isbn);

	boolean joinBook(Book book);

	boolean correctBook(Book book);

	boolean secede(long isbn);
}
