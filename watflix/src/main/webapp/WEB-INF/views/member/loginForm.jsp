<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!---->
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<div class="login-wrap">
	<div class="login-content login-form hybrid-login-form hybrid-login-form-signup">
		<div class="hybrid-login-form-main">
			<h1>로그인</h1>
			<form method="post" class="login-form" action="login.do">
				<sec:csrfInput />
				<div data-uia="login-field+container" class="nfInput nfEmailPhoneInput login-input login-input-email">
					<div class="nfInputPlacement">
						<div class="nfEmailPhoneControls">
							<label class="input_id">
							<input type="text" name="id" class="nfTextField" id="id" tabindex="0"> 
							<label for="id_userLoginId" class="placeLabel">아이디</label> </label>
						</div>
					</div>
				</div>
				<div data-uia="password-field+container"
					class="nfInput nfPasswordInput login-input login-input-password">
					<div class="nfInputPlacement">
						<div class="nfPasswordControls">
							<label class="input_id">
							<input type="password" name="password" class="nfTextField" id="id_password" tabindex="0">
							<label for="id_password" class="placeLabel">비밀번호</label></label>
						</div>
					</div>
				</div>
				<button class="btn login-button btn-submit btn-small" type="submit" tabindex="0">로그인</button>
				<div class="hybrid-login-form-help">
					<div class="ui-binary-input login-remember-me">
						<input type="checkbox" class="" name="rememberMe" id="bxid_rememberMe_true" value="true" tabindex="0">
						<label for="bxid_rememberMe_true">
							<span class="login-remember-me-label-text">로그인 정보 저장</span>
						</label>
					</div>
				</div>
			</form>
		</div>
		<div class="hybrid-login-form-other">
			<div class="login-signup-now" data-uia="login-signup-now">
				Netflix 회원이 아닌가요? 
				<a class="" target="_self" href="${pageContext.request.contextPath}/memberRegisterFormTerms.do">
					지금 가입하세요
				</a>.
			</div>
		</div>
	</div>
</div>