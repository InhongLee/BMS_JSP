package lee.inhong.BMS_JSP.dto;

public class Stock {

	private String ISBN;
	private int stock;
	private int stock_state;
	
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getStock_state() {
		return stock_state;
	}
	public void setStock_state(int stock_state) {
		this.stock_state = stock_state;
	}
	
}
