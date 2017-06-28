package kr.or.plzdvl.document.vo;

import java.util.List;

import kr.or.plzdvl.fileitem.vo.FileitemVO;

public class DocumentVO {
	
	private String doc_num; // 문서관리 번호
	private String doc_form_cla; // 문서형식 번호
	private String doc_tit; // 문서 제목
	private String mem_id; // 회원ID
	private String doc_wht; // 삭제여부
	private List<FileitemVO> attachFileItemList; // 파일
	
	public String getDoc_wht() {
		return doc_wht;
	}
	public void setDoc_wht(String doc_wht) {
		this.doc_wht = doc_wht;
	}
	public String getDoc_num() {
		return doc_num;
	}
	public void setDoc_num(String doc_num) {
		this.doc_num = doc_num;
	}
	public String getDoc_form_cla() {
		return doc_form_cla;
	}
	public void setDoc_form_cla(String doc_form_cla) {
		this.doc_form_cla = doc_form_cla;
	}
	public String getDoc_tit() {
		return doc_tit;
	}
	public void setDoc_tit(String doc_tit) {
		this.doc_tit = doc_tit;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public List<FileitemVO> getAttachFileItemList() {
		return attachFileItemList;
	}
	public void setAttachFileItemList(List<FileitemVO> attachFileItemList) {
		this.attachFileItemList = attachFileItemList;
	}
	
}
