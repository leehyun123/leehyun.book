package leehyun.book.book.dao;

import java.util.List;

import leehyun.book.book.domain.Book;

public interface BookDao {
	List<Book> getBooks();

	Book getBook(int isbn);

	boolean addBook(Book book);

	boolean updateBook(Book book);

	boolean delBook(int isbn);
}
