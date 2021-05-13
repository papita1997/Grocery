package pojo;

public class ProductPojo {

		private String prodId;
		private String prodName;
		private int totalPrice;
		private String prodImages;
		
		
		public ProductPojo(String prodId, String prodName, int totalPrice, String prodImages) {
			super();
			this.prodId = prodId;
			this.prodName = prodName;
			this.totalPrice = totalPrice;
			this.prodImages = prodImages;
		}
		
		
		public ProductPojo() {
			super();
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
		public String getProdImages() {
			return prodImages;
		}
		public void setProdImages(String prodImages) {
			this.prodImages = prodImages;
		}
		
}
