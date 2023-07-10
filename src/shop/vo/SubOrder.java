package shop.vo;

public class SubOrder {
	private String SubOrderid;
	private String commodityid;
	private String number;
	private String price;
	private String spend;
	private String Shippingaddress;
	private String state;
	private String totalorderid;
	private String commodityname;
	private String picture;
	
	public SubOrder() {}

	public String getSubOrderid() {
		return SubOrderid;
	}

	public void setSubOrderid(String subOrderid) {
		SubOrderid = subOrderid;
	}

	public String getCommodityid() {
		return commodityid;
	}

	public void setCommodityid(String commodityid) {
		this.commodityid = commodityid;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getSpend() {
		return spend;
	}

	public void setSpend(String spend) {
		this.spend = spend;
	}

	public String getShippingaddress() {
		return Shippingaddress;
	}

	public void setShippingaddress(String shippingaddress) {
		Shippingaddress = shippingaddress;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTotalorderid() {
		return totalorderid;
	}

	public void setTotalorderid(String totalorderid) {
		this.totalorderid = totalorderid;
	}

	public String getCommodityname() {
		return commodityname;
	}

	public void setCommodityname(String commodityname) {
		this.commodityname = commodityname;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

}
