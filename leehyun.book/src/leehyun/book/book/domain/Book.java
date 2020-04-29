package leehyun.book.book.domain;

import java.sql.Date;

public class Book {
	private long isbn;
	private String bookTitle;
	private String author;
	private String publisher;
	private Date publishDate;
	private int bookPrice;
	private String bookImg;
	private String bookOutline;

	public Book() {
	}

	public Book(long isbn, String bookTitle, String author, String publisher, Date publishDate, int bookPrice,
			String bookImg, String bookOutline) {
		this.isbn = isbn;
		this.bookTitle = bookTitle;
		this.author = author;
		this.publisher = publisher;
		this.publishDate = publishDate;
		this.bookPrice = bookPrice;
		this.bookImg = bookImg;
		this.bookOutline = bookOutline;
	}

	public long getisbn() {
		return isbn;
	}

	public String getbookTitle() {
		return bookTitle;
	}

	public String getauthor() {
		return author;
	}

	public String getpublisher() {
		return publisher;
	}

	public Date getpublishDate() {
		return publishDate;
	}

	public int getbookPrice() {
		return bookPrice;
	}

	public String getbookImg() {
		return bookImg;
	}

	public String getbookOutline() {
		return bookOutline;
	}

	public void setisbn(long isbn) {
		this.isbn = isbn;
	}

	public void setbookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public void setauthor(String author) {
		this.author = author;
	}

	public void setpublisher(String publisher) {
		this.publisher = publisher;
	}

	public void setpublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public void setbookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}

	public void setbookImg(String bookImg) {
		this.bookImg = bookImg;
	}

	public void setbookOutline(String bookOutline) {
		this.bookOutline = bookOutline;
	}

}