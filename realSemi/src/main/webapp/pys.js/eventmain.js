
$(document).ready(function(){

   
   // HIT상품 게시물을 더보기 위하여 "더보기..." 버튼 클릭액션에 대한 초기값 호출하기 
    // 즉, 맨처음에는 "더보기..." 버튼을 클릭하지 않더라도 클릭한 것 처럼 8개의 HIT상품을 게시해주어야 한다는 말이다. 
   displayHIT("1"); //  displayHIT는 메서드이다. 여기다 1을 넣고 시작한다. 
   
   //HIT 상품 게시물을 더보기 위하여 "더보기..." 버튼 클릭액션 이벤트 등록하기  
   $("button#btnMoreHIT").click(function(e){
     
     if($(this).text() == "처음으로"){
		 $("div#displayjson").empty();
		 $("span#end").empty();
		 displayHIT("1");
		 $(this).text("더보기");
	 }
     else{
        displayHIT($(this).val());
    //   displayHIT("9"); // 첫번째로 더보기를 클릭한 경우
    //   displayHIT("17"); // 두번째로 더보기를 클릭한 경우
    //   displayHIT("25"); // 세번째로 더보기를 클릭한 경우
   
     }
     
   });// end of $("button#btnMoreHIT").click(function(){
   
});//end of $(document).ready(function(){
   
   
//function Declaration

let lenHIT = 8;
// HIT 상품 "더보기..." 버튼을 클릭할때 보여줄 상품의 개수(단위)크기 

// display 할  HIT상품 정보를 추가 요청하기(Ajax 로 처리함)
function displayHIT(start) { // start가  1  이라면  1~8   까지 상품 8개를 보여준다.
                              // start가  9  이라면  9~16  까지 상품 8개를 보여준다.
                              // start가 17  이라면  17~24 까지 상품 8개를 보여준다.
                              // start가 25  이라면  25~32 까지 상품 8개를 보여준다.
                              // start가 33  이라면  33~36 까지 상품 4개를 보여준다.(마지막 상품)  
    $.ajax({
      url:"eventlistjson.bk",
   //   type:"get",
      data:{
           "start":start, // "1"  "9"  "17"  "25"  "33"
           "len":lenHIT}, //  8    8    8     8
          dataType:"json",
          success:function(json){
          
             console.log(json);
             console.log(typeof json);
          
            
            let v_html =``;
            
            if(start == "1" && json.length == 0) {
               // 처음부터 데이터가 존재하지 않는 경우
               /* !!!! 주의 !!!! 
                  if(start == "1" && json == null)이 아님!!!
                  if(start == "1" && json.length) 로 해야함!!!
               */
               v_html =`현재 상품 준비중 입니다...`;
               $("div#displayjson").html(v_html);
            }
            
            else if(json.length > 0) {
               // 데이터가 존재하는 경우
               
               /* 자바스크립트 사용하는 경우
               json.foreach(function(index, item, array){
                  
                  
               });
               */
               
               //jQuery 를 사용하는 경우
            
$.each(json, function (index, item) {
  if (index % 2 === 0) {
    v_html += '<div class="row">';
  }

  v_html += `
    <div class="col-md-6 col-lg-6" >
      <table>
        <tr>
          <td><a href="/tempSemifinal/eventlistdetail.bk?eventno=${item.eventno}"><img src="/tempSemifinal/image/${item.eventimg}"/></a></td>
        </tr>
        <tr>
          <td><p>${item.eventdate}</p></td>
        </tr>
      </table>
    </div>
  `;

  if (index % 2 !== 0 || index === json.length - 1) {
    v_html += '</div>';
  }
});
               
               
               //HIT 상품결과를 출력하기
               $("div#displayjson").append(v_html);
               
               
               //!!!!!! 중요 !!!!!!!
               // 더보기...버튼의 value 속성에 값을 지정하기
               $("button#btnMoreHIT").val(Number(start)+ lenHIT);	

            	//더보기.... 버튼의 value 값이 "9" 로 변경된다.
            	//더보기.... 버튼의 value 값이 "17" 로 변경된다.
            	//더보기.... 버튼의 value 값이 "25" 로 변경된다.
            	//더보기.... 버튼의 value 값이 "33" 로 변경된다.
            	//더보기.... 버튼의 value 값이 "41" 로 변경된다. (존재하지 않는 것이다.)
            	
            	// span#countHIT 에 지금까지 출력된 상품의 개수를 누적해서 기록한다.
            	$("span#countHIT").text( Number($("span#countHIT").text()) + json.length );
            	
            	//더보기... 버튼을 계속해서 클릭하면 countHIT 값과 totalHITCount값이 일치하는 경우가 온다.
            	if( $("span#countHIT").text() == $("span#totalHITCount").text() ){
					$("span#end").html("더이상 조회할 이벤트가 없습니다.");
					$("button#btnMoreHIT").text("처음으로");
					$("span#countHIT").text("0");
				}
            	
            	
            } 

          },
          error: function(request, status, error){
             
             alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
         }
      
   });
                              
                              
}






