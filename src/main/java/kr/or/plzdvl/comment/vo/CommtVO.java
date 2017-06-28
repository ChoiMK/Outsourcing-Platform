package kr.or.plzdvl.comment.vo;

public class CommtVO {
	private String com_num; // 댓글번호
	private String com_con; // 댓글내용
	private String com_inst_date; // 등록일
	private String com_gr_num; // 그룹번호
	private String com_turn; // 댓글순번
	private String com_dep; // 댓글깊이
	private String mem_nm; // 작성자
	private String mem_profile; // 작성자 사진
	private String mem_id; //회원아디
	
	public String getMem_profile() {
		return mem_profile;
	}
	public void setMem_profile(String mem_profile) {
		this.mem_profile = mem_profile;
	}
	public String getMem_nm() {
		return mem_nm;
	}
	public void setMem_nm(String mem_nm) {
		this.mem_nm = mem_nm;
	}
	private String com_loc; // 댓글작성위치
	
	public String getCom_num() {
		return com_num;
	}
	public void setCom_num(String com_num) {
		this.com_num = com_num;
	}
	public String getCom_con() {
		return com_con;
	}
	public void setCom_con(String com_con) {
		this.com_con = com_con;
	}
	public String getCom_inst_date() {
		return com_inst_date;
	}
	public void setCom_inst_date(String com_inst_date) {
		this.com_inst_date = com_inst_date;
	}
	public String getCom_gr_num() {
		return com_gr_num;
	}
	public void setCom_gr_num(String com_gr_num) {
		this.com_gr_num = com_gr_num;
	}
	public String getCom_turn() {
		return com_turn;
	}
	public void setCom_turn(String com_turn) {
		this.com_turn = com_turn;
	}
	public String getCom_dep() {
		return com_dep;
	}
	public void setCom_dep(String com_dep) {
		this.com_dep = com_dep;
	}
	public String getCom_loc() {
		return com_loc;
	}
	public void setCom_loc(String com_loc) {
		this.com_loc = com_loc;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	
}
