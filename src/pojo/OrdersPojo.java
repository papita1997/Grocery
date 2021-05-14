package pojo;

public class OrdersPojo {

	private String prodId;
	private String prodName;
	private int totalPrice;
	private String description;
	private String img;
	private String orderId;
	
	public OrdersPojo(String prodId, String prodName, int totalPrice, String description, String img, String orderId) {
		super();
		this.prodId = prodId;
		this.prodName = prodName;
		this.totalPrice = totalPrice;
		this.description = description;
		this.img = img;
		this.orderId = orderId;
	}
	public OrdersPojo() {
		
	}
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getOrderId() {
		return orderId;
	}
	
	
}
