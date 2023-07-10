package shop.vo;

public class Commodity {
	private Integer commodityid;
	private String commodityname;
	private Integer price;
	private String Subclass;
	private String explain;
	private Integer Lnventory;
	private Integer businessid;
	private String Majorclass;
	private String img;
	public Commodity(){}
	public Commodity(Integer commodityid, String commodityname, Integer price){
		this.commodityid = commodityid;
		this.commodityname = commodityname;
		this.price = price;
	}
	public Commodity(Integer commodityid, String commodityname, Integer price, String subclass, String explain, Integer lnventory, Integer businessid, String majorclass, String img) {
		this.commodityid = commodityid;
		this.commodityname = commodityname;
		this.price = price;
		this.Subclass = subclass;
		this.explain = explain;
		this.Lnventory = lnventory;
		this.businessid = businessid;
		this.Majorclass = majorclass;
		this.img = img;
	}

    public Commodity(int customerid, int commodityid, int price, String subcalss, String explain, int inventory, int businessid, String majorclass, String img) {
    }

	public Commodity(int customerid, int commodityid, int price) {
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Integer getCommodityid() {
		return commodityid;
	}

	public void setCommodityid(Integer commodityid) {
		this.commodityid = commodityid;
	}

	public String getCommodityname() {
		return commodityname;
	}

	public void setCommodityname(String commodityname) {
		this.commodityname = commodityname;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getSubclass() {
		return Subclass;
	}

	public void setSubclass(String subclass) {
		Subclass = subclass;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public Integer getLnventory() {
		return Lnventory;
	}

	public void setLnventory(Integer lnventory) {
		Lnventory = lnventory;
	}

	public Integer getBusinessid() {
		return businessid;
	}

	public void setBusinessid(Integer businessid) {
		this.businessid = businessid;
	}

	public String getMajorclass() {
		return Majorclass;
	}

	public void setMajorclass(String majorclass) {
		Majorclass = majorclass;
	}
}
