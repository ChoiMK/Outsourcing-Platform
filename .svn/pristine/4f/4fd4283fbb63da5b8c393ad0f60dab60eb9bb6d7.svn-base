/**
 * 입력값 검증 함수
 * 버전 : 1.0
 * << 개정이력(Modification Information) >>
 * 수정일       수정자          수정내용   
 * =======      =======     ===================== 
 * 2017.03.21.  박승리       최초작성   
 * Copyright (c) 2016 by DDIT  All right reserved  
 */
//아이디 검증
//"".validationID()
String.prototype.validationID = function() {
	return /^[a-z][a-z0-9]{3}$/.test(this);
};

String.prototype.validationPWD = function() {
	return /[a-z0-9]{4,10}$/.test(this);
};

String.prototype.validationNM = function() {
	return /^[가-힣]{2,4}$/.test(this);
};

String.prototype.validationREGNO = function() {
	var num1 = this.substr(0,1)*2;
	var num2 = this.substr(1,1)*3;
	var num3 = this.substr(2,1)*4;
	var num4 = this.substr(3,1)*5;
	var num5 = this.substr(4,1)*6;
	var num6 = this.substr(5,1)*7;
	var num7 = this.substr(7,1)*8;
	var num8 = this.substr(8,1)*9;
	var num9 = this.substr(9,1)*2;
	var numA = this.substr(10,1)*3;
	var numB = this.substr(11,1)*4;
	var numC = this.substr(12,1)*5;
	var rastNum = this.substr(13,1);
	
	var sum = num1 + num2 + num3 + num4 + num5 + num6 + num7 + num8 + num9 + numA + numB + numC;
	var getNum = (11-(sum%11))%10;

	if(getNum == rastNum) {
		return true;
	} else {
		return false;
	}
};

String.prototype.validationBIR = function() {
	return /^(19|20)[0-9]{2}-(0[1-9]|1[0-2])-[0-9]{2}$/.test(this);
};

String.prototype.validationHOMETEL = function() {
	return /^0[1-9]{1,2}-\d{3,4}-\d{4}$/.test(this);
};

String.prototype.validationCOMTEL = function() {
	return /^0[1-9]{1,2}-\d{3,4}-\d{4}$/.test(this);
};

String.prototype.validationMAIL = function() {
	return /^[a-zA-Z0-9]+@[a-z]+(\.[a-z]+){1,2}/.test(this);
};

String.prototype.validationHP = function() {
	return /^01(1|6|7|8|9|0)-\d{3,4}-\d{4}$/.test(this);
};





