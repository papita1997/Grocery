package pojo;

public class AdminProductPojo {

	private String prodId;
	private String prodName;
	private int mrp;
	private int discount;
	private int totalPrice;
	private String description;
	private String is_avi;
	private String cat_id;
	private String prodImages;
	
	
	public String getProdId() {
		return prodId;
	}
	public void setProdId(String prodId) {
		this.prodId = prodId;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getMrp() {
		return mrp;
	}
	public void setMrp(int mrp) {
		this.mrp = mrp;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIs_avi() {
		return is_avi;
	}
	public void setIs_avi(String is_avi) {
		this.is_avi = is_avi;
	}
	public String getCat_id() {
		return cat_id;
	}
	public void setCat_id(String cat_id) {
		this.cat_id = cat_id;
	}
	public String getProdImages() {
		return prodImages;
	}
	public void setProdImages(String prodImages) {
		this.prodImages = prodImages;
	}
	public AdminProductPojo() {
		super();
	}

}
