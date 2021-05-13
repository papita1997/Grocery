package pojo;

public class ShopProductPojo {
	private String productId;
	private String pName;
	private String pDesc;
	private int tPrice;
	private String isAvi;
	private String pImage;
	private String catname;
	private String unitId;
	
	
	
	public String getUnitId() {
		return unitId;
	}
	public void setUnitId(String unitId) {
		this.unitId = unitId;
	}
	public String getCatname() {
		return catname;
	}
	public void setCatname(String catname) {
		this.catname = catname;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpDesc() {
		return pDesc;
	}
	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}
	public int gettPrice() {
		return tPrice;
	}
	public void settPrice(int tPrice) {
		this.tPrice = tPrice;
	}
	public String getIsAvi() {
		return isAvi;
	}
	public void setIsAvi(String isAvi) {
		this.isAvi = isAvi;
	}
	public String getpImage() {
		return pImage;
	}
	public void setpImage(String pImage) {
		this.pImage = pImage;
	}
	public ShopProductPojo() {
		super();
	}
	
	

}
