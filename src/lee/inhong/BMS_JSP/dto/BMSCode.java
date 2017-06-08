package lee.inhong.BMS_JSP.dto;

public interface BMSCode {

	/*
	 * STATE_CODE(number(4)) ===============================================================
	 * 1000	PURCHASE				2000	SALES					3000	STOCK				4000	ACCOUNT
	 * 1110	REQ_PURCHASE	구매요청	2110	REQ_SALES		판매요청	3110	PENDING		미결		4110	REQ_LEDGER		전표결제요청
	 * 1120	APP_PURCHASE	구매승인	2120	APP_SALES		판매승인	3120	ON_SALE		판매중	4120	APP_LEDGER		전표결제
	 * 1130	REJ_PURCHASE	구매거부	2130	REJ_SALES		판매거부	3130	SOLD_OUT	매진		4130	REJ_LEDGER		전표거부
	 * 1140	FIN_PURCHASE	구매완료	2140	FIN_SALES		판매완료	3140	OUT_OF_PRINT절판		4140	FIN_LEDGER		전표처리완료
	 * 1210	REQ_RETURN		반송요청	2210	REQ_REFUND		환불요청
	 * 1220	APP_RETURN		반송승인	2220	APP_REFUND		환불승인
	 * 1230	REJ_RETURN		반송거부	2230	REJ_REFUND		환불거부
	 * 1240	FIN_RETURN		반송완료	2240	FIN_REFUND		환불완료
	 * =====================================================================================
	 */
	
	public static final int PURCHASE 		= 1000;
	public static final int REQ_PURCHASE 	= 1110;
	public static final int APP_PURCHASE 	= 1120;
	public static final int REJ_PURCHASE 	= 1130;
	public static final int REQ_RETURN 		= 1210;
	public static final int APP_RETURN 		= 1220;
	public static final int REJ_RETURN 		= 1230;
	
	public static final int SALES	 		= 2000;
	public static final int REQ_SALES 		= 2110;
	public static final int APP_SALES 		= 2120;
	public static final int REJ_SALES 		= 2130;
	public static final int REQ_REFUND 		= 2210;
	public static final int APP_REFUND 		= 2220;
	public static final int REJ_REFUND 		= 2230;
	
	public static final int STOCK	 		= 3000;
	public static final int PENDING 		= 3110;
	public static final int ON_SALE 		= 3120;
	public static final int SOLD_OUT 		= 3130;
	public static final int OUT_OF_PRINT	= 3140;
	
	public static final int ACCOUNT	 		= 4000;
	public static final int REQ_LEDGER 		= 4110;
	public static final int APP_LEDGER 		= 4120;
	public static final int REJ_LEDGER 		= 4130;
}
