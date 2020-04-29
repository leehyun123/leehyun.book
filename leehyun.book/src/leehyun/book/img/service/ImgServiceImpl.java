package leehyun.book.img.service;

import java.util.List;

import leehyun.book.img.dao.ImgDao;
import leehyun.book.img.dao.ImgDaoImpl;
import leehyun.book.img.domain.Img;

public class ImgServiceImpl implements ImgService {
	private ImgDao imgDao;

	public ImgServiceImpl() {
		this.imgDao = new ImgDaoImpl();
	}

	@Override
	public List<Img> listImgs() {
		return imgDao.getImgs();
	}

	@Override
	public Img findImg(int imgNum) {
		return imgDao.getImg(imgNum);
	}

	@Override
	public boolean joinImg(Img img) {
		return imgDao.addImg(img);
	}

	@Override
	public boolean correctImg(Img img) {
		return imgDao.updateImg(img);
	}
}