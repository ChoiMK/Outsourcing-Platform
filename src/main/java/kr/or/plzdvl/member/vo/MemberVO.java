package kr.or.plzdvl.member.vo;

import java.util.List;

import kr.or.plzdvl.fileitem.vo.FileitemVO;

public class MemberVO {
	
	private String mem_id; // 아이디
	private String mem_pw; // 비밀번호
	private String mem_nm; // 이름
	private String mem_mail; // 이메일
	private String mem_tel; // 전화번호
	private String mem_type; // 타입(프리랜서 F / 클라이언트 C / 관리자 A / 삭제 D )
	private String mem_coms; // 회사크기 ( 개인 C / 팀 T )
	private String mem_grd; // 평점
	private String mem_tig_nm; // 타이틀 명
	private String mem_self; // 자기소개서
	private String mem_po_atte_num; // 프로젝트 관심번호
	private String mem_pro_count;
	private String mem_star_sum;
	private List<FileitemVO> attachFileItemList; // 사진
	
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_nm() {
		return mem_nm;
	}
	public void setMem_nm(String mem_nm) {
		this.mem_nm = mem_nm;
	}
	public String getMem_mail() {
		return mem_mail;
	}
	public void setMem_mail(String mem_mail) {
		this.mem_mail = mem_mail;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_type() {
		return mem_type;
	}
	public void setMem_type(String mem_type) {
		this.mem_type = mem_type;
	}
	public String getMem_coms() {
		return mem_coms;
	}
	public void setMem_coms(String mem_coms) {
		this.mem_coms = mem_coms;
	}
	public String getMem_grd() {
		return mem_grd;
	}
	public void setMem_grd(String mem_grd) {
		this.mem_grd = mem_grd;
	}
	public String getMem_tig_nm() {
		return mem_tig_nm;
	}
	public void setMem_tig_nm(String mem_tig_nm) {
		this.mem_tig_nm = mem_tig_nm;
	}
	public String getMem_self() {
		return mem_self;
	}
	public void setMem_self(String mem_self) {
		this.mem_self = mem_self;
	}
	public String getMem_po_atte_num() {
		return mem_po_atte_num;
	}
	public void setMem_po_atte_num(String mem_po_atte_num) {
		this.mem_po_atte_num = mem_po_atte_num;
	}
	public List<FileitemVO> getAttachFileItemList() {
		return attachFileItemList;
	}
	public void setAttachFileItemList(List<FileitemVO> attachFileItemList) {
		this.attachFileItemList = attachFileItemList;
	}
	public String getMem_pro_count() {
		return mem_pro_count;
	}
	public void setMem_pro_count(String mem_pro_count) {
		this.mem_pro_count = mem_pro_count;
	}
	public String getMem_star_sum() {
		return mem_star_sum;
	}
	public void setMem_star_sum(String mem_star_sum) {
		this.mem_star_sum = mem_star_sum;
	}
	
}
