<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script type="text/javascript">
$(document).ready(function() {
	 var slides=$(".main").find(".slides");
	 var slideWidth=198,slideMargin=30;
	 var currentIdx = new Array(slides.length);
	 var slideCount = new Array(slides.length);
	 var width = new Array(slides.length);
	 for(var i=0;i<slides.length;i++){
		 //각 행의 width값 계산
		 slideCount[i]=slides.eq(i).find(".slide_li").length;
		 $(slides.eq(i)).attr("style",function(){
			 width[i] =(slideWidth+slideMargin)*slideCount[i]-slideMargin;
			 return 'width:'+width[i]+'px';
		 });
		 //각 행의 인덱스값을 0으로 초기화
		 currentIdx[i]=0;
	 }
	 $(".prev").click(function(){
		var i = $(this).val();
		 if(currentIdx[i]>0){
			 moveSlide(currentIdx[i]-1,i)
		 }
		 else{
			 moveSlide(slideCount[i]-5,i)
		 }
	 })
	  $(".next").click(function(){
		  var i = $(this).val();
		 	 if(currentIdx[i]<slideCount[i]-5){
				 moveSlide(currentIdx[i]+1,i)
			 }
			 else{
				 moveSlide(0,i)
			 }
	 })
	 function moveSlide(num,index){
		    slides.eq(index).attr("style",function(){
		    	var left = -num*228;
		    	return 'width:'+width[index]+'px;left:'+left+'px';
		    })
		    currentIdx[index]=num;
		  }
	//컨텐츠 좋아요   
	   $(document).on("click","#ContentsLike",function(){
	   var me = $(this);
	   var num = Number(me.parent().children("#ContentsLikeCount").text());
	      $.ajax({
	         url: "contentsLikeExist.do",
	         type: "POST",
	         beforeSend : function(xhr){   
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            dataType: "text",
	            data: "contentsNo="+$(this).parent().children("input[type=hidden]").val(),
	            success: function(data){
	               if(data == "0"){
	                  me.parent().children("#ContentsLike").attr("src","${pageContext.request.contextPath}/resources/media/icons/RedHeart.png");
	               me.parent().children("#ContentsLikeCount").text(num+1);
	            }else{
	               me.parent().children("#ContentsLike").attr("src","${pageContext.request.contextPath}/resources/media/icons/HeartLine.png");
	               me.parent().children("#ContentsLikeCount").text(num-1);
	               }
	            }
	      });//ajax
	   });//click func for 컨텐츠 좋아요
})

</script>
<div class="container-lg margin-top margin-bottom main" style="margin-top: 90px;">

	<!-- Carousel - OPEN -->
	<!-- 장르 오픈 -->
	<c:forEach items="${requestScope.genreList}" var="genreVO" varStatus="status">
		<div class="slidr_wrapper_main">
			<h4>${genreVO.genreName}</h4>
			<div class="carousel_wrapper margin-top-under-sm">
				<!-- 컨텐츠 출력 -->
				<div class="slider_wrapper">
					<!-- 슬라이더 부모 시작 -->
					<ul class="slides">
						<c:forEach items="${requestScope.contentsList}" var="contentsVO">
							<c:if test="${contentsVO.genreVO.genreCode==genreVO.genreCode}">
								<!--컨텐츠 리스트 출력 For문 START  -->
								<li class="slide_li">
									<!-- 컨텐츠 작은 썸네일 --> <img class="carousel-cell-image"
									src="${pageContext.request.contextPath}/${contentsVO.contentsSmallThumbnail}" />
									<!-- 컨텐츠 제목 -->
									<h5 class="card-title text-center">${contentsVO.contentsTitle}</h5>

									<div class="row">
										<div class="col-3 text-left no-padding">
											${contentsVO.contentsDate}</div>
										<div class="col-6 text-center no-padding">
											<!-- 좋아요 영역 시작 -->
											<!--로그인 전 컨텐츠 리스트 출력 For문 START  -->
											<sec:authorize access="!isAuthenticated()">
												<a href="${pageContext.request.contextPath}/loginForm.do">
													<img id="NeedLogin" class="NeedLogin"
													src="${pageContext.request.contextPath}/resources/media/icons/HeartLine.png"
													width=25px height=25px>
												</a>
												<span id="ContentsLikeCount">${contentsVO.contentsLikes}</span>
												<input type="hidden" value="${contentsVO.contentsNo}">
											</sec:authorize>
											<!--로그인 전 컨텐츠 리스트 출력 For문 END  -->
											<!--로그인후 컨텐츠 리스트 출력 For문 START  -->
											<sec:authorize access="isAuthenticated()">
												<c:choose>
													<c:when test="${contentsVO.contentsLikeStatus == 1}">
														<img id="ContentsLike" class="ContentsLike"
															src="${pageContext.request.contextPath}/resources/media/icons/RedHeart.png"
															width=25px height=25px>
													</c:when>
													<c:otherwise>
														<img id="ContentsLike" class="ContentsLike"
															src="${pageContext.request.contextPath}/resources/media/icons/HeartLine.png"
															width=25px height=25px>
													</c:otherwise>
												</c:choose>
												<span id="ContentsLikeCount">${contentsVO.contentsLikes}</span>
												<input type="hidden" value="${contentsVO.contentsNo}">
											</sec:authorize>
											<!--로그인 후 컨텐츠 리스트 출력 For문 END  -->
											<!-- 좋아요 영역 끝 -->
										</div>
										<div class="col-3 text-right no-padding rating">
											<img
												src="${pageContext.request.contextPath}/resources/media/icons/star.png"
												width="10" alt="" style="padding-bottom: 3px">
											${contentsVO.contentsAvgStars}
										</div>
									</div>
									<div class="overlay">
										<div class="text">
											<a href="${pageContext.request.contextPath}/contentsDetail.do?contentsNo=${contentsVO.contentsNo}"
												class="btn btn-primary btn-sm margin-top-under-sm"
												role="button" aria-pressed="true"> <img
												src="${pageContext.request.contextPath}/resources/media/icons/play.png"
												width="10" alt=""> 상세보기
											</a>
										</div>
									</div>
								</li>
								<!--컨텐츠 리스트 출력 For문 END  -->
							</c:if>
						</c:forEach>
					</ul>
					<!-- 슬라이더 부모 끝 -->
				</div>
				<button class="flickity-button prev" type="button" value="${status.index}">
					<svg class="flickity-button-icon" viewBox="0 0 100 100">
		                  <path
							d="M 10,50 L 60,100 L 70,90 L 30,50  L 70,10 L 60,0 Z"
							class="arrow">
		                  </path>
	                  </svg>
				</button>
				<button class="flickity-button next" type="button" value="${status.index}">
					<svg class="flickity-button-icon" viewBox="0 0 100 100">
						  <path d="M 10,50 L 60,100 L 70,90 L 30,50  L 70,10 L 60,0 Z"
							class="arrow" transform="translate(100, 100) rotate(180) ">
						  </path>
					  </svg>
				</button>
				<!-- 버튼 끝 -->
			</div>
			<!-- carousel_wrapper - CLOSE -->
		</div>
		<!-- Tabs content - CLOSE -->
	</c:forEach>
</div>

