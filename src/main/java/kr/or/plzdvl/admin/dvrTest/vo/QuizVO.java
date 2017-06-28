package kr.or.plzdvl.admin.dvrTest.vo;

public class QuizVO {
	private String quiz_num; // 문제번호
	private String quiz_con; // 문제 내용
	private String sub_num; // 과목 번호
	
	public String getQuiz_num() {
		return quiz_num;
	}
	public void setQuiz_num(String quiz_num) {
		this.quiz_num = quiz_num;
	}
	public String getQuiz_con() {
		return quiz_con;
	}
	public void setQuiz_con(String quiz_con) {
		this.quiz_con = quiz_con;
	}
	public String getSub_num() {
		return sub_num;
	}
	public void setSub_num(String sub_num) {
		this.sub_num = sub_num;
	}
}

