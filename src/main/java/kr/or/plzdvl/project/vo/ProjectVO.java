package kr.or.plzdvl.project.vo;

public class ProjectVO {
	
	private String pro_num; // 번호
	private String pro_tit; // 제목
	private String pro_con; // 내용
	private String pro_dtn; // 구분 ( 개발 / 디자인 / 기획)
	private String pro_term; // 기간
	private String pro_bud; // 예산
	private String pro_dea_date; // 마감일
	private String pro_plan_cod; // 기획상태 ( 아이디어단계 / ... / ...)
	private String pro_need_tec; // 필요기술
	private String pro_cod_wht; // 상태여부 ( 모집중 / 모집마감 / ... )
	private String pro_est_inq_wht; // 견적문의 여부 ( 안 했으면 N / 했으면 Y / 프리랜서가 삭제했으면 Z )
	private String pro_st_date; // 착수일
	private String mem_id; // 프로젝트 등록자 
	private String pro_est_req_mem_id; // 견적요청회원 ID
	private String pro_sup_mem_id; // 지원자 ID
	private String pro_gress_con; // 프로젝트 버튼 상태
	
	public String getPro_gress_con() {
		return pro_gress_con;
	}
	public void setPro_gress_con(String pro_gress_con) {
		this.pro_gress_con = pro_gress_con;
	}
	public String getPro_sup_mem_id() {
		return pro_sup_mem_id;
	}
	public void setPro_sup_mem_id(String pro_sup_mem_id) {
		this.pro_sup_mem_id = pro_sup_mem_id;
	}
	public String getPro_num() {
		return pro_num;
	}
	public void setPro_num(String pro_num) {
		this.pro_num = pro_num;
	}
	public String getPro_tit() {
		return pro_tit;
	}
	public void setPro_tit(String pro_tit) {
		this.pro_tit = pro_tit;
	}
	public String getPro_con() {
		return pro_con;
	}
	public void setPro_con(String pro_con) {
		this.pro_con = pro_con;
	}
	public String getPro_dtn() {
		return pro_dtn;
	}
	public void setPro_dtn(String pro_dtn) {
		this.pro_dtn = pro_dtn;
	}
	public String getPro_term() {
		return pro_term;
	}
	public void setPro_term(String pro_term) {
		this.pro_term = pro_term;
	}
	public String getPro_bud() {
		return pro_bud;
	}
	public void setPro_bud(String pro_bud) {
		this.pro_bud = pro_bud;
	}
	public String getPro_dea_date() {
		return pro_dea_date;
	}
	public void setPro_dea_date(String pro_dea_date) {
		this.pro_dea_date = pro_dea_date;
	}
	public String getPro_plan_cod() {
		return pro_plan_cod;
	}
	public void setPro_plan_cod(String pro_plan_cod) {
		this.pro_plan_cod = pro_plan_cod;
	}
	public String getPro_need_tec() {
		return pro_need_tec;
	}
	public void setPro_need_tec(String pro_need_tec) {
		this.pro_need_tec = pro_need_tec;
	}
	public String getPro_cod_wht() {
		return pro_cod_wht;
	}
	public void setPro_cod_wht(String pro_cod_wht) {
		this.pro_cod_wht = pro_cod_wht;
	}
	public String getPro_est_inq_wht() {
		return pro_est_inq_wht;
	}
	public void setPro_est_inq_wht(String pro_est_inq_wht) {
		this.pro_est_inq_wht = pro_est_inq_wht;
	}
	public String getPro_st_date() {
		return pro_st_date;
	}
	public void setPro_st_date(String pro_st_date) {
		this.pro_st_date = pro_st_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getPro_est_req_mem_id() {
		return pro_est_req_mem_id;
	}
	public void setPro_est_req_mem_id(String pro_est_req_mem_id) {
		this.pro_est_req_mem_id = pro_est_req_mem_id;
	}
	
	
	
	
}
