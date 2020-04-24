package leehyun.book.user.domain;

public class Img {
	private int imgNum;
	private String imgUrl;

	public Img(int imgNum, String imgUrl) {
		this.imgNum = imgNum;
		this.imgUrl = imgUrl;
	}

	public int getImgNum() {
		return imgNum;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgNum(int imgNum) {
		this.imgNum = imgNum;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

}
