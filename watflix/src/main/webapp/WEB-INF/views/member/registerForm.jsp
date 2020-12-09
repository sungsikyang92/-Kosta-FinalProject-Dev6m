<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//아이디 입력시 중복값 확인
		$("#id").keyup(function() {
			if($("#id").val()==''){
				$("#confirmId").html("").css("color","black");
			}
			else{
				$.ajax({
					type: "post",
					url:"${pageContext.request.contextPath}/memberIdCheck.do",
					beforeSend:function(xhr){  
			            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			        },
					data: "id="+$("#id").val(),
					success:function(result){ // result변수로 응답정보가 전달된다.
						if(result==='ok'){
							$("#confirmId").html("사용가능").css("color","blue");
						}
						else{
							$("#confirmId").html("사용불가능").css("color","red");
						}
					}
				});//ajax
			}
		})//아이디 keyup
		
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
			<h1>회원가입</h1>
			<form method="post" class="login-form" action="memberRegister.do">
				<sec:csrfInput />
				<div data-uia="login-field+container"
					class="nfInput nfEmailPhoneInput login-input login-input-email">
					<div class="nfInputPlacement">
						<div class="nfEmailPhoneControls">
							<label class="input_id">
								<input type="text" name="id" class="registerForNfTextField" id="id" tabindex="0" required="required"> 
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
								<input type="text" name="name" class="registerForNfTextField" id="name" tabindex="0" required="required"> 
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
								<input type="number" name="tel" class="registerForNfTextField" id="tel" tabindex="0" placeholder="ex) 01032343234" required="required" maxlength="11"> 
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
								<input type="date" name="birth" class="registerForNfTextField" id="birth" tabindex="0" required="required"> 
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
								<select name="sex" class="selectBox" required="required">
								    <option value="남성">--- 성별 ---</option>
								    <option value="남성">남성</option>
								    <option value="여성">여성</option>
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
								<input type="email" name="email" class="registerForNfTextField" id="email" tabindex="0" required="required"> 
								<label for="id_email" class="placeLabel">이메일</label> 
							</label>
						</div>
					</div>
				</div>
				<!--이메일 입력 END  -->
				<!--주소 입력 START  -->
				<div data-uia="login-field+container"
					class="nfInput nfEmailPhoneInput login-input login-input-email">
					<div class="nfInputPlacement">
						<div class="nfEmailPhoneControls">
							<label class="input_id">
								<input type="text" name="address" class="registerForNfTextField" id="address" tabindex="0" required="required" style="font-size:15px;"> 
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
								<input type="text" name="address" class="registerForNfTextField" id="address2" tabindex="0" style="font-size:15px;"> 
								<label for="id_address" class="placeLabel">상세주소</label> 
							</label>
						</div>
					</div>
				</div>
				<!--주소 입력 END  -->
				<!--이용약관동의 입력 START  -->
				<input type="hidden" name="agreement" value="${requestScope.ISselectMarketing}">
				<!--이용약관동의 입력 END  -->
				<button class="btn login-button btn-submit btn-small" type="submit" tabindex="0">가입완료</button>
			</form>
		</div>
	</div>
</div>