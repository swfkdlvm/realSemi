package msh.NonMemberOrder.domain;

import pys.myshop.domain.ProductVO;

public class NonMemberCartVO {

	private String cartno;  
	private int fk_pnum;
	private String fk_ordernum;
	private int oqty;
	private String registerday;
	private ProductVO prod;
	private String seq;  
	private String name;  
	private String phonenumber;
	private String postcode;
	private String address;
	private String detailaddress;
	private String extraaddress;
	private String odrdate;
	
	public ProductVO getProd() {
		return prod;
	}

	public void setProd(ProductVO prod) {
		this.prod = prod;
	}
	
	public String getCartno() {
		return cartno;
	}
	public void setCartno(String cartno) {
		this.cartno = cartno;
	}
	public int getFk_pnum() {
		return fk_pnum;
	}
	public void setFk_pnum(int fk_pnum) {
		this.fk_pnum = fk_pnum;
	}
	public String getFk_ordernum() {
		return fk_ordernum;
	}
	public void setFk_ordernum(String fk_ordernum) {
		this.fk_ordernum = fk_ordernum;
	}
	public int getOqty() {
		return oqty;
	}
	public void setOqty(int oqty) {
		this.oqty = oqty;
	}
	public String getRegisterday() {
		return registerday;
	}
	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public String getExtraaddress() {
		return extraaddress;
	}
	public void setExtraaddress(String extraaddress) {
		this.extraaddress = extraaddress;
	}
	public String getOdrdate() {
		return odrdate;
	}
	public void setOdrdate(String odrdate) {
		this.odrdate = odrdate;
	}
	
	public NonMemberCartVO() {};
}
