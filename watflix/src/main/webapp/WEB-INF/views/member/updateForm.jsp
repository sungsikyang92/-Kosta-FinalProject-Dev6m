<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//비밀번호 입력가능 개수 4글자 이상
		$("#password").keyup(function(){
			if($(this).val().length<4){
				$("#confirmPass").html("비밀번호는 최소 4글자 이상이여야 합니다.").css("color","red");
			}
			else{
				$("#confirmPass").html("").css("color","black");
				if($("#confirmPass2").html()=='비밀번호가 일치합니다.'){
					$("#confirmPass2").html("비밀번호가 일치하지 않습니다.").css("color","red");
				}
			}
		})//패스워드 1차 keyup
		
		//비밀번호 2차 입력
		$("#password2").keyup(function(){
			var pass1 = $("#password").val();
			var pass2 = $(this).val();
			
			if(pass1.length<4){
				$("#confirmPass2").html("").css("color","black");
				$(this).val("");
				$("#password").focus();
			}
			else if(pass1.length>3 && pass1 != pass2){
				$("#confirmPass2").html("비밀번호가 일치하지 않습니다.").css("color","red");
			}
			else if(pass1.length>3 && pass1 == pass2 ){
				$("#confirmPass2").html("비밀번호가 일치합니다.").css("color","blue");
			}
		})//패스워드 2차 keyup
		
		//비밀번호 2차 입력
		$("#password2").keyup(function(){
			var pass1 = $("#password").val();
			var pass2 = $(this).val();
			
			if(pass1 != pass2){
				$("#confirmPass2").html("비밀번호가 일치하지 않습니다.").css("color","red");
			}
			else{
				$("#confirmPass2").html("비밀번호가 일치합니다.").css("color","blue");
			}
		})//패스워드 2차 keyup
		
		//이용약관 확인
		$("#notMustSelect").click(function(){
			//체크되지 않았다면 클릭
			if($(this).children("input[type=checkbox]").attr("checked")==null){
				window.open("${pageContext.request.contextPath}/watflixSelectMarketing.do", "popup","width=500,height=300,top=0,left=0");
				$(this).children("input[type=checkbox]").attr("checked","Y");
				$(this).children("input[type=checkbox]").attr("value","동의");
			}
			else{
				$(this).children("input[type=checkbox]").removeAttr("checked");
				$(this).children("input[type=checkbox]").attr("value","비동의");
			}
		})
		
		$("#address").click(function() {
			 new daum.Postcode({
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
			        	$("#address").val(data.address);
			        }
			    }).open();
		}) // 주소 api
		

	}); //ready
