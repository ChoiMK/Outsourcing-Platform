package kr.or.plzdvl.alarm.vo;

public class AlarmVO {
	private String al_con; // 알림내용
	private String al_time; // 알림시간
	private String al_chk_wht; // 알림확인여부 ( 확인안했을시 N <- 디폴트 / 확인했으면 Y) 
	private String com_num; // 댓글 번호 (댓글 등록시만)
	private String pro_num; // 알림이 발생한 위치의 PK
	private String mem_id; // 알림 받을 회원
	private String al_num; // 알림번호
	private String al_tit; // 알림제목
	private String al_url; // 알람을 눌렀을 때 갈  url
	public String getAl_con() {
		return al_con;
	}
	public void setAl_con(String al_con) {
		this.al_con = al_con;
	}
	public String getAl_time() {
		return al_time;
	}
	public void setAl_time(String al_time) {
		this.al_time = al_time;
	}
	public String getAl_chk_wht() {
		return al_chk_wht;
	}
	public void setAl_chk_wht(String al_chk_wht) {
		this.al_chk_wht = al_chk_wht;
	}
	public String getCom_num() {
		return com_num;
	}
	public void setCom_num(String com_num) {
		this.com_num = com_num;
	}
	public String getPro_num() {
		return pro_num;
	}
	public void setPro_num(String pro_num) {
		this.pro_num = pro_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getAl_num() {
		return al_num;
	}
	public void setAl_num(String al_num) {
		this.al_num = al_num;
	}
	public String getAl_tit() {
		return al_tit;
	}
	public void setAl_tit(String al_tit) {
		this.al_tit = al_tit;
	}
	public String getAl_url() {
		return al_url;
	}
	public void setAl_url(String al_url) {
		this.al_url = al_url;
	}
	
	
}
