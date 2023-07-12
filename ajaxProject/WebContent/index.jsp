<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
</head>
<body>
	<h1>AJAX개요.</h1>
	
	<p>
		Asynchronous JavaScript And XML의 약자로<br>
		서버로부터 데이터를 가져와 전체 페이지를 새로고치지 않고 일부만 로드할 수 있게하는 기법<br>
		우리가 기존에 사용하던 a태그 요청 및 form 요청등은 동기식 요청<br>
		-응답페이지가 돌아와야 볼수 있다(페이지 깜빡거림)<br>
		비동기식 요청을 보내기 위해서는 AJAX라는 기술을 이용한다. <br><br>
		
		*동기식/비동기식 <br>
		-동시식: 요청 처리 후 그에 해당하는 응답페이지가 돌아와야만 그 다음 작업이 가능하다<br>
		만약 서버에서 호출된 결과까지의 시간이 지연되면 계속 대기해야한다.<br>
		전체 페이지가 리로드된다(새로고침)<br><br>
		-비동기식: 현재 페이지를 그대로 유지하며 중간에 추가적인 요청작업을 할 수 있음 <br>
		요청을 해도 다른 페이지로 넘어가는 것이 아니라 데이터 통신이 되는 것<br>
		요청을 보내고놓고 그에 해당하는 응답이 돌아오기 전에도 다른 작업을 할수 있다.<br>
		ex)아이디 중복체크, 검색어 자동완성 기능 등등<br><br>
		
		*비동기식의 단점<br>
		-현재 페이지에 지속적으로 리소스가 쌓인다. - 페이지가 느려질수 있음.<br>
		-페이지 내 복잡도가 증가한다. - 에러발생시 디버깅이 어려워진다.<br>
		-요청 후 돌아온 응답에 대해 새로운 요소를 만들어 데이터를 출력해야한다.<br>
		->DOM요소를 만들어 뿌려주기 때문에 해당 요소 새성 구문을 잘 알고 있어야한다.<br><br>
	</p>
	
	<pre>
		* jQuery 방식으로 AJAX 통신
		
		$.ajax({
			속성명: 속성값,
			속성명: 속성값,
			...
		});
		
		*주요속성
		-url: 요청할 url (필수)
		-type|method: get/post (요청 전송방식 (생략시는 get이 기본값))
		-data: 요청할 전달 값 
		-success: ajax통신이 성공시 행할 작업코드 (함수) function()
		-error: ajax통신이 실패시 행할 작업코드(함수) function()
		-complete: ajax통신의 성공실패 여부에 상관없이 실행할 함수 정의 function()
		
		*부수적인 속성
		-async: 서버와의 비동기 처리방식 설정 여부 (기본값 true) -동기통신도 가능하게 하는 속성
		-contentType: request의 데이터 인코딩 타입 정의
		-dataType: 서버에서 request로 오는 데이터의 데이터 형 설정, 값이 없다면 알아서 설정해준다
				   ex) xml, json, script, html, text
		-accept: 파라미터 타입을 설정
		-beforeSend: ajax요청을 하기 전 실행되는 이벤트
		-cache: 요청 및 결과를 scope에서 갖고있지 않도록 하는 속성(기본값 true)
		-contents: jQuery에서 response의 데이터를 파싱하는 방식 정의 속성
		-crossDomain: 타 도메인 호출 가능 여부 설정 (기본 false)
		-dataFilter: response를 받았을때 정상적인 값을 return할수 있도록 데이터와 데이터 타입 설정
		-global: 기본 이벤트 사용 여부(ajaxStart, ajaxStop) 버퍼링 같이 시작과 끝을 나타낼때
		-password: 서버에 접속 권한(비밀번호)가 필요한 경우
		-processData: 서버로 보내는 값에 대한 형태 설정여부(기본데이터를 원하는 경우 false로 설정)
		-timeout: 서버요청시 응답 대기 시간(ms단위)
	</pre>
	
	<h1>jQuery방식을 이용한 ajax 테스트</h1>
	<h3>1.버튼 클릭시 get방식으로 서버에 데이터 전송 및 응답</h3>
	
	입력: <input type="text" id="input1">
	<button id="btn">전송</button>
	<br>
	응답: <label id="output1">현재 응답 없음</label>
	
	<script>
		$(function(){
			$("#btn").click(function(){
				//기존 동기식 통신
				//location.href ='경로'
				//location.href='jqAjax1.do?input='+$("#input1").val();
				
				//비동기 통신
				$.ajax({
					url:"jqAjax1.do",
					data:{
						input:$("#input1").val()
					},
					type:"get",
					success: function(result){
						console.log("ajax통신 성공");
						console.log(result);
						$("#output1").html(result);
					},
					error: function(){
						console.log("ajax통신 실패");
					},
					complete: function(){
						console.log("성공 실패 여부에 상관없이 실행됨");
					}
				});
			});
		});
	</script>
	
	<br>
	
	<h2>2.버튼 킬릭시 post방식으로 서버에 데이터 전송 및 응답</h2>
	
	이름: <input type="text" id="input2_1"><br>
	나이: <input type="number" id="input2_2"><br>
	<button id="btn2">전송</button>
	<br>
	응답: <div id="output2">현재 응답 없음</div>
	
	<script>
		$("#btn2").click(function(){
			/* 방법1. 데이터 하나만 넘어보는 방식
			$.ajax({
				url : "jqAjax2.do",
				data : {
					name: $("#input2_1").val(),
					age: $("#input2_2").val()
				},
				type : "post",
				success: function(result){
					console.log(result);
					$("#output2").text(result);
				},
				error: function(){
					console.log("ajax통신 실패");
				}
			});
			*/
			
			//2 방법2.객체 혹은 배열로 넘길때
			$.ajax({
				url : "jqAjax2.do",
				data : {
					name: $("#input2_1").val(),
					age: $("#input2_2").val()
				},
				type : "post",
				success: function(result){
					//JSONArray 타입으로 응답 받았을때
					/* $("#output2").text("이름: "+result[0]+",나이: "+ result[1]); */
					
					//JSONObject
					$("#output2").text("이름: "+result.name+",나이: "+ result.age);
					$("#input2_1").val("");
					$("#input2_2").val(""); //값 입력하고 비워주기
				},
				error: function(){
					console.log("ajax통신 실패");
				}
			});
		});
	</script>
	
	<br>
	
	<h2>3.서버로 데이터 전송 후 조회된 객체로 응답 받기</h2>
	
	회원번호 입력: <input type="number" id="input3"><br>
	<button onclick="test3();">전송</button>
	
	<div id="output3"></div>
	
	
	<script>
		
			function test3(){
				$.ajax({
					url : "jqAjax3.do",
					data : {
						memberNo : $("#input3").val()
					},
					success : function(result){
						console.log(result);
						var resultStr = "회원 번호: "+result.memberNo+"<br>"
										+"회원 이름: "+result.memberName+"<br>"
										+"나이: "+result.age+"<br>"
										+"성별: "+result.gender+"<br>";
						$("#output3").html(resultStr);
					},
					error : function(){
						console.log("통신 오류");
					}
				});
			};
		
	</script>
	
	<br>
	
	<h2>4.객체 여러개 응답 받기</h2>
	<button onclick="test4();">회원 전체 조회</button>
	<table id="output4" border="1" style="text-align:center">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	
	<script>
		function test4(){
			$.ajax({
				url:"jqAjax4.do",
				success: function(list){
					var str = "";
					
					for(var i=0; i<list.length; i++){
						str+="<tr>"
								+"<td>"+list[i].memberNo+"</td>"
								+"<td>"+list[i].memberName+"</td>"
								+"<td>"+list[i].age+"</td>"
								+"<td>"+list[i].gender+"</td>"
					}
					$("#output4 tbody").html(str);
				},
				error: function(){
					console.log("통신 실패");
				}
			});
		};
	</script>
	
	
	<br><br><br><br><br>
</body>
</html>



