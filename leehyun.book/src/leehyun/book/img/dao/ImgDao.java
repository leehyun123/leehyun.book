package leehyun.book.img.dao;

import java.util.List;

import leehyun.book.img.domain.Img;

public interface ImgDao {
	List<Img> getImgs();

	Img getImg(int imgNum);

	boolean addImg(Img Img);

	boolean updateImg(Img img);
}