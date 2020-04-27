package leehyun.book.book.dao.map;

import java.util.List;

import leehyun.book.book.domain.Book;

public interface BookMap {
	List<Book> getBooks();
	
	List<Book> getCart(List<String> str);

	Book getBook(long isbn);

	int addBook(Book book);

	int updateBook(Book book);

	int delBook(int isbn);
}