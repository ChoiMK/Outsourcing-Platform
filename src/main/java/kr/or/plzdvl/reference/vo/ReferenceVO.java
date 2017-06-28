package kr.or.plzdvl.reference.vo;

import java.util.List;

import kr.or.plzdvl.fileitem.vo.FileitemVO;

public class ReferenceVO {
	private String re_num; // 자료실 번호
	private String re_tit; // 자료실 제목
	private String re_con; // 자료실 내용
	private String re_luc; // 자료실 조회수
	private String re_inst_date; // 등록일
	private String mem_id; // 등록자
	private String re_wht; // 삭제여부
	private String re_good; // 좋아요
	private List<FileitemVO> attachFileItemList; //첨부파일
	
	public List<FileitemVO> getAttachFileItemList() {
		return attachFileItemList;
	}
	
	public void setAttachFileItemList(List<FileitemVO> attachFileItemList) {
		this.attachFileItemList = attachFileItemList;
	}
	
	public String getRe_num() {
		return re_num;
	}
	public void setRe_num(String re_num) {
		this.re_num = re_num;
	}
	public String getRe_tit() {
		return re_tit;
	}
	public void setRe_tit(String re_tit) {
		this.re_tit = re_tit;
	}
	public String getRe_con() {
		return re_con;
	}
	public void setRe_con(String re_con) {
		this.re_con = re_con;
	}
	public String getRe_luc() {
		return re_luc;
	}
	public void setRe_luc(String re_luc) {
		this.re_luc = re_luc;
	}
	public String getRe_inst_date() {
		return re_inst_date;
	}
	public void setRe_inst_date(String re_inst_date) {
		this.re_inst_date = re_inst_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getRe_wht() {
		return re_wht;
	}
	public void setRe_wht(String re_wht) {
		this.re_wht = re_wht;
	}
	public String getRe_good() {
		return re_good;
	}
	
	public void setRe_good(String re_good) {
		this.re_good = re_good;
	}
}
