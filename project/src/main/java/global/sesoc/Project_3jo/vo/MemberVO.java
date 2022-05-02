package global.sesoc.Project_3jo.vo;

//수취인 정보 VO
public class MemberVO {
	String order_id;
	String u_id;
	String u_name;
	String u_phone;
	String u_email;
	String u_point;
	
	public MemberVO() {}
	
	public MemberVO(String order_id, String u_id, String u_name, String u_phone, String u_email, String u_point) {
		super();
		this.order_id = order_id;
		this.u_id = u_id;
		this.u_name = u_name;
		this.u_phone = u_phone;
		this.u_email = u_email;
		this.u_point = u_point;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_point() {
		return u_point;
	}

	public void setU_point(String u_point) {
		this.u_point = u_point;
	}

	@Override
	public String toString() {
		return "MemberVO [order_id=" + order_id + ", u_id=" + u_id + ", u_name=" + u_name + ", u_phone=" + u_phone
				+ ", u_email=" + u_email + ", u_point=" + u_point + "]";
	}
	
	
}
