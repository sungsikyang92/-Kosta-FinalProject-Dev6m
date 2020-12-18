<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
$(document).ready(function(){
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

//탭클릭시 컨텐츠 클릭
function tabContents(contentsList){
	$(".slides").html("");
	$(".slides").attr("style","width:2250px;left:0px;");
     for(let contents of contentsList){
    	 /* 비로그인 상태의 좋아요 */
    	 <sec:authorize access="!isAuthenticated()">
    	 $newTbody = $(
    			 "<li class='slide_li'>"+"<img class='carousel-cell-image' src='${pageContext.request.contextPath}/"+contents.contentsSmallThumbnail+"' />"+
    			 "<h5 class='card-title text-center'>"+contents.contentsTitle+"</h5>"+
    			 "<div class='row'><div class='col-3 text-left no-padding'>"+contents.contentsDate+"</div>"+
	             "<div class='col-6 text-center no-padding'><a href='${pageContext.request.contextPath}/loginForm.do'>"+
                 "<img id='NeedLogin' class='NeedLogin' src='${pageContext.request.contextPath}/resources/media/icons/HeartLine.png' width=25px height=25px></a>"+
                 "<span id='ContentsLikeCount'>"+contents.contentsLikes+"</span><input type='hidden' value='"+contents.contentsNo+"'></div>"+
                 "<div class='col-3 text-right no-padding rating'><img src='${pageContext.request.contextPath}/resources/media/icons/star.png' width='10' alt='' style='padding-bottom: 3px'>"+
                 contents.contentsAvgStars+"</div></div>"+
             	"<div class='overlay'><div class='text'><a href='${pageContext.request.contextPath}/contentsDetail.do?contentsNo="+contents.contentsNo+"' class='btn btn-primary btn-sm margin-top-under-sm'"+
             	"role='button' aria-pressed='true'><img src='${pageContext.request.contextPath}/resources/media/icons/play.png' width='10' alt=''>상세보기</a></div></div></li>"
    	 );
    	 $(".slides").append($newTbody);
    	 </sec:authorize>
    	 /* 로그인 상태의 좋아요  */
    	 <sec:authorize access="isAuthenticated()">
         if(contents.contentsLikeStatus==1){
        	 $newTbody = $(
        			 "<li class='slide_li'>"+"<img class='carousel-cell-image' src='${pageContext.request.contextPath}/"+contents.contentsSmallThumbnail+"' />"+
        			 "<h5 class='card-title text-center'>"+contents.contentsTitle+"</h5>"+
        			 "<div class='row'><div class='col-3 text-left no-padding'>"+contents.contentsDate+"</div>"+
    	             "<div class='col-6 text-center no-padding'><img id='ContentsLike' class='ContentsLike' src='${pageContext.request.contextPath}/resources/media/icons/RedHeart.png' width=25px height=25px>"+
    	             "<span id='ContentsLikeCount'>"+contents.contentsLikes+"</span><input type='hidden' value='"+contents.contentsNo+"'></div>"+
                     "<div class='col-3 text-right no-padding rating'><img src='${pageContext.request.contextPath}/resources/media/icons/star.png' width='10' alt='' style='padding-bottom: 3px'>"+
                     contents.contentsAvgStars+"</div></div>"+
                 	"<div class='overlay'><div class='text'><a href='${pageContext.request.contextPath}/contentsDetail.do?contentsNo="+contents.contentsNo+"' class='btn btn-primary btn-sm margin-top-under-sm'"+
                 	"role='button' aria-pressed='true'><img src='${pageContext.request.contextPath}/resources/media/icons/play.png' width='10' alt=''>상세보기</a></div></div></li>"
        	 );
        	 $(".slides").append($newTbody);
         }
         else{
        	 $newTbody = $(
        			 "<li class='slide_li'>"+"<img class='carousel-cell-image' src='${pageContext.request.contextPath}/"+contents.contentsSmallThumbnail+"' />"+
        			 "<h5 class='card-title text-center'>"+contents.contentsTitle+"</h5>"+
        			 "<div class='row'><div class='col-3 text-left no-padding'>"+contents.contentsDate+"</div>"+
    	             "<div class='col-6 text-center no-padding'><img id='ContentsLike' class='ContentsLike' src='${pageContext.request.contextPath}/resources/media/icons/HeartLine.png' width=25px height=25px>"+
    	             "<span id='ContentsLikeCount'>"+contents.contentsLikes+"</span><input type='hidden' value='"+contents.contentsNo+"'></div>"+
                     "<div class='col-3 text-right no-padding rating'><img src='${pageContext.request.contextPath}/resources/media/icons/star.png' width='10' alt='' style='padding-bottom: 3px'>"+
                     contents.contentsAvgStars+"</div></div>"+
                 	"<div class='overlay'><div class='text'><a href='${pageContext.request.contextPath}/contentsDetail.do?contentsNo="+contents.contentsNo+"' class='btn btn-primary btn-sm margin-top-under-sm'"+
                 	"role='button' aria-pressed='true'><img src='${pageContext.request.contextPath}/resources/media/icons/play.png' width='10' alt=''>상세보기</a></div></div></li>"
        	 );
        	 $(".slides").append($newTbody);
         }
         </sec:authorize>
     }//for문 종료
}
//컨텐츠 출력
function denote(contentsList){
     if(contentsList.length==0){
        $("#loadMore").attr('style',"margin-top: 0px;display:none;");
     }
     else{
        $newTbody = $("<div class='card-deck'>")
        $("#grid-movies").append($newTbody)
        /* 비로그인 상태의 좋아요 */
        for(let contents of contentsList){
           <sec:authorize access="!isAuthenticated()">
             let $cellsOfRow = 
                $("<div class='card carousel-cell' style='display:block'>"+
                       "<img class='card-img-top' src='${pageContext.request.contextPath}/"+contents.contentsSmallThumbnail+"'/>" +
                          "<h5 class='card-title text-center'>"+contents.contentsTitle+"</h5>"+
                           "<div class='row'>"+
                           "<div class='col-3 text-left no-padding'>"+contents.contentsDate+"</div>"+
                           "<div class='col-6 text-center no-padding'>"+
                           "<a href='${pageContext.request.contextPath}/loginForm.do'>"+
                          "<img id='NeedLogin' class='NeedLogin' src='${pageContext.request.contextPath}/resources/media/icons/HeartLine.png' width=25px height=25px>"+"</a>"+
                          "<span id='ContentsLikeCount'>"+contents.contentsLikes+"</span>"+
                          "<input type='hidden' value="+contents.contentsNo+">"+"</div>"+
                        "<div class='col-3 text-right no-padding rating'>"+"<img src='${pageContext.request.contextPath}/resources/media/icons/star.png' width='10' alt='' class='padding-bottom-sm'>"+contents.contentsAvgStars+"</div>"+
                       "</div>"+
                       "<div class='overlay'>"+"<div class='text'>"+
                          "<a href='${pageContext.request.contextPath}/contentsDetail.do?contentsNo="+contents.contentsNo+"'class='btn btn-primary btn-sm margin-top-under-sm' role='button' aria-pressed='true'>"+
                              "<img src='${pageContext.request.contextPath}/resources/media/icons/play.png' width='10' alt=''>상세보기"+"</a>"+
                         "</div>"+
                     "</div>"+
                     "</div>"+
                  "</div>");
             $newTbody.append($cellsOfRow);
         </sec:authorize>
         /* 로그인 상태의 좋아요 */
         <sec:authorize access="isAuthenticated()">
            if(contents.contentsLikeStatus==1){
                let $cellsOfRow = 
                    $("<div class='card carousel-cell' style='display:block'>"+
                           "<img class='card-img-top' src='${pageContext.request.contextPath}/"+contents.contentsSmallThumbnail+"'/>" +
                              "<h5 class='card-title text-center'>"+contents.contentsTitle+"</h5>"+
                               "<div class='row'>"+
                               "<div class='col-3 text-left no-padding'>"+contents.contentsDate+"</div>"+
                               "<div class='col-6 text-center no-padding'>"+
                               "<img id='ContentsLike' class='ContentsLike' src='${pageContext.request.contextPath}/resources/media/icons/RedHeart.png' width=25px height=25px>"+
                               "<span id='ContentsLikeCount'>"+contents.contentsLikes+"</span>"+
                              "<input type='hidden' value="+contents.contentsNo+">"+"</div>"+
                            "<div class='col-3 text-right no-padding rating'>"+"<img src='${pageContext.request.contextPath}/resources/media/icons/star.png' width='10' alt='' class='padding-bottom-sm'>"+contents.contentsAvgStars+"</div>"+
                           "</div>"+
                           "<div class='overlay'>"+"<div class='text'>"+
                              "<a href='${pageContext.request.contextPath}/contentsDetail.do?contentsNo="+contents.contentsNo+"'class='btn btn-primary btn-sm margin-top-under-sm' role='button' aria-pressed='true'>"+
                                  "<img src='${pageContext.request.contextPath}/resources/media/icons/play.png' width='10' alt=''>상세보기"+"</a>"+
                             "</div>"+
                         "</div>"+
                         "</div>"+
                      "</div>");
               $newTbody.append($cellsOfRow);
            }
            else{
                let $cellsOfRow = 
                $("<div class='card carousel-cell' style='display:block'>"+
                        "<img class='card-img-top' src='${pageContext.request.contextPath}/"+contents.contentsSmallThumbnail+"'/>" +
                           "<h5 class='card-title text-center'>"+contents.contentsTitle+"</h5>"+
                            "<div class='row'>"+
                            "<div class='col-3 text-left no-padding'>"+contents.contentsDate+"</div>"+
                            "<div class='col-6 text-center no-padding'>"+
                           "<img id='ContentsLike' class='ContentsLike' src='${pageContext.request.contextPath}/resources/media/icons/HeartLine.png' width=25px height=25px>"+
                          "<span id='ContentsLikeCount'>"+contents.contentsLikes+"</span>"+
                          "<input type='hidden' value="+contents.contentsNo+">"+"</div>"+
                         "<div class='col-3 text-right no-padding rating'>"+"<img src='${pageContext.request.contextPath}/resources/media/icons/star.png' width='10' alt='' class='padding-bottom-sm'>"+contents.contentsAvgStars+"</div>"+
                        "</div>"+
                        "<div class='overlay'>"+"<div class='text'>"+
                           "<a href='${pageContext.request.contextPath}/contentsDetail.do?contentsNo="+contents.contentsNo+"'class='btn btn-primary btn-sm margin-top-under-sm' role='button' aria-pressed='true'>"+
                               "<img src='${pageContext.request.contextPath}/resources/media/icons/play.png' width='10' alt=''>상세보기"+"</a>"+
                          "</div>"+
                      "</div>"+
                      "</div>"+
                   "</div>");
               $newTbody.append($cellsOfRow);
            }//하트체크여부else
         </sec:authorize>
          
        }//for문종료
        $("#loadMore").attr('style',"margin-top: 0px;");
     }//else
}

</script>
	<script src="${pageContext.request.contextPath}/resources/js/mainsub.js"
		defer></script>

  <!-- Slider - OPEN -->
    <div id="mainCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#mainCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#mainCarousel" data-slide-to="1"></li>
            <li data-target="#mainCarousel" data-slide-to="2"></li>
            <li data-target="#mainCarousel" data-slide-to="3"></li>
            <li data-target="#mainCarousel" data-slide-to="4"></li>
        </ol>
        <div class="carousel-inner">
        <!-- FOR문 Start : 메인 상단에 랜덤으로 컨텐츠를 슬라이드 형식으로 보여주기 -->
        <c:forEach items="${requestScope.contentsList}" var="contentsVO"  varStatus="status" begin="${requestScope.randomIndex}" end="${requestScope.randomIndex+5}">
        <!-- IF문 Start : 첫번째 게시물의 div class에 active를 주기 위함  -->
           <c:choose>
              <c:when test="${status.first}">
                 <!-- Stranger Things - OPEN -->
                  <div class="carousel-item active">
                      <img class="d-block w-100" src="${pageContext.request.contextPath}/${contentsVO.contentsBigThumbnail}" alt="Second slide">
                      <div class="carousel-caption d-none d-md-block container-lg align-middle">
                            <!-- 제목 -->
                          <h1>${contentsVO.contentsTitle}</h1>
                          <p> <a href="#">${contentsVO.contentsDate}</a> | ${contentsVO.contentsAge} | <a href="#">${contentsVO.contentsType}</a> | <a href="#">${contentsVO.genreVO.genreName}</a> </p>
                          <!-- 줄거리 -->
                          <p class="margin-top-under-sm">
                              ${contentsVO.contentsSummary}
                          </p>
                          <div class="margin-top-under-sm">
                              <a href="${pageContext.request.contextPath}/contentsDetail.do?contentsNo=${contentsVO.contentsNo}" class="btn btn-primary btn-lg margin-right" role="button" aria-pressed="true">
                                  <img src="${pageContext.request.contextPath}/resources/media/icons/play.png" width="20" alt="">
                                  상세보기
                              </a>
                          </div>
                      </div>
                  </div>
                  <!-- Stranger Things - CLOSE -->
              </c:when>
              <c:otherwise>
                 <!-- Stranger Things - OPEN -->
                  <div class="carousel-item">
                      <img class="d-block w-100" src="${pageContext.request.contextPath}/${contentsVO.contentsBigThumbnail}" alt="Second slide">
                      <div class="carousel-caption d-none d-md-block container-lg align-middle">
                            <!-- 제목 -->
                          <h1>${contentsVO.contentsTitle}</h1>
                            <p> <a href="#">${contentsVO.contentsDate}</a> | ${contentsVO.contentsAge} | <a href="#">${contentsVO.contentsType}</a> | <a href="#">${contentsVO.genreVO.genreName}</a> </p>
                          <!-- 줄거리 -->
                          <p class="margin-top-under-sm">
                              ${contentsVO.contentsSummary}
                          </p>
                          <div class="margin-top-under-sm">
                              <a href="${pageContext.request.contextPath}/contentsDetail.do?contentsNo=${contentsVO.contentsNo}" class="btn btn-primary btn-lg margin-right" role="button" aria-pressed="true">
                                  <img src="${pageContext.request.contextPath}/resources/media/icons/play.png" width="20" alt="">
                                  상세보기
                              </a>
                          </div>
                      </div>
                  </div>
                  <!-- Stranger Things - CLOSE -->
              </c:otherwise>
           </c:choose>
           <!-- IF문 END  -->
        </c:forEach>
        <!-- FOR문 END -->
        </div>
    </div>
    <!-- Slider - CLOSE -->
    <!-- Content - OPEN -->
    <div class="container-lg margin-top margin-bottom">
        <!-- Tabs nav - OPEN -->
        <nav class="nav nav-fill nav-pills" id="pills-tab" role="tablist">
            <a class="nav-item nav-link active" id="highHits-tab" data-toggle="pill" href="#highHits" role="tab" aria-controls="trend-tab" aria-selected="true">
                <div class="icon-nav">
                    <img src="${pageContext.request.contextPath}/resources/media/icons/trend.png" width="15" alt="" class="margin-right-sm">
                    인기컨텐츠
                </div>
            </a>
            <a class="nav-item nav-link" id="highAgeStar-tab" data-toggle="pill" href="#highAgeStar" role="tab" aria-controls="popular-tab" aria-selected="false">
                <div class="icon-nav">
                    <img src="${pageContext.request.contextPath}/resources/media/icons/fire.png" width="15" alt="" class="margin-right-sm">
                      평점높은 컨텐츠
                </div>
            </a>
            <a class="nav-item nav-link" id="highCommentsCount-tab" data-toggle="pill" href="#highCommentsCount" role="tab" aria-controls="new-tab" aria-selected="false">
                <div class="icon-nav">
                    <img src="${pageContext.request.contextPath}/resources/media/icons/clock.png" width="15" alt="" class="margin-right-sm">
                    최다등록평점
                </div>
            </a>
           
        </nav>
        <!-- Tabs nav - CLOSE -->

        <!-- Tabs content - OPEN -->
        	  <div class="slidr_wrapper_main">
        	    <!-- carousel_wrapper - OPEN -->
  					<div class="carousel_wrapper margin-top-under-sm">
	  					<div class="slider_wrapper">
		  					<!-- 슬라이더 부모 시작 -->
		  					<ul class="slides">
		                     <c:forEach items="${requestScope.highHits}" var="contentsVO">
		                     <li class="slide_li">
		                           <!-- 컨텐츠 작은 썸네일 -->
		                           <img class="carousel-cell-image" src="${pageContext.request.contextPath}/${contentsVO.contentsSmallThumbnail}" />
		                           <!-- 컨텐츠 제목 -->
		                           <h5 class="card-title text-center">${contentsVO.contentsTitle}</h5>
		                           <div class="row">
		                            <div class="col-3 text-left no-padding">
		                                ${contentsVO.contentsDate}
		                            </div>
		                            <div class="col-6 text-center no-padding">
		                               <!-- 좋아요 영역 시작 -->
		                                <!--로그인 전 컨텐츠 리스트 출력 For문 START  -->
		                             <sec:authorize access="!isAuthenticated()">
		                                       <a href="${pageContext.request.contextPath}/loginForm.do">
		                                          <img id="NeedLogin" class="NeedLogin" src="${pageContext.request.contextPath}/resources/media/icons/HeartLine.png" width=25px height=25px>
		                                       </a>
		                                          <span id="ContentsLikeCount">${contentsVO.contentsLikes}</span>
		                                          <input type="hidden" value="${contentsVO.contentsNo}">
		                             </sec:authorize>
		                              <!--로그인 전 컨텐츠 리스트 출력 For문 END  -->
		                              <!--로그인후 컨텐츠 리스트 출력 For문 START  -->
		                               <sec:authorize access="isAuthenticated()">
		                                    <c:choose>
		                                       <c:when test="${contentsVO.contentsLikeStatus == 1}">
		                                         <img id="ContentsLike" class="ContentsLike" src="${pageContext.request.contextPath}/resources/media/icons/RedHeart.png" width=25px height=25px>
		                                       </c:when>
		                                       <c:otherwise>
		                                          <img id="ContentsLike" class="ContentsLike" src="${pageContext.request.contextPath}/resources/media/icons/HeartLine.png" width=25px height=25px>
		                                       </c:otherwise>
		                                    </c:choose>
		                                    <span id="ContentsLikeCount">${contentsVO.contentsLikes}</span>
		                                    <input type="hidden" value="${contentsVO.contentsNo}">
		                                  </sec:authorize>
		                              <!--로그인 후 컨텐츠 리스트 출력 For문 END  -->
		                         <!-- 좋아요 영역 끝 -->
		                            </div>
		                            <div class="col-3 text-right no-padding rating">
		                                <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" style="padding-bottom: 3px">
		                                ${contentsVO.contentsAvgStars}
		                            </div>
		                        </div>
		                        <div class="overlay">
		                            <div class="text">
		                                <a href="${pageContext.request.contextPath}/contentsDetail.do?contentsNo=${contentsVO.contentsNo}" class="btn btn-primary btn-sm margin-top-under-sm" role="button" aria-pressed="true">
		                                    <img src="${pageContext.request.contextPath}/resources/media/icons/play.png" width="10" alt="">
		                                    상세보기
		                                </a>
		                            </div>
		                        </div>
		                    </li>
		                     </c:forEach>
		                     </ul>
		                     <!-- 슬라이더 부모 끝 -->
				  </div>
				    <!-- 버튼 시작 -->
                     <button class="flickity-button prev" type="button">
	                  <svg class="flickity-button-icon" viewBox="0 0 100 100">
		                  <path d="M 10,50 L 60,100 L 70,90 L 30,50  L 70,10 L 60,0 Z" class="arrow">
		                  </path>
	                  </svg>
                  </button>
				  <button class="flickity-button next" type="button">
					  <svg class="flickity-button-icon" viewBox="0 0 100 100">
						  <path d="M 10,50 L 60,100 L 70,90 L 30,50  L 70,10 L 60,0 Z" class="arrow" transform="translate(100, 100) rotate(180) ">
						  </path>
					  </svg>
				  </button>
				   <!-- 버튼 끝 -->
                </div>
                <!-- carousel_wrapper - CLOSE -->
           </div>
            <!-- Tabs content - CLOSE -->


        <!-- Tabs nav - OPEN -->
        <nav class="nav nav-fill nav-pills" id="explore-tabs" role="tablist">
            <a class="nav-item nav-link active" id="movie" data-toggle="pill" href="#movies" role="tab" aria-controls="movies-tab" aria-selected="true">
                <div class="icon-nav">
                    <img src="${pageContext.request.contextPath}/resources/media/icons/cinema.png" width="15" alt="" class="margin-right-sm padding-bottom-sm">
                    영화
                </div>
            </a>
            <a class="nav-item nav-link" id="tvshow" data-toggle="pill" href="#tvshows" role="tab" aria-controls="tvshows-tab" aria-selected="false">
                <div class="icon-nav">
                    <img src="${pageContext.request.contextPath}/resources/media/icons/tv.png" width="15" alt="" class="margin-right-sm padding-bottom-sm">
                    TV프로그램
                </div>
            </a>
            
        </nav>
        <!-- Tabs nav - CLOSE -->

        <!-- Tabs content - OPEN -->
        <div class="tab-content" id="exploreContent">

            <!-- Movies tab - OPEN -->
            <div class="margin-top-under-sm tab-pane fade show active" role="tabpanel" aria-labelledby="movies-tab">
                <!-- Genre Filters - OPEN -->
                <div class="carousel contentsForType" id="typeForGenre" data-flickity='{ "groupCells": true, "cellAlign": "left", "pageDots": false, "wrapAround": false, "draggable": false, "contain": true }' id="genreFilters">
               <c:forEach items="${requestScope.movieGenreList}" var="genreVO">
                  <!-- Genre Action - OPEN -->
                       <div class="carousel-filter-cell text-center">
                           <button class="btn btn-outline-primary btn-md margin-top-under-sm genreBtn" data-filter="${genreVO.genreCode}" value="${genreVO.genreCode}">
                               ${genreVO.genreName}
                           </button>
                       </div>
                       <!-- Genre Action - CLOSE -->
               </c:forEach>
                </div>
                <!-- Genre Filters - CLOSE -->

                <!-- Rating filter and sorting - OPEN -->
                <div class="margin-top-under-sm">
                    <div class="row">
                        <div class="col-auto no-padding text-right margin-right-md">
                            Filter by Rating
                        </div>
                        <div class="col-4 no-padding text-left">
                            <!-- Rating Filter - OPEN -->
                            <div id="slider"></div>
                            <!-- Rating Filter - CLOSE -->
                        </div>
                        <div class="col-4 no-padding text-right ml-auto">
                            <!-- Sorting - OPEN -->
                            <h5 class="inline"> Sort by </h5>
                            <select id="sorting" class="custom-select my-select inline">
                                <option>정렬기준 </option>
                                <option value="New">최신순</option>
                                <option value="Old">오래된순</option>
                            </select>
                            <!-- Sorting - CLOSE -->
                        </div>
                    </div>
                </div>
                <!-- Rating filter and sorting - CLOSE -->

                <!-- Grid cards films - OPEN -->
                <div id="grid-movies" style="margin-top:50px;">
                     <c:forEach var="index" begin="1" end="${fn:length(requestScope.contentListForType)/5+1}">
                       <div class="card-deck">
                          <!-- 컨텐츠 리스트 행 Layout - OPEN -->
                          <c:forEach items="${requestScope.contentListForType}" var="contentsVO" begin="${(index-1)*5}" end="${index*5-1}">
                                 <div class="card carousel-cell">
                                     <img class="card-img-top" src="${pageContext.request.contextPath}/${contentsVO.contentsSmallThumbnail}" />
                                     <h5 class="card-title text-center"> ${contentsVO.contentsTitle}</h5>
                                     <div class="row">
                                         <div class="col-3 text-left no-padding">
                                              ${contentsVO.contentsDate}
                                         </div>
                                         <div class="col-6 text-center no-padding">
                                             <!-- 좋아요 영역 시작 -->
                                            <!--로그인 전 컨텐츠 리스트 출력 For문 START  -->
                                         <sec:authorize access="!isAuthenticated()">
                                                <a href="${pageContext.request.contextPath}/loginForm.do">
                                                   <img id="NeedLogin" class="NeedLogin" src="/watflix/resources/media/icons/HeartLine.png" width=25px height=25px>
                                                </a>
                                                   <span id="ContentsLikeCount">${contentsVO.contentsLikes}</span>
                                                   <input type="hidden" value="${contentsVO.contentsNo}">
                                         </sec:authorize>
                                          <!--로그인 전 컨텐츠 리스트 출력 For문 END  -->
                                          <!--로그인후 컨텐츠 리스트 출력 For문 START  -->
                                           <sec:authorize access="isAuthenticated()">
                                                <c:choose>
                                                   <c:when test="${contentsVO.contentsLikeStatus == 1}">
                                                     <img id="ContentsLike" class="ContentsLike" src="/watflix/resources/media/icons/RedHeart.png" width=25px height=25px>
                                                   </c:when>
                                                   <c:otherwise>
                                                      <img id="ContentsLike" class="ContentsLike" src="/watflix/resources/media/icons/HeartLine.png" width=25px height=25px>
                                                   </c:otherwise>
                                                </c:choose>
                                                <span id="ContentsLikeCount">${contentsVO.contentsLikes}</span>
                                                <input type="hidden" value="${contentsVO.contentsNo}">
                                              </sec:authorize>

                                          <!--로그인 후 컨텐츠 리스트 출력 For문 END  -->
                                     <!-- 좋아요 영역 끝 -->
                                         </div>
                                         <div class="col-3 text-right no-padding rating">
                                             <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
                                             ${contentsVO.contentsAvgStars}
                                         </div>
                                     </div>
                                     <div class="overlay">
                                         <div class="text">
                                             <a href="${pageContext.request.contextPath}/contentsDetail.do?contentsNo=${contentsVO.contentsNo}" class="btn btn-primary btn-sm margin-top-under-sm" role="button" aria-pressed="true">
                                                 <img src="${pageContext.request.contextPath}/resources/media/icons/play.png" width="10" alt="">
                                                 상세보기
                                             </a>
                                         </div>
                                     </div>
                                 </div>
                  </c:forEach>
                    <!-- 컨텐츠 리스트 행 CLOSE -->
                    </div>
                    </c:forEach>
                </div>
                <!-- Grid cards films - CLOSE -->

                <!-- Load more button - OPEN -->
                <div class="margin-top-under-sm text-center" id="moreDiv" >
                    <a href="#" class="btn btn-outline-secondary btn-lg margin-top-under-sm" role="button" id="loadMore" style="margin-top: 0px;">
                        <img src="${pageContext.request.contextPath}/resources/media/icons/plus.png" width="15" alt="" class="margin-right-sm padding-bottom-sm">
                        Load More
                    </a>
                </div>
                <!-- Load more button - CLOSE -->
            </div>
            <!-- Movies tab - CLOSE -->
        </div>
        <!-- Tabs content - CLOSE -->

    </div>
    <!-- Content - CLOSE -->