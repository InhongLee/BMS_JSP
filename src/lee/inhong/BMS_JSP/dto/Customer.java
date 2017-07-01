package lee.inhong.BMS_JSP.dto;

import java.sql.Timestamp;

public class Customer {

	private String 		customer_id;
	private String 		customer_pw;
	private String 		customer_name;
	private String 		customer_sid1;
	private String 		customer_sid2;
	private String 		customer_hp;
	private String 		customer_email;
	private Timestamp 	customer_regDate;
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_pw() {
		return customer_pw;
	}
	public void setCustomer_pw(String customer_pw) {
		this.customer_pw = customer_pw;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_sid1() {
		return customer_sid1;
	}
	public void setCustomer_sid1(String customer_sid1) {
		this.customer_sid1 = customer_sid1;
	}
	public String getCustomer_sid2() {
		return customer_sid2;
	}
	public void setCustomer_sid2(String customer_sid2) {
		this.customer_sid2 = customer_sid2;
	}
	public String getCustomer_hp() {
		return customer_hp;
	}
	public void setCustomer_hp(String customer_hp) {
		this.customer_hp = customer_hp;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public Timestamp getCustomer_regDate() {
		return customer_regDate;
	}
	public void setCustomer_regDate(Timestamp customer_regDate) {
		this.customer_regDate = customer_regDate;
	}
}
