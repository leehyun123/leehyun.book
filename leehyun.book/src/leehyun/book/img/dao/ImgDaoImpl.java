package leehyun.book.img.dao;

import java.util.ArrayList;
import java.util.List;

import leehyun.book.config.Configuration;
import leehyun.book.img.dao.map.ImgMap;
import leehyun.book.img.domain.Img;

public class ImgDaoImpl implements ImgDao {
	private List<Img> imgs;
	boolean isCheck;
	ImgMap mapper;

	public ImgDaoImpl() {
		this.imgs = new ArrayList<Img>();
		this.mapper = Configuration.getMapper(ImgMap.class);
	}

	@Override
	public List<Img> getImgs() {
		imgs = mapper.getImgs();
		return imgs;
	}

	@Override
	public Img getImg(int imgNum) {
		Img img = mapper.getImg(imgNum);
		return img;
	}

	@Override
	public boolean addImg(Img img) {
		isCheck = false;
		int cnt = mapper.addImg(img);
		if (cnt > 0)
			isCheck = true;
		return isCheck;
	}

	@Override
	public boolean updateImg(Img img) {
		isCheck = false;
		int cnt = mapper.updateImg(img);
		if (cnt > 0)
			isCheck = true;
		return isCheck;
	}
}