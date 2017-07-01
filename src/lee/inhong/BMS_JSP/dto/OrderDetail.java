package lee.inhong.BMS_JSP.dto;

public class OrderDetail {

	private String order_id;
	private int detail_number;
	private String ISBN;
	private int order_quantity;
	private int order_state;
	
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
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
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
	
}
