<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<script type="text/javascript">
	$(document).ready(function(){
		//각 항목 클릭시 체크 toggle
		$("a.mustSelect").click(function(){
			if($(this).children("input[type=checkbox]").attr("checked")==null){
				var th=$(".mustSelect").index(this); //몇번째 항목의 동의를 했는지 확인
				if(th=='0'){
					window.open("${pageContext.request.contextPath}/watflixMustAgree.do", "popup","width=500,height=300,top=0,left=0");
				}
				else if(th=='1'){
					window.open("${pageContext.request.contextPath}/watflixMustPersonal.do", "popup","width=500,height=300,top=0,left=0");
				}
				else if(th=='2'){
					window.open("${pageContext.request.contextPath}/watflixSelectMarketing.do", "popup","width=500,height=300,top=0,left=0");
				}
				$(this).children("input[type=checkbox]").attr("checked","Y");
				
				//필수항목들 체크했는지 확인
				var mustAgree= $(".mustSelect").eq(0).children("input[type=checkbox]").attr("checked");
				var mustPersonal =$(".mustSelect").eq(1).children("input[type=checkbox]").attr("checked");
				//모두다 됐으면 확인 버튼 활성화
				if(mustAgree!=null&&mustPersonal!=null){
					$("#submitBtn").removeAttr("disabled");
				}
			}
			else{
				$(this).children("input[type=checkbox]").removeAttr("checked");
				//필수항목들 체크했는지 확인
				var mustAgree= $(".mustSelect").eq(0).children("input[type=checkbox]").attr("checked");
				var mustPersonal =$(".mustSelect").eq(1).children("input[type=checkbox]").attr("checked");
				if(mustAgree==null||mustPersonal==null){
					$("#submitBtn").attr("disabled","true");
				}
			}
		})
		//전체동의
		$("#mustSelectAll").click(function(){
			if($(this).children("input[type=checkbox]").attr("checked")==null){
				$(".mustSelect input[type=checkbox]").attr("checked","Y");
				$("#mustSelectAll input[type=checkbox]").attr("checked","Y");
				//필수항목들 체크했는지 확인
				var mustAgree= $(".mustSelect").eq(0).children("input[type=checkbox]").attr("checked");
				var mustPersonal =$(".mustSelect").eq(1).children("input[type=checkbox]").attr("checked");
				//모두다 됐으면 확인 버튼 활성화
				if(mustAgree!=null&&mustPersonal!=null){
					$("#submitBtn").removeAttr("disabled");
				}
			}
			else{
				$(".mustSelect input[type=checkbox]").removeAttr("checked");
				$("#mustSelectAll input[type=checkbox]").removeAttr("checked");
				//필수항목들 체크했는지 확인
				var mustAgree= $(".mustSelect").eq(0).children("input[type=checkbox]").attr("checked");
				var mustPersonal =$(".mustSelect").eq(1).children("input[type=checkbox]").attr("checked");
				if(mustAgree==null||mustPersonal==null){
					$("#submitBtn").attr("disabled","true");
				}
			}
		})
	}); //ready
	//취소
	function cancel(){
		location.href="${pageContext.request.contextPath}/home.do";
	}
	//전송
	function submit(){
		if($("#selectMarketing").attr("checked") == null){
			$("#selectMarketing").val("비동의");	
		}
		else{
			$("#selectMarketing").val("동의");	
		}
		$("#target").submit();
	}
</script>
<div class="login-wrap">
	<div class="login-content login-form hybrid-login-form hybrid-login-form-signup" style="margin-bottom: 0px;padding-left: 100px; padding-bottom:0px;">
		<div class="hybrid-login-form-main">
				<h1>이용약관</h1>
				<ul class="registerTermUl">
					<li>
						<a href="#" class="mustSelect">
							<input type='checkbox'/>WATFLIX 이용약관 동의<font color="red">(필수)</font>
						</a>
					</li>
					<li>
						<a href="#" class="mustSelect">
							<input type='checkbox' />개인정보 수집 및 이용 동의<font color="red">(필수)</font>
						</a>
					</li>
					<form method="post" class="login-form" action="memberRegisterForm.do" id="target">
						<sec:csrfInput />
						<li><a href="#" class="mustSelect" id="notMustSelect"><input type='checkbox' name="IsSelect"id="selectMarketing"/>프로모션 정보 수신 동의<font color="red">(선택)</font></a></li>
					</form>
					<li><a href="#" id="mustSelectAll"><input type='checkbox'/>전체동의</a></li>
				</ul>
				<!-- 버튼 -->
				<div class="row">
				  <div class="col-sm-offset-4 col-sm-4">
				  	<button class="btn login-button btn-submit btn-small" tabindex="0" onclick="cancel()">취소</button>
				  </div>
				  <div class="col-sm-4">
				  	<button class="btn login-button btn-submit btn-small" tabindex="0" onclick="submit()" disabled="true" id="submitBtn">확인</button>
				  </div>
				</div>
			
		</div>
	</div>
</div>