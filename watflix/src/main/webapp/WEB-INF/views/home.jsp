<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript">
	$(document).ready(function(){
		//tvshow 탭클릭시 tvshow 장르 가져옴
		$("#tvshow").click(function(){
			contentsType="TV";
			$("#typeForGenre").children().children().html("");
			//TV쇼에 대한 장르가져오기
			$.ajax({
				type: "get",
				url:"${pageContext.request.contextPath}/getGenreSelectForType.do",
				data: {
					"contentsType":contentsType
				},
				dataType: "json",
				success:function(result){ // result변수로 응답정보가 전달된다.
					genreDenote(result);
				}			
			})
			$("#grid-movies").html("");
			for(var i=0;i<2;i++){
				$.ajax({
					type:"get",
					url:"${pageContext.request.contextPath}/getContentsAllForType.do",
					data:{
						"contentsType":contentsType,
						"pageNo": i+1
					},
					dataType: "json",
					success:function(result){
						denote(result);
					}
				})//ajax
			}
		})
		//movie 탭클릭시 movie 장르 가져옴
		$("#movie").click(function(){
			contentsType="영화";
			$("#typeForGenre").children().children().html("");
			//TV쇼에 대한 장르가져오기
			$.ajax({
				type: "get",
				url:"${pageContext.request.contextPath}/getGenreSelectForType.do",
				data: {
					"contentsType":contentsType
				},
				dataType: "json",
				success:function(result){ // result변수로 응답정보가 전달된다.
					genreDenote(result);
				}			
			})
			$("#grid-movies").html("");
			for(var i=0;i<2;i++){
				$.ajax({
					type:"get",
					url:"${pageContext.request.contextPath}/getContentsAllForType.do",
					data:{
						"contentsType":contentsType,
						"pageNo": i+1
					},
					dataType: "json",
					success:function(result){
						denote(result);
					}
				})//ajax
			}//for문 종료
		})//movie 탭클릭시 movie 장르 가져옴 종료
		
		//장르버튼 클릭시 이벤트
		$(document).on('click','.genreBtn',function(){
			$(this).parent().parent().children(".active").children().removeAttr("style");
			$(this).parent().parent().children(".active").removeClass("active");
			$(this).parent().addClass("active");
			
			$(this).attr("style","background-color:red");
			//장르코드
			
			var genreCode= $(this).val();
			//컨텐츠 타입
			if($("#movie").hasClass("active") === true){
				contentsType = "영화";
			}
			else{
				contentsType ="TV";
			}
			$("#grid-movies").html("");
			for(var i=0;i<2;i++){
				$.ajax({
					type:"get",
					url:"${pageContext.request.contextPath}/getContentsAllForTypeAndGenre.do",
					data:{
						"contentsType":contentsType,
						"pageNo":i+1,
						"genreCode":genreCode
					},
					dataType: "json",
					success:function(result){
						denote(result);
					}
				})//비동기
			}//for문
		})//장르버튼 클릭이벤트 종료
		
		
		//홈화면에서 more버튼을 클릭시에 자료를 더 가져오는 비동기 함수
		var pageNo = 3;
		var contentsType;
		$("#loadMore").click(function(){
			if($("#movie").hasClass("active") === true){
				contentsType = "영화";
			}
			else{
				contentsType ="TV";
			}
			var genreBtn = $("div.contentsForType").children(".flickity-viewport").children(".flickity-slider").children(".active").children();
			//전체리스트 출력(장르를 선택하지 않은 상황,타입만으로 출력함)
			if(genreBtn.html()==null){
				$.ajax({
					type: "get",
					url:"${pageContext.request.contextPath}/getContentsAllForType.do",
					data: {
						"contentsType":contentsType,
						"pageNo":pageNo
					},
					dataType: "json",
					success:function(result){ // result변수로 응답정보가 전달된다.
						pageNo++;
						denote(result)
					}			
				})
			}
			//전체리스트 출력(장르와 타입으로 loadMore)
			else{
				var genreCode = genreBtn.val();
				$.ajax({
					type: "get",
					url:"${pageContext.request.contextPath}/getContentsAllForTypeAndGenre.do",
					data: {
						"contentsType":contentsType,
						"pageNo":pageNo,
						"genreCode":genreCode
					},
					dataType: "json",
					success:function(result){ // result변수로 응답정보가 전달된다.
						pageNo++;
						denote(result)
					}			
				})
			}
			
		})//click	
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
	            		me.parent().children("#ContentsLike").attr("src","/watflix/resources/media/icons/RedHeart.png");
						me.parent().children("#ContentsLikeCount").text(num+1);
					}else{
						me.parent().children("#ContentsLike").attr("src","/watflix/resources/media/icons/HeartLine.png");
						me.parent().children("#ContentsLikeCount").text(num-1);
	            	}
	            }
			});//ajax
		});//click func for 컨텐츠 좋아요 
	})//ready
	
	//컨텐츠 출력
	function denote(contentsList){
		  if(contentsList.length==0){
			  $("#loadMore").attr('style',"margin-top: 0px;display:none;");
		  }
		  else{
			  $newTbody = $("<div class='card-deck'>")
			  $("#grid-movies").append($newTbody)
			  
			  for(let contents of contentsList){
			    let $cellsOfRow = 
			    	$("<div class='card carousel-cell' style='display:block'>"+
	                 	"<img class='card-img-top' src='${pageContext.request.contextPath}/"+contents.contentsSmallThumbnail+"'/>" +
	                       "<h5 class='card-title text-center' style='font-size:13px;'>"+contents.contentsTitle+"</h5>"+
	                        "<div class='row'>"+
	                        "<div class='col-3 text-left no-padding'>"+contents.contentsDate+"</div>"+
	                   		"<div class='col-3 text-center no-padding'>"+
	                       	"<a href=''>"+"<img src='${pageContext.request.contextPath}/resources/media/icons/eye.png' width='10' alt='상세보기'></a>"+"</div>"+
	                        "<div class='col-3 text-left no-padding'>"+
	                        "<a href=''>"+"<img src='${pageContext.request.contextPath}/resources/media/icons/heart.png' width='10' alt='좋아요'></a>"+"</div>"+
	            			"<div class='col-3 text-right no-padding rating'>"+"<img src='${pageContext.request.contextPath}/resources/media/icons/star.png' width='10' alt='' class='padding-bottom-sm'>"+contents.contentsAvgStars+"</div>"+
					        "</div>"+
					        "<div class='overlay'>"+"<div class='text'>"+
		                    "<a href='${pageContext.request.contextPath}/contentsDetail.do?contentsNo="+contents.contentsNo+"' class='btn btn-primary btn-sm margin-top-under-sm' role='button' aria-pressed='true'>"+
		                        "<img src='${pageContext.request.contextPath}/resources/media/icons/play.png' width='10' alt=''>상세보기"+"</a>"+
			                "</div>"+
		            	"</div>"+
		            	"</div>"+
		            "</div>");
			    $newTbody.append($cellsOfRow);
			  }
			  $("#loadMore").attr('style',"margin-top: 0px;");
		  }
	}
	//장르 출력
	function genreDenote(genreList){
	var percent = 0;
	  for(let genre of genreList){
		  let $cellsOfRow =$("<div class='carousel-filter-cell text-center' style='position: absolute; left: "+percent+"%;'><button class='btn btn-outline-primary btn-md margin-top-under-sm genreBtn'"+ 
				  "data-filter='"+genre.genreCode+"' value='"+genre.genreCode+"'>"+genre.genreName+"</button></div>"
    	);
	    $("#typeForGenre>.flickity-viewport>.flickity-slider").append($cellsOfRow);
	    percent+=20;
	  }
	}
