package shop.vo;

public class CartItem {
    private String cartID;
    private int commodityid;
    private int commodityNum;

    private String img;
    private String commodityname;
    private int price;

    public String getImg() { return img; }

    public void setImg(String img) { this.img = img; }

    public String getCommodityname() { return commodityname; }

    public void setCommodityname(String commodityname) { this.commodityname = commodityname; }

    public int getPrice() { return price; }

    public void setPrice(int price) { this.price = price; }

    public void setCommodityid(int commodityid) {
        this.commodityid = commodityid;
    }

    public void setCommodityNum(int commodityNum) {
        this.commodityNum = commodityNum;
    }

    public int getCommodityid() {
        return commodityid;
    }

    public int getCommodityNum() {
        return commodityNum;
    }

    public void setCartID(String cartID) {
        this.cartID = cartID;
    }

    public String getCartID() {
        return cartID;
    }
}
