package leehyun.book.book.dao;

import java.util.List;

import leehyun.book.book.domain.Book;
import leehyun.book.page.domain.Page;

public interface BookDao {
	List<Book> getBooks(Page page);
	
	List<Book> getCart(List<String> str);

	List<Book> pickBook(String words);
	
	Book getBook(long isbn);

	boolean addBook(Book book);

	boolean updateBook(Book book);

	boolean delBook(long isbn);
}
