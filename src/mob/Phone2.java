package mob;

public class Phone2 {
	String set_no;
	String set_name;
	String i_price;
	public String getSet_no() {
		return set_no;
	}
	public void setSet_no(String set_no) {
		this.set_no = set_no;
	}
	public String getSet_name() {
		return set_name;
	}
	public void setSet_name(String set_name) {
		this.set_name = set_name;
	}
	public String getI_price() {
		return i_price;
	}
	public void setI_price(String i_price) {
		this.i_price = i_price;
	}
	public Phone2(String set_no, String set_name, String i_price) {
		super();
		this.set_no = set_no;
		this.set_name = set_name;
		this.i_price = i_price;
	}
}
