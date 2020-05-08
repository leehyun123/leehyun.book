package leehyun.book.book.service;

import java.util.List;

import leehyun.book.book.domain.Book;

public interface BookService {
	List<Book> listBooks();

	List<Book> getCart(List<String> str);

	List<Book> searchBook(String words);

	Book findBook(long isbn);

	boolean joinBook(Book book);

	boolean correctBook(Book book);

	boolean secede(long isbn);
}
