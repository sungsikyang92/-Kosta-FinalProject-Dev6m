<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!---->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="login-wrap">
	<div class="login-content login-form hybrid-login-form hybrid-login-form-signup"
		data-uia="login-page-container">
		<div class="hybrid-login-form-main">
			<h1>로그인</h1>
			<form method="post" class="login-form" action="login.do">
			<sec:csrfInput/>
				<div data-uia="login-field+container" class="nfInput nfEmailPhoneInput login-input login-input-email">
					<div class="nfInputPlacement">
						<div class="nfEmailPhoneControls">
							<label class="input_id"><input type="text" data-uia="login-field" name="id" class="nfTextField"
								id="id" value="" tabindex="0" autocomplete="email"
								dir="">
								<label for="id_userLoginId" class="placeLabel">이메일
									주소 또는 전화번호</label>
									</label>
						</div>
					</div>
				</div>
				<div data-uia="password-field+container"
					class="nfInput nfPasswordInput login-input login-input-password">
					<div class="nfInputPlacement">
						<div class="nfPasswordControls">
							<label class="input_id"><input type="password"
								data-uia="password-field" name="password" class="nfTextField"
								id="id_password" value="" tabindex="0" autocomplete="password"
								dir=""><label for="id_password" class="placeLabel">비밀번호</label></label>
							<button data-uia="password-visibility-toggle"
								id="id_password_toggle" type="button" class="nfPasswordToggle"
								title="비밀번호 표시">표시</button>
						</div>
					</div>
				</div>
				<button class="btn login-button btn-submit btn-small" type="submit"
					autocomplete="off" tabindex="0" data-uia="login-submit-button">로그인</button>
				<div class="hybrid-login-form-help">
					<div class="ui-binary-input login-remember-me">
						<input type="checkbox" class="" name="rememberMe"
							id="bxid_rememberMe_true" value="true" tabindex="0"
							data-uia="rememberMe" checked=""><label
							for="bxid_rememberMe_true" data-uia="label+rememberMe"><span
							class="login-remember-me-label-text">로그인 정보 저장</span></label>
						<div class="helper"></div>
					</div>
					<a href="/LoginHelp" class="login-help-link"
						data-uia="login-help-link">도움이 필요하신가요?</a>
				</div>
				<input type="hidden" name="flow" value="websiteSignUp"><input
					type="hidden" name="mode" value="login"><input
					type="hidden" name="action" value="loginAction"><input
					type="hidden" name="withFields"
					value="rememberMe,nextPage,userLoginId,password,countryCode,countryIsoCode,recaptchaResponseToken,recaptchaError,recaptchaResponseTime"><input
					type="hidden" name="authURL"
					value="1606804949086.A4XqZAE2AVEghJNA9cCyvfrHMZ8="><input
					type="hidden" name="nextPage"
					value="https://www.netflix.com/browse/genre/9994"><input
					type="hidden" name="showPassword" value=""><input
					type="hidden" name="countryCode" value="+82"><input
					type="hidden" name="countryIsoCode" value="KR">
			</form>
		</div>
		<div class="hybrid-login-form-other">
			
			<div class="login-signup-now" data-uia="login-signup-now">
				Netflix 회원이 아닌가요? <a class=" " target="_self" href="/">지금 가입하세요</a>.
			</div>
			<div class="recaptcha-terms-of-use" data-uia="recaptcha-terms-of-use">
				<p>
					<span>이 페이지는 Google reCAPTCHA의 보호를 받아 사용자가 로봇이 아님을 확인합니다.</span>&nbsp;
					<button class="recaptcha-terms-of-use--link-button"
						data-uia="recaptcha-learn-more-button">자세히 알아보기</button>
				</p>
				<div class="recaptcha-terms-of-use--disclosure"
					data-uia="recaptcha-disclosure">
					<span id="" data-uia="recaptcha-disclosure-text">Google
						reCAPTCHA가 수집하는 정보에는 Google <a
						href="https://policies.google.com/privacy"
						data-uia="recaptcha-privacy-link">개인정보처리방침</a>과 <a
						href="https://policies.google.com/terms"
						data-uia="recaptcha-tos-link">서비스 약관</a>이 적용되며, 해당 정보는 reCAPTCHA
						서비스 제공, 관리 및 개선과 일반적인 보안 유지에 사용됩니다(Google의 개인 맞춤 광고에 사용 안 함).
					</span>
				</div>
			</div>
		</div>
	</div>
</div>