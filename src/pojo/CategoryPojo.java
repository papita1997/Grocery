package pojo;

public class CategoryPojo {
	private String catId;
	private String cName;
	
	
	public CategoryPojo(String catId, String cName) {
		super();
		this.catId = catId;
		this.cName = cName;
	}
	public String getCatId() {
		return catId;
	}
	public void setCatId(String catId) {
		this.catId = catId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public CategoryPojo() {
		super();
	}
	
}
