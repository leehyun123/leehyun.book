package leehyun.book.book.dao.map;

import java.util.List;

import leehyun.book.book.domain.Book;
import leehyun.book.page.domain.Page;

public interface BookMap {
	List<Book> getBooks(Page page);
	
	List<Book> getCart(List<String> str);

	List<Book> pickBooks(String words);
	
	Book getBook(long isbn);

	int addBook(Book book);

	int updateBook(Book book);

	int delBook(long isbn);
}