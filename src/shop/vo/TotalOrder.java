package shop.vo;

public class TotalOrder {
	private String totalOrderId;
	private String customerId;
	private String totalCost;
	private String date;
	private String shippingCountry;
	private String shippingState;
	private String shippingCity;
	private String shippingDetalAd;//Abbreviation of "Detailed Address"
	
	public TotalOrder(){}

	public String getTotalOrderId() {
		return totalOrderId;
	}

	public void setTotalOrderId(String totalOrderId) {
		this.totalOrderId = totalOrderId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(String totalCost) {
		this.totalCost = totalCost;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getShippingCountry() {
		return shippingCountry;
	}

	public void setShippingCountry(String shippingCountry) {
		this.shippingCountry = shippingCountry;
	}

	public String getShippingState() {
		return shippingState;
	}

	public void setShippingState(String shippingState) {
		this.shippingState = shippingState;
	}

	public String getShippingCity() {
		return shippingCity;
	}

	public void setShippingCity(String shippingCity) {
		this.shippingCity = shippingCity;
	}

	public String getShippingDetalAd() {
		return shippingDetalAd;
	}

	public void setShippingDetalAd(String shippingDetalAd) {
		this.shippingDetalAd = shippingDetalAd;
	}

}
