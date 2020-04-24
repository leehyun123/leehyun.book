package leehyun.book.user.domain;

import java.sql.Date;

public class Book {
   private String bookIsbn;
   private String bookTitle;
   private String author;
   private String publisher;
   private Date publishDate;
   private int bookPrice;
   private String bookImg;
   private String bookOutline;

   public Book() {
   }

   public Book(String bookIsbn, String bookTitle, String author, String publisher, Date publishDate, int bookPrice,
         String bookImg, String bookOutline) {
      this.bookIsbn = bookIsbn;
      this.bookTitle = bookTitle;
      this.author = author;
      this.publisher = publisher;
      this.publishDate = publishDate;
      this.bookPrice = bookPrice;
      this.bookImg = bookImg;
      this.bookOutline = bookOutline;
   }

   public String getbookIsbn() {
      return bookIsbn;
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

   public void setbookIsbn(String bookIsbn) {
      this.bookIsbn = bookIsbn;
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