//회원 탈퇴
function memberDelete(){
	if(confirm("탈퇴하시겠습니까?")){
		$("#memberDeleteForm").submit();
	}
	else
		return;
}
//회원 정부수정
function submit(){
	if($("#password").val()  == ''){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	if($("#password2").val()  == ''){
		alert("비밀번호를 확인해주세요");
		return false;
	}
	if($("#password").val() != $("#password2").val()){
		alert("비밀번호를 확인해주세요");
		return false;
	}
	if($("#tel").val()  == ''){
		alert("전화번호를 입력해주세요");
		return false;
	}
	var email = $("#email").val();
	if (email == '' ) {
		alert("이메일을 입력하세요");
		return false;
		}
	if(IsEmail(email)==false){
		alert("이메일 형식을 확인하세요");
		return false;
	}
		
	$("#memberUpdateForm").submit();		
}
function IsEmail(email) {
	  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  if(!regex.test(email)) {
	    return false;
	  }else{
	    return true;
	  }
	}
</script>

<!-- input타입이 숫자일때 스크롤 생기지 않게 하는 것 -->
<style>
input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button {
	    -webkit-appearance: none;             
	    margin: 0;         
	} 
</style>
<div class="login-wrap">
	<div class="login-content login-form hybrid-login-form hybrid-login-form-signup" style="margin-bottom: 600px;">
		<div class="hybrid-login-form-main">
			<h1>회원정보수정</h1>
			<sec:authentication var="memberVO" property="principal"/>  
			<form method="post" class="login-form" action="memberUpdate.do" id="memberUpdateForm">
				<sec:csrfInput />
				<div data-uia="login-field+container"
					class="nfInput nfEmailPhoneInput login-input login-input-email">
					<div class="nfInputPlacement">
						<div class="nfEmailPhoneControls">
							<label class="input_id">
								<input type="text" name="id" class="registerForNfTextField" id="id" tabindex="0" readonly="readonly" value="${memberVO.id}" style="color:gray"> 
								<label for="id_userLoginId" class="placeLabel">아이디</label> 
								<label for="id_userLoginId" class="confirmPlaceLabel" id="confirmId"></label> 
							</label>
						</div>
					</div>
				</div>
				<!--아이디 입력 END  -->
				<!--패스워드 1차 입력 START  -->
				<div data-uia="password-field+container"
					class="nfInput nfPasswordInput login-input login-input-password">
					<div class="nfInputPlacement">
						<div class="nfPasswordControls">
							<label class="input_id">
								<input type="password" name="password" class="registerForNfTextField" id="password" tabindex="0" required="required">
								<label for="id_password" class="placeLabel">비밀번호</label>
								<label for="id_password" class="confirmPlaceLabel" id="confirmPass"></label> 
							</label>
						</div>
					</div>
				</div>
				<!--패스워드 1차 입력 END  -->
				<!--패스워드 2차 입력 START  -->
				<div data-uia="login-field+container"
					class="nfInput nfPasswordInput login-input login-input-password">
					<div class="nfInputPlacement">
						<div class="nfPasswordControls">
							<label class="input_id">
								<input type="password" name="password2" class="registerForNfTextField" id="password2" tabindex="0" required="required">
								<label for="id_passwordConfirm" class="placeLabel">비밀번호 확인</label>
								<label for="id_passwordConfirm" class="confirmPlaceLabel" id="confirmPass2"></label> 
							</label>
						</div>
					</div>
				</div>
				<!--패스워드 2차 입력 END  -->
				<!--이름 입력 START  -->
				<div data-uia="login-field+container"
					class="nfInput nfEmailPhoneInput login-input login-input-email">
					<div class="nfInputPlacement">
						<div class="nfEmailPhoneControls">
							<label class="input_id">
								<input type="text" name="name" class="registerForNfTextField" id="name" tabindex="0" readonly="readonly" value="${memberVO.name}"> 
								<label for="id_name" class="placeLabel">이름</label> 
							</label>
						</div>
					</div>
				</div>
				<!--이름 입력 END  -->
				<!--전화번호 입력 START  -->
				<div data-uia="login-field+container"
					class="nfInput nfEmailPhoneInput login-input login-input-email">
					<div class="nfInputPlacement">
						<div class="nfEmailPhoneControls">
							<label class="input_id">
								<input type="number" name="tel" class="registerForNfTextField" id="tel" tabindex="0" placeholder="ex) 01032343234"  maxlength="11" value="${memberVO.tel}"> 
								<label for="id_tel" class="placeLabel">전화번호</label> 
							</label>
						</div>
					</div>
				</div>
				<!--전화번호 입력 END  -->
				<!--생년월일 입력 START  -->
				<div data-uia="login-field+container"
					class="nfInput nfEmailPhoneInput login-input login-input-email">
					<div class="nfInputPlacement">
						<div class="nfEmailPhoneControls">
							<label class="input_id">
						<%-- 	${memberVO.birth} --%>
								<input type="date" name="birth" class="registerForNfTextField" id="birth" tabindex="0" readonly="readonly" value="${memberVO.birth}"> 
								<label for="id_birth" class="placeLabel">생년월일</label> 
							</label>
						</div>
					</div>
				</div>
				<!--생년월일 입력 END  -->
				<!--성별 입력 START  -->
				<div data-uia="login-field+container"
					class="nfInput nfEmailPhoneInput login-input login-input-email">
					<div class="nfInputPlacement">
						<div class="nfEmailPhoneControls">
							<label class="input_id">							
								<select name="sex" class="selectBox">
								    <option value="none">--- 성별 ---</option>
								    <c:choose>
								    	<c:when test="${memberVO.sex=='남성'}">
								    		<option value="남성" selected="selected">남성</option>
								    		<option value="여성">여성</option>
								    	</c:when>
								    	<c:otherwise>
								    		<option value="남성">남성</option>
								    		<option value="여성"selected="selected">여성</option>
								    	</c:otherwise>
								    </c:choose>
								    
								    
							  	</select>
							</label>
						</div>
					</div>
				</div>
				<!--성별 입력 END  -->
				<!--이메일 입력 START  -->
				<div data-uia="login-field+container"
					class="nfInput nfEmailPhoneInput login-input login-input-email">
					<div class="nfInputPlacement">
						<div class="nfEmailPhoneControls">
							<label class="input_id">
								<input type="email" name="email" class="registerForNfTextField" id="email" tabindex="0" value="${memberVO.email}"> 
								<label for="id_email" class="placeLabel">이메일</label> 
							</label>
						</div>
					</div>
				</div>
				<!--이메일 입력 END  -->
				<!--주소 입력 START  -->
				<c:set var= "address" value="${memberVO.address}" />
				${fn:split(address,',' )[0]}
				${fn:split(address,',' )[1]}
				
				<div data-uia="login-field+container"
					class="nfInput nfEmailPhoneInput login-input login-input-email">
					<div class="nfInputPlacement">
						<div class="nfEmailPhoneControls">
							<label class="input_id">
								<input type="text" name="address" class="registerForNfTextField" id="address" tabindex="0" value="${fn:split(address,',' )[0]}"> 
								<label for="id_address" class="placeLabel">주소</label> 
							</label>
						</div>
					</div>
				</div>
				<div data-uia="login-field+container"
					class="nfInput nfEmailPhoneInput login-input login-input-email">
					<div class="nfInputPlacement">
						<div class="nfEmailPhoneControls">
							<label class="input_id">
								<input type="text" name="address" class="registerForNfTextField" id="address2" tabindex="0" value="${fn:split(address,',' )[1]}"> 
								<label for="id_address" class="placeLabel">상세주소</label> 
							</label>
						</div>
					</div>
				</div>
				
				<!--주소 입력 END  -->
				<!--이용약관동의 입력 START  -->
				<ul class="registerTermUl" style="height:20px;">
					<li><a href="#" class="mustSelect" id="notMustSelect">
					<c:choose>
						<c:when test="${memberVO.agreement=='동의'}">
							<input type='checkbox' name="agreement" id="selectMarketing" checked="checked" value="동의"/>
						</c:when>
						<c:otherwise>
							<input type='checkbox' name="agreement"id="selectMarketing" value="비동의"/>
						</c:otherwise>
					</c:choose>
					프로모션 정보 수신 동의<font color="red">(선택)</font></a></li>
				</ul>
				<!--이용약관동의 입력 END  -->
				</form>
				<!-- 버튼 -->
				<form action="${pageContext.request.contextPath}/memberDelete.do" id="memberDeleteForm">
				</form>
				<div class="row" style="margin: auto; width: 50%">
				  <div class="col-sm-offset-4 col-sm-5">
				  	<button class="btn login-button btn-submit btn-small" tabindex="0" onclick="memberDelete()" style="background-color: black">탈퇴신청</button>
				  </div>
				  <div class="col-sm-4">
				  	<button class="btn login-button btn-submit btn-small" tabindex="0" onclick="submit()">수정완료</button>
				  </div>
				</div>
		</div>
	</div>
</div>