<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<div class="login-wrap">
	<div class="login-content login-form hybrid-login-form hybrid-login-form-signup" data-uia="login-page-container" style="margin-bottom: 600px;">
		<div class="hybrid-login-form-main">
			<h1>회원가입</h1>
			<form method="post" class="login-form" action="memberRegister.do">
				<sec:csrfInput />
				<div data-uia="login-field+container"
					class="nfInput nfEmailPhoneInput login-input login-input-email">
					<div class="nfInputPlacement">
						<div class="nfEmailPhoneControls">
							<label class="input_id">
								<input type="text" data-uia="login-field" name="id" class="nfTextField" id="id" value="" tabindex="0" autocomplete="email" dir=""> 
								<label for="id_userLoginId" class="placeLabel">이메일 주소</label> 
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
								<input type="password" data-uia="password-field" name="password" class="nfTextField"
									id="id_password" value="" tabindex="0" autocomplete="password" dir="" required="required">
								<label for="id_password" class="placeLabel">비밀번호</label>
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
								<input type="password" data-uia="password-field" name="password2" class="nfTextField"
									id="id_password" value="" tabindex="0" autocomplete="password" dir="" required="required">
								<label for="id_password" class="placeLabel">비밀번호 확인</label>
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
								<input type="text" data-uia="login-field" name="name" class="nfTextField" id="name" value="" tabindex="0" autocomplete="email" dir="" required="required"> 
								<label for="id_userLoginId" class="placeLabel">이름</label> 
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
								<input type="text" data-uia="login-field" name="tel" class="nfTextField" id="tel" value="" tabindex="0" autocomplete="email" dir=""> 
								<label for="id_userLoginId" class="placeLabel">전화번호</label> 
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
								<input type="date" data-uia="login-field" name="birth" class="nfTextField" id="birth" value="" tabindex="0" autocomplete="email" dir="" required="required"> 
								<label for="id_userLoginId" class="placeLabel">생년월일</label> 
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
								<input type="text" data-uia="login-field" name="sex" class="nfTextField" id="birth" value="" tabindex="0" autocomplete="email" dir=""> 
								<label for="id_userLoginId" class="placeLabel">성별</label> 
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
								<input type="text" data-uia="login-field" name="email" class="nfTextField" id="email" value="" tabindex="0" autocomplete="email" dir=""> 
								<label for="id_userLoginId" class="placeLabel">이메일</label> 
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
								<input type="text" data-uia="login-field" name="address" class="nfTextField" id="address" value="" tabindex="0" autocomplete="email" dir=""> 
								<label for="id_userLoginId" class="placeLabel">주소</label> 
							</label>
						</div>
					</div>
				</div>
				<!--주소 입력 END  -->
				
				<button class="btn login-button btn-submit btn-small" type="submit" autocomplete="off" tabindex="0" data-uia="login-submit-button">회원가입</button>
			</form>
		</div>
	</div>
</div>