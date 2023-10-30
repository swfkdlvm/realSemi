$(document).ready(function(){
	
	$("button#btnSubmit").click(function(){
		  goLogin(); // 로그인 시도한다.
	});
	
	$("input#loginPwd").bind("keydown", function(e){
	    if(e.keyCode == 13) { // 암호입력란에 엔터를 했을 경우 
		  goLogin(); // 로그인 시도한다.	
		}	
	});
	
});// end of $(document).ready(function(){})------------------


// === 로그인 처리 함수 === //
function goLogin() {
 //	alert("확인용 로그인 처리 하러 간다.");
	
	const loginUserid = $("input#loginUserid").val().trim();
	const loginPwd = $("input#loginPwd").val().trim();
	
	if(loginUserid == "") {
		alert("아이디를 입력하세요!!");
		$("input#loginUserid").val("").focus();
		return; // goLogin() 함수 종료
	}
	
	if(loginPwd == "") {
		alert("암호를 입력하세요!!");
		$("input#loginPwd").val("").focus();
		return; // goLogin() 함수 종료
	}
	
	
	if( $("input:checkbox[id='saveid']").prop("checked") ) {
		// alert("아이디저장 체크를 하셨네요~~^^");
		
		localStorage.setItem('saveid', $("input#loginUserid").val());
	}
	else {
		// alert("아이디저장 체크를 해제 하셨네요!!");
		
		localStorage.removeItem('saveid');
	}
	
	const frm = document.loginFrm;
	frm.submit();
	
}// end of function goLogin()-------------


