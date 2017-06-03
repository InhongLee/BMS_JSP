package lee.inhong.BMS_JSP.dto;

public class ViewStock {

	private String 	ISBN;
	private String 	book_title;
	private String	book_author;
	private String	publisher_name;
	private int		purchase_price;
	private int		sell_price;
	private int		stock;
	private String	stock_state;
	
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getPublisher_name() {
		return publisher_name;
	}
	public void setPublisher_name(String publisher_name) {
		this.publisher_name = publisher_name;
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
	public String getStock_state() {
		return stock_state;
	}
	public void setStock_state(String stock_state) {
		this.stock_state = stock_state;
	}
}
