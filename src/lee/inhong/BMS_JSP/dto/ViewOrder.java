package lee.inhong.BMS_JSP.dto;

public class ViewOrder {

	private String order_id;
	private int detail_number;
	private String	book_title;
	private int purchase_price;
	private int sell_price;
	
	private int stock;
	private int order_quantity;
	private int order_state;
	private String order_stateName;
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public int getDetail_number() {
		return detail_number;
	}
	public void setDetail_number(int detail_number) {
		this.detail_number = detail_number;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public int getPurchase_price() {
		return purchase_price;
	}
	public void setPurchase_price(int purchase_price) {
		this.purchase_price = purchase_price;
	}
	public int getSell_price() {
		return sell_price;
	}
	public void setSell_price(int sell_price) {
		this.sell_price = sell_price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}
	public String getOrder_stateName() {
		return order_stateName;
	}
	public void setOrder_stateName(String order_stateName) {
		this.order_stateName = order_stateName;
	}
	
}