</script>

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
            <a class="nav-item nav-link active" id="trend-tab" data-toggle="pill" href="#trend" role="tab" aria-controls="trend-tab" aria-selected="true">
                <div class="icon-nav">
                    <img src="${pageContext.request.contextPath}/resources/media/icons/trend.png" width="20" alt="" class="margin-right-sm">
                    인기컨텐츠
                </div>
            </a>
            <a class="nav-item nav-link" id="popular-tab" data-toggle="pill" href="#popular" role="tab" aria-controls="popular-tab" aria-selected="false">
                <div class="icon-nav">
                    <img src="${pageContext.request.contextPath}/resources/media/icons/fire.png" width="15" alt="" class="margin-right-sm">
                   	평점높은 컨텐츠
                </div>
            </a>
            <a class="nav-item nav-link" id="new-tab" data-toggle="pill" href="#new" role="tab" aria-controls="new-tab" aria-selected="false">
                <div class="icon-nav">
                    <img src="${pageContext.request.contextPath}/resources/media/icons/clock.png" width="15" alt="" class="margin-right-sm">
                    최다등록평점
                </div>
            </a>
           
        </nav>
        <!-- Tabs nav - CLOSE -->

        <!-- Tabs content - OPEN -->
        <div class="tab-content" id="myTabContent">
            <!-- 인기 컨텐츠 tab - OPEN -->
            <div class="margin-top-under-sm tab-pane fade show active" id="trend" role="tabpanel" aria-labelledby="trend-tab">
                <!-- Carousel - OPEN -->
                <div class="carousel" data-flickity='{ "groupCells": true, "cellAlign": "center", "pageDots": false, "wrapAround": true, "draggable": false }' style="height: 280px; padding-top: 15px;">
					<!--컨텐츠 리스트 출력 For문 START  -->
                  	<c:forEach items="${requestScope.contentsHighHits}" var="contentsVO">
                  	<div class="carousel-cell">
                  			<!-- 컨텐츠 작은 썸네일 -->
                        	<img class="carousel-cell-image" src="${pageContext.request.contextPath}/${contentsVO.contentsSmallThumbnail}" />
                        	<!-- 컨텐츠 제목 -->
                        	<h5 class="text-center" style="font-size:13px;">${contentsVO.contentsTitle}</h5>
                        	
                        	<div class="row">
                            <div class="col-4 text-left no-padding">
                                ${contentsVO.contentsDate}
                            </div>
                            <div class="col-4 text-center no-padding">
                               <!-- 좋아요 영역 시작 -->
                                <span>
									<img src="/watflix/resources/media/icons/HeartLine.png" width=30px height=30px>
									<c:choose>
										<c:when test="${contentsVO.contentsLikeStatus == 1}">
											<img id="ContentsLike" class="ContentsLike" src="/watflix/resources/media/icons/RedHeart.png" width=30px height=30px>
										</c:when>
										<c:otherwise>
											<img id="ContentsLike" class="ContentsLike" src="/watflix/resources/media/icons/HeartLine.png" width=30px height=30px>
										</c:otherwise>
									</c:choose>
									Likes <span id="ContentsLikeCount">${contentsVO.contentsLikes}</span>
										<input type="hidden" value="${contentsVO.contentsNo}">
								</span>
								 <!-- 좋아요 영역 끝 -->
                            </div>
                            <div class="col-4 text-right no-padding rating">
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
                    </div>
                  	</c:forEach>
					<!--컨텐츠 리스트 출력 For문 END  -->
                </div>
                <!-- Carousel - CLOSE -->
            </div>
            <!-- Trend tab - CLOSE -->

            <!-- 평점 높은 순 tab - OPEN -->
            <div class="margin-top-under-sm tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">
                 <!-- Carousel - OPEN -->
                <div class="carousel" data-flickity='{ "groupCells": true, "cellAlign": "center", "pageDots": false, "wrapAround": true, "draggable": false }' style="height: 280px;padding-top: 15px;">
					<!--컨텐츠 리스트 출력 For문 START  -->
                  	<c:forEach items="${requestScope.contentsHighAvgStars}" var="contentsVO">
                  	<div class="carousel-cell">
                  			<!-- 컨텐츠 작은 썸네일 -->
                        	<img class="carousel-cell-image" src="${pageContext.request.contextPath}/${contentsVO.contentsSmallThumbnail}" />
                        	<!-- 컨텐츠 제목 -->
                        	<h5 class="text-center">${contentsVO.contentsTitle}</h5>
                        	
                        	<div class="row">
                            <div class="col-3 text-left no-padding">
                                ${contentsVO.contentsDate}
                            </div>
                            <div class="col-3 text-center no-padding">
                                <a href="">
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/eye.png" width="10" alt="">
                                </a>
                            </div>
                            <div class="col-3 text-left no-padding">
                                <a href="">
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/heart.png" width="10" alt="">
                                </a>
                            </div>
                            <div class="col-3 text-right no-padding rating">
                                <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" style="padding-bottom: 3px">
                                ${contentsVO.contentsAvgStars}
                            </div>
                        </div>
                        <div class="overlay">
                            <div class="text">
                                <a href="#" class="btn btn-primary btn-sm margin-top-under-sm" role="button" aria-pressed="true">
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/play.png" width="10" alt="">
                                    상세보기
                                </a>
                            </div>
                        </div>
                    </div>
                  	</c:forEach>
					<!--컨텐츠 리스트 출력 For문 END  -->
                    
                </div>
                <!-- Carousel - CLOSE -->
            </div>
            <!-- 평점 높은 순 tab - CLOSE -->

            <!-- New tab - OPEN -->
            <div class="margin-top-under-sm tab-pane fade" id="new" role="tabpanel" aria-labelledby="new-tab">
                최다등록평점
            </div>
            <!-- New tab - CLOSE -->

        </div>
        <!-- Tabs content - OPEN -->

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
                                <option value="popular"> Popular </option>
                                <option value="year_recent"> Year newest </option>
                                <option value="year_oldest"> Year oldest </option>
                                <option value="rating_best"> Rating best </option>
                                <option value="rating_worst"> Rating worst</option>
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
			                            <h5 class="card-title text-center" style="font-size:13px;"> ${contentsVO.contentsTitle}</h5>
			                            <div class="row">
			                                <div class="col-3 text-left no-padding">
			                                     ${contentsVO.contentsDate}
			                                </div>
			                                <div class="col-3 text-center no-padding">
			                                    <a href="">
			                                        <img src="${pageContext.request.contextPath}/resources/media/icons/eye.png" width="10" alt="상세보기">
			                                    </a>
			                                </div>
			                                <div class="col-3 text-left no-padding">
			                                    <a href="">
			                                        <img src="${pageContext.request.contextPath}/resources/media/icons/heart.png" width="10" alt="좋아요">
			                                    </a>
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