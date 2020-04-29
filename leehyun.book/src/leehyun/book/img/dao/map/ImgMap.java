package leehyun.book.img.dao.map;

import java.util.List;

import leehyun.book.img.domain.Img;

public interface ImgMap {
	List<Img> getImgs();

	Img getImg(int imgNum);

	int addImg(Img Img);

	int updateImg(Img img);
}