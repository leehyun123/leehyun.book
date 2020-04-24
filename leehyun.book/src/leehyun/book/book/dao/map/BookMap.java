package leehyun.book.book.dao.map;

import java.util.List;

import leehyun.book.book.domain.Book;

public interface BookMap {
	List<Book> getBooks();

	Book getBook(int isbn);

	int addBook(Book book);

	int updateBook(Book book);

	int delBook(int isbn);
}