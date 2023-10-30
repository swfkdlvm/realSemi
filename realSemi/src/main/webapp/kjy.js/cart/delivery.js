
$(document).ready(function(){
	
	$("table#firsttbl").click(function(){
		/*alert("주문내역을 클릭하셨습니다.");*/
		location.href="http://localhost:9090/tempSemi/test3.bk";
	});
	
	$("table#secondtbl").click(function(){
		alert("카트를 클릭하셨습니다.");
		action
	});
	
	$("button#change").click(function(){
		alert("변경을 클릭하셨습니다.");
	});
	
});// end of $(document).ready(function(){})--------