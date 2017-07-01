package lee.inhong.BMS_JSP.dto;

public class ViewStockInfo {
	
	private int EATotal;
	private int buyTotal;
	private int sellTotal;
	
	public int getEATotal() {
		return EATotal;
	}
	public void setEATotal(int eATotal) {
		EATotal = eATotal;
	}
	public int getBuyTotal() {
		return buyTotal;
	}
	public void setBuyTotal(int buyTotal) {
		this.buyTotal = buyTotal;
	}
	public int getSellTotal() {
		return sellTotal;
	}
	public void setSellTotal(int sellTotal) {
		this.sellTotal = sellTotal;
	}
}
