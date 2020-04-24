package leehyun.book.book.service;

import java.util.List;

import leehyun.book.book.domain.Book;

public interface BookService {
	List<Book> listBooks();

	Book findBook(int isbn);

	boolean joinBook(Book book);

	boolean correctBook(Book book);

	boolean secede(int isbn);
}
