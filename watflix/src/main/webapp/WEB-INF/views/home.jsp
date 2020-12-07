<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
		                        <a href="#" class="btn btn-secondary btn-lg margin-right" role="button" aria-pressed="true">
		                            <img src="${pageContext.request.contextPath}/resources/media/icons/plus.png" width="15" alt="">
		                           찜하기
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
		                        <a href="#" class="btn btn-secondary btn-lg margin-right" role="button" aria-pressed="true">
		                            <img src="${pageContext.request.contextPath}/resources/media/icons/plus.png" width="15" alt="">
		                            찜하기
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
                        	<h5 class="text-center">${contentsVO.contentsTitle}</h5>
                        	
                        	<div class="row">
                            <div class="col-4 text-left no-padding">
                                ${contentsVO.contentsDate}
                            </div>
                            <div class="col-4 text-center no-padding">
                                <a href="">
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/heart.png" width="10" alt="">
                                </a>
                            </div>
                            <div class="col-4 text-right no-padding rating">
                                <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" style="padding-bottom: 3px">
                                ${contentsVO.contentsAvgStars}
                            </div>
                        </div>
                        <div class="overlay">
                            <div class="text">
                                <a href="#" class="btn btn-secondary btn-sm margin-top-under-sm" role="button" aria-pressed="true">
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/info.png" width="10" alt="">
                                    Info
                                </a>
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
                                년도
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
                                8.0
                            </div>
                        </div>
                        <div class="overlay">
                            <div class="text">
                                <a href="#" class="btn btn-secondary btn-sm margin-top-under-sm" role="button" aria-pressed="true">
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/info.png" width="10" alt="">
                                    Info
                                </a>
                                <a href="#" class="btn btn-primary btn-sm margin-top-under-sm" role="button" aria-pressed="true">
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/play.png" width="10" alt="">
                                    Watch
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
            <a class="nav-item nav-link active" id="movies-tab" data-toggle="pill" href="#movies" role="tab" aria-controls="movies-tab" aria-selected="true">
                <div class="icon-nav">
                    <img src="${pageContext.request.contextPath}/resources/media/icons/cinema.png" width="15" alt="" class="margin-right-sm padding-bottom-sm">
                    영화
                </div>
            </a>
            <a class="nav-item nav-link" id="tvshows-tab" data-toggle="pill" href="#tvshows" role="tab" aria-controls="tvshows-tab" aria-selected="false">
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
            <div class="margin-top-under-sm tab-pane fade show active" id="movies" role="tabpanel" aria-labelledby="movies-tab">

                <!-- Genre Filters - OPEN -->
                <div class="carousel" data-flickity='{ "groupCells": true, "cellAlign": "left", "pageDots": false, "wrapAround": false, "draggable": false, "contain": true }' id="genreFilters">
					<c:forEach items="${requestScope.GetAllGenreList}" var="genreVO">
						<!-- Genre Action - OPEN -->
	                    <div class="carousel-filter-cell text-center">
	                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter="${genreVO.genreCode}">
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
                                <option value="rating_worst"> Rating worst </option>
                            </select>
                            <!-- Sorting - CLOSE -->
                        </div>
                    </div>
                </div>
                <!-- Rating filter and sorting - CLOSE -->

                <!-- Grid cards films - OPEN -->
                <div id="grid-movies" style="margin-top:50px;">
                    <!-- 컨텐츠 리스트 행 Layout - OPEN -->
                    <c:forEach var="index" begin="1" end="${fn:length(requestScope.contentsList)/5}">
       				 	<div class="card-deck">
							<c:forEach items="${requestScope.contentsList}" var="contentsVO"  begin="${(index-1)*5}" end="${index*5-1}">
							  <!-- 컨텐츠 리스트 열 Layout - OPEN -->
		                        <div class="card carousel-cell">
		                            <img class="card-img-top" src="${pageContext.request.contextPath}/${contentsVO.contentsSmallThumbnail}" />
		                            <h5 class="card-title text-center" style="font-size:13px;"> ${contentsVO.contentsTitle}</h5>
		                            <div class="row">
		                                <div class="col-3 text-left no-padding">
		                                    년도
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
		                                    <a href="#" class="btn btn-secondary btn-sm margin-top-under-sm" role="button" aria-pressed="true">
		                                        <img src="${pageContext.request.contextPath}/resources/media/icons/info.png" width="10" alt="">
		                                        Info
		                                    </a>
		                                    <a href="#" class="btn btn-primary btn-sm margin-top-under-sm" role="button" aria-pressed="true">
		                                        <img src="${pageContext.request.contextPath}/resources/media/icons/play.png" width="10" alt="">
		                                        Watch
		                                    </a>
		                                </div>
		                            </div>
		                        </div>
                     				 <!-- 컨텐츠 리스트 열 Layout  - Close -->
							</c:forEach>
						</div>
                    </c:forEach>
                    <!-- 컨텐츠 리스트 행 CLOSE -->
                </div>
                <!-- Grid cards films - CLOSE -->

                <!-- Load more button - OPEN -->
                <div class="margin-top-under-sm text-center">
                    <a href="#" class="btn btn-outline-secondary btn-lg margin-top-under-sm" role="button" id="loadMore">
                        <img src="${pageContext.request.contextPath}/resources/media/icons/plus.png" width="15" alt="" class="margin-right-sm padding-bottom-sm">
                        Load More
                    </a>
                </div>
                <!-- Load more button - CLOSE -->
            </div>
            <!-- Movies tab - CLOSE -->

            <!-- TV Shows tab - OPEN -->
            <div class="margin-bottom tab-pane fade show" id="tvshows" role="tabpanel" aria-labelledby="tvshows-tab">
                TV Shows
            </div>
            <!-- TV Shows tab - CLOSE -->

        </div>
        <!-- Tabs content - CLOSE -->

    </div>
    <!-- Content - CLOSE -->