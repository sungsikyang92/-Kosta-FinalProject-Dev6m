<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script type="text/javascript">
	 $(document).ready(function(){
		 /* 권한이 있을때에만 로그아웃이벤트 활성화 */
		 <sec:authorize access="hasRole('ROLE_MEMBER')">
		 $("#logoutBtn").click(function() {
				$("#logoutForm").submit();
			});
		 
		 $("#mypageBtn").click(function(){
			 $("#mypageDiv").toggle('slow');
		 })
		 </sec:authorize> 
		 
		 /* 권한이 있을때에만 관리자페이지 활성화 */
		 <sec:authorize access="hasRole('ROLE_ADMIN')">
			 $("#logoutBtn").click(function() {
				$("#logoutForm").submit();
			});
		 </sec:authorize> 
		
		 $(".navli").hover(function(){
			 $("#sidebar-wrapper").attr("style","display:flex;")
	 		 $(".boardClassMain").attr("style","top:150px;")
		 })
		 $("#sidebar-wrapper").hover(function(){
			 $("#sidebar-wrapper").attr("style","display:flex;")
			  $(".boardClassMain").attr("style","top:150px;")
		 },function(){
			 $("#sidebar-wrapper").attr("style","display:none;")
			 $(".boardClassMain").attr("style","top:50px;")
		 })

	 })
	
</script>
  <!-- Navbar - OPEN -->
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark" id="navbar">
        <!-- Navbar content - OPEN -->
        <div class="container-lg">
            <!-- Logo - OPEN -->
            <a class="navbar-brand logo" href="home.do">
                <img src="${pageContext.request.contextPath}/resources/media/images/logo.png" width="80" alt="">
            </a>
            <!-- Logo - CLOSE -->

            <!-- Content collapse - OPEN -->
            <div class="collapse navbar-collapse" id="navbarToggler">

                <!-- Left - OPEN -->
                <ul class="navbar-nav mr-auto my-2 my-lg-0" id="navTab">
                    <li class="nav-item navli">
                        <a class="nav-link navbar-nav-item" href="#">
                            회원
                        </a>
                    </li>
                    <li class="nav-item navli">
                        <a class="nav-link navbar-nav-item" href="#">
                            상품
                        </a>
                    </li>
                    <li class="nav-item navli">
                        <a class="nav-link navbar-nav-item"  id="allPost" href="${pageContext.request.contextPath}/allPostForAdmin.do">
                            게시물
                        </a>
                    </li>
                    <li class="nav-item navli">
                        <a class="nav-link navbar-nav-item"  href="${pageContext.request.contextPath}/getNoticeListAdmin.do">
                            공지사항
                        </a>
                    </li>
                </ul>
                <!-- Left - CLOSE -->

                <!-- Right - OPEN -->
                <ul class="navbar-nav my-2 my-lg-0 navbar-right">
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                     <li class="nav-item">
                        <a class="nav-link navbar-nav-item" href="#" id="logoutBtn">로그아웃</a>
						   <form id="logoutForm" action="${pageContext.request.contextPath}/logout.do" method="post" style="display: none">
							<sec:csrfInput />
							</form>
                    </li>
                 </sec:authorize>
                  <sec:authorize access="!hasRole('ROLE_ADMIN')">			
                     <li class="nav-item">
                        <a class="nav-link navbar-nav-item" href="#" id="logoutBtn">로그인</a>
						   <form id="logoutForm" action="${pageContext.request.contextPath}/logout.do" method="post" style="display: none">
							<sec:csrfInput />
							</form>
                    </li>
                  </sec:authorize>			
                </ul>
                <!-- Right - OPEN -->
            </div>
            <!-- Content collapse - CLOSE -->
            <!-- Home Menu - OPEN -->
			 <nav id="sidebar-wrapper">
			 <!-- 회원관리 -->
			    <ul class="navbar-nav" id="navTab" style="display:block;margin-left: 5px;">
                    <li class="nav-item">
                        <a class="nav-link navbar-nav-item" href="${pageContext.request.contextPath}/adminControlMember.do">
                           회원관리
                        </a>
                    </li>         
                </ul>
              <!-- 상품관리 -->
                 <ul class="navbar-nav" id="navTab" style="display:block;margin-left: -25px;">
                    <li class="nav-item">
                        <a class="nav-link navbar-nav-item" href="${pageContext.request.contextPath}/productRegisterForm.do">
                           상품등록
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link navbar-nav-item" href="${pageContext.request.contextPath}/productList.do">
                          상품관리
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link navbar-nav-item" href="#">
                          구매내역관리
                        </a>
                    </li>
                </ul>
              <!-- 상품관리 -->
                 <ul class="navbar-nav" id="navTab" style="display:block;margin-left: -45px;">
                    <li class="nav-item">
                        <a class="nav-link navbar-nav-item" href="#">
                           평점게시물
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link navbar-nav-item" href="#">
                          리뷰게시물
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link navbar-nav-item" href="#">
                          신고게시물
                        </a>
                    </li>
                </ul>
 			 </nav>
		   <!-- Home Menu - CLOSE -->
        </div>
        <!-- Navbar content - CLOSE -->
    </nav>
    <!-- Navbar - CLOSE -->
     
    