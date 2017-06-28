package kr.or.plzdvl.meetingschedule.vo;

public class MeetingVO {
	
	private String me_free_nm;  // 프리랜서 아이디(이름)
	private String me_cnt_nm; // 클라이언트 아이디(이름)
	private String me_mem_id; // 회원 아이디(이름)
	private String me_date; // 미팅 일자 (예) 2016-05-12T20:00:00)
	private String askmem; // 클라이언트면 프리랜서 이름을 가져오고 프리랜서면 클라이언트 이름을 가져오는 변수
	private String mem_file; // 프리랜서 회원의 프로필 사진
	
	public String getMe_free_nm() {
		return me_free_nm;
	}
	public void setMe_free_nm(String me_free_nm) {
		this.me_free_nm = me_free_nm;
	}
	public String getMe_cnt_nm() {
		return me_cnt_nm;
	}
	public void setMe_cnt_nm(String me_cnt_nm) {
		this.me_cnt_nm = me_cnt_nm;
	}
	public String getMe_mem_id() {
		return me_mem_id;
	}
	public void setMe_mem_id(String me_mem_id) {
		this.me_mem_id = me_mem_id;
	}
	public String getMe_date() {
		return me_date;
	}
	public void setMe_date(String me_date) {
		this.me_date = me_date;
	}
	public String getAskmem() {
		return askmem;
	}
	public void setAskmem(String askmem) {
		this.askmem = askmem;
	}
	public String getMem_file() {
		return mem_file;
	}
	public void setMem_file(String mem_file) {
		this.mem_file = mem_file;
	}
}
