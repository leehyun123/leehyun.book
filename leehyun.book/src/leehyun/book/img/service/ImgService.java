package leehyun.book.img.service;

import java.util.List;

import leehyun.book.img.domain.Img;

public interface ImgService {
	List<Img> listImgs();

	Img findImg(int imgNum);

	boolean joinImg(Img Img);

	boolean correctImg(Img img);
}