package leehyun.book.book.dao;

import java.util.List;

import leehyun.book.book.domain.Book;

public interface BookDao {
	List<Book> getBooks();
	
	List<Book> getCart(List<String> str);

	List<Book> pickBook(String words);
	
	Book getBook(long isbn);

	boolean addBook(Book book);

	boolean updateBook(Book book);

	boolean delBook(long isbn);
}
