<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!-- Slider - OPEN -->
    <div id="mainCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#mainCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#mainCarousel" data-slide-to="1"></li>
            <li data-target="#mainCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
        <!-- FOR문 Start : 메인 상단에 랜덤으로 컨텐츠를 슬라이드 형식으로 보여주기 -->
        <c:forEach items="${requestScope.contentsListVO.contentsList}" var="contentsVO" varStatus="th">
        <!-- IF문 Start : 첫번째 게시물의 div class에 active를 주기 위함  -->
        	<c:choose>
        		<c:when test="${th.count==1}">
        			<!-- Stranger Things - OPEN -->
		            <div class="carousel-item active">
		                <img class="d-block w-100" src="${pageContext.request.contextPath}/${contentsVO.contentsBigThumbnail}" alt="Second slide">
		                <div class="carousel-caption d-none d-md-block container-lg align-middle">
		                   	<!-- 제목 -->
		                    <h1>${contentsVO.contentsTitle}</h1>
		                    <p> <a href="#">2016</a> | +16 | <a href="#">${contentsVO.contentsType}</a> | <a href="#">${contentsVO.genreVO.genreName}</a> </p>
		                    <!-- 줄거리 -->
		                    <p class="margin-top-under-sm">
		                        ${contentsVO.contentsSummary}
		                    </p>
		                    <div class="margin-top-under-sm">
		                        <a href="#" class="btn btn-primary btn-lg margin-right" role="button" aria-pressed="true">
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
		                    <p> <a href="#">2016</a> | +16 | <a href="#">${contentsVO.contentsType}</a> | <a href="#">${contentsVO.genreVO.genreName}</a> </p>
		                    <!-- 줄거리 -->
		                    <p class="margin-top-under-sm">
		                        ${contentsVO.contentsSummary}
		                    </p>
		                    <div class="margin-top-under-sm">
		                        <a href="#" class="btn btn-primary btn-lg margin-right" role="button" aria-pressed="true">
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
                <div class="carousel" data-flickity='{ "groupCells": true, "cellAlign": "center", "pageDots": false, "wrapAround": true, "draggable": false }' style="height: 280px;padding-top: 15px;">
					<!--컨텐츠 리스트 출력 For문 START  -->
                  	<c:forEach items="${requestScope.contentsHighHits}" var="contentsVO">
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
            <!-- Trend tab - CLOSE -->

            <!-- Popular tab - OPEN -->
            <div class="margin-top-under-sm tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">
                 <!-- Carousel - OPEN -->
                <div class="carousel" data-flickity='{ "groupCells": true, "cellAlign": "center", "pageDots": false, "wrapAround": true, "draggable": false }' style="height: 400px">

                    <!-- The Irishman - OPEN -->
                    <div class="carousel-cell">
                        <img class="carousel-cell-image" src="${pageContext.request.contextPath}/resources/media/images/posters/the_irishman.jpg" />
                        <h5 class="text-center"> The Irishman </h5>
                        <div class="row">
                            <div class="col-3 text-left no-padding">
                                2019
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
                    <!-- The Irishman - CLOSE -->
                </div>
                <!-- Carousel - CLOSE -->
            </div>
            <!-- Popular tab - CLOSE -->

            <!-- New tab - OPEN -->
            <div class="margin-top-under-sm tab-pane fade" id="new" role="tabpanel" aria-labelledby="new-tab">
                New
            </div>
            <!-- New tab - CLOSE -->

            <!-- Oscars tab - OPEN -->
            <div class="margin-top-under-sm tab-pane fade" id="oscars" role="tabpanel" aria-labelledby="oscars-tab">
                Oscars 2020
            </div>
            <!-- Oscars tab - CLOSE -->

        </div>
        <!-- Tabs content - OPEN -->

        <!-- Tabs nav - OPEN -->
        <nav class="nav nav-fill nav-pills" id="explore-tabs" role="tablist">
            <a class="nav-item nav-link active" id="movies-tab" data-toggle="pill" href="#movies" role="tab" aria-controls="movies-tab" aria-selected="true">
                <div class="icon-nav">
                    <img src="${pageContext.request.contextPath}/resources/media/icons/cinema.png" width="15" alt="" class="margin-right-sm padding-bottom-sm">
                    Movies
                </div>
            </a>
            <a class="nav-item nav-link" id="tvshows-tab" data-toggle="pill" href="#tvshows" role="tab" aria-controls="tvshows-tab" aria-selected="false">
                <div class="icon-nav">
                    <img src="${pageContext.request.contextPath}/resources/media/icons/tv.png" width="15" alt="" class="margin-right-sm padding-bottom-sm">
                    TV Shows
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

                    <!-- Genre Action - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Action">
                            Action
                        </button>
                    </div>
                    <!-- Genre Action - CLOSE -->

                    <!-- Genre Adventure - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Adventure">
                            Adventure
                        </button>
                    </div>
                    <!-- Genre Adventure - CLOSE -->

                    <!-- Genre Animation - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Animation">
                            Animation
                        </button>
                    </div>
                    <!-- Genre Animation - CLOSE -->

                    <!-- Genre Comedy - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Comedy">
                            Comedy
                        </button>
                    </div>
                    <!-- Genre Comedy - CLOSE -->

                    <!-- Genre Crime - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Crime">
                            Crime
                        </button>
                    </div>
                    <!-- Genre Crime - CLOSE -->

                    <!-- Genre Drama - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Drama">
                            Drama
                        </button>
                    </div>
                    <!-- Genre Drama - CLOSE -->

                    <!-- Genre Fantasy - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Fantasy">
                            Fantasy
                        </button>
                    </div>
                    <!-- Genre Fantasy - CLOSE -->

                    <!-- Genre Historical - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Historical">
                            Historical
                        </button>
                    </div>
                    <!-- Genre Historical - CLOSE -->

                    <!-- Genre Historical Fiction - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Historical-Fiction">
                            Historical Fiction
                        </button>
                    </div>
                    <!-- Genre Historical Fiction - CLOSE -->

                    <!-- Genre Horror - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Horror">
                            Horror
                        </button>
                    </div>
                    <!-- Genre Horror - CLOSE -->

                    <!-- Genre Magical Realism - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Magical_Realism">
                            Magical Realism
                        </button>
                    </div>
                    <!-- Genre Magical Realism - CLOSE -->

                    <!-- Genre Mystery - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Mystery">
                            Mystery
                        </button>
                    </div>
                    <!-- Genre Mystery - CLOSE -->

                    <!-- Genre Paranoid Fiction - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Paranoid_Fiction">
                            Paranoid Fiction
                        </button>
                    </div>
                    <!-- Genre Paranoid Fiction - CLOSE -->

                    <!-- Genre Philosophical - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Philosophical">
                            Philosophical
                        </button>
                    </div>
                    <!-- Genre Philosophical - CLOSE -->

                    <!-- Genre Political - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Political">
                            Political
                        </button>
                    </div>
                    <!-- Genre Political - CLOSE -->

                    <!-- Genre Romance - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Romance">
                            Romance
                        </button>
                    </div>
                    <!-- Genre Romance - CLOSE -->

                    <!-- Genre Saga - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Saga">
                            Saga
                        </button>
                    </div>
                    <!-- Genre Saga - CLOSE -->

                    <!-- Genre Satire - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Satire">
                            Satire
                        </button>
                    </div>
                    <!-- Genre Satire - CLOSE -->

                    <!-- Genre Science Fiction - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Science_Fiction">
                            Science Fiction
                        </button>
                    </div>
                    <!-- Genre Science Fiction - CLOSE -->

                    <!-- Genre Social - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Social">
                            Social
                        </button>
                    </div>
                    <!-- Genre Social - CLOSE -->

                    <!-- Genre Speculative - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Speculative">
                            Speculative
                        </button>
                    </div>
                    <!-- Genre Speculative - CLOSE -->

                    <!-- Genre Surrealism - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Surrealism">
                            Surrealism
                        </button>
                    </div>
                    <!-- Genre Surrealism - CLOSE -->

                    <!-- Genre Thriller - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Thriller">
                            Thriller
                        </button>
                    </div>
                    <!-- Genre Thriller - CLOSE -->

                    <!-- Genre Urban - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Urban">
                            Urban
                        </button>
                    </div>
                    <!-- Genre Urban - CLOSE -->

                    <!-- Genre Western - OPEN -->
                    <div class="carousel-filter-cell text-center">
                        <button class="btn btn-outline-primary btn-md margin-top-under-sm" data-filter=".Western">
                            Western
                        </button>
                    </div>
                    <!-- Genre Western - CLOSE -->

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
                <div id="grid-movies">

                    <!-- First row of Card Deck Layout - OPEN -->
                    <div class="card-deck margin-top">

                        <!-- Beasts of No Nation - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/beasts_of_no_nation.jpg" />
                            <h5 class="card-title text-center"> Beasts of No Nation </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    2015
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
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
                                    7.7
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
                        <!-- Beasts of No Nation - OPEN -->

                        <!-- El Camino - OPEN -->
                        <div class="card carousel-cell Action">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/el_camino.jpg" />
                            <h5 class="card-title text-center"> El Camino </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    2019
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
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
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
                        <!-- El Camino - OPEN -->

                        <!-- The Dark Knight - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/dark_knight.jpg" />
                            <h5 class="card-title text-center"> The Dark Knight </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    2008
                                </div>
                                <div class="col-3 text-center no-padding selected">
                                    <a href="">
                                        <img src="${pageContext.request.contextPath}/resources/media/icons/eye-selected.png" width="10" alt="">
                                    </a>
                                </div>
                                <div class="col-3 text-left no-padding selected">
                                    <a href="">
                                        <img src="${pageContext.request.contextPath}/resources/media/icons/heart-selected.png" width="10" alt="">
                                    </a>
                                </div>
                                <div class="col-3 text-right no-padding rating">
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
                                    9.0
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
                        <!-- The Dark Knight - OPEN -->

                        <!-- Inception - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/inception.png" />
                            <h5 class="card-title text-center"> Inception </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    2010
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
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
                                    8.8
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
                        <!-- Inception - OPEN -->

                        <!-- Okja - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/okja.jpg" />
                            <h5 class="card-title text-center"> Okja </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    2017
                                </div>
                                <div class="col-3 text-center no-padding selected">
                                    <a href="">
                                        <img src="${pageContext.request.contextPath}/resources/media/icons/eye-selected.png" width="10" alt="">
                                    </a>
                                </div>
                                <div class="col-3 text-left no-padding">
                                    <a href="">
                                        <img src="${pageContext.request.contextPath}/resources/media/icons/heart.png" width="10" alt="">
                                    </a>
                                </div>
                                <div class="col-3 text-right no-padding rating">
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
                                    7.3
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
                        <!-- Okja - OPEN -->

                    </div>
                    <!-- First row of Card Deck Layout - OPEN -->

                    <!-- Second row of Card Deck Layout -->
                    <div class="card-deck">

                        <!-- Birdman - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/birdman.jpg" />
                            <h5 class="card-title text-center"> Birdman </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    2014
                                </div>
                                <div class="col-3 text-center no-padding selected">
                                    <a href="">
                                        <img src="${pageContext.request.contextPath}/resources/media/icons/eye-selected.png" width="10" alt="">
                                    </a>
                                </div>
                                <div class="col-3 text-left no-padding">
                                    <a href="">
                                        <img src="${pageContext.request.contextPath}/resources/media/icons/heart.png" width="10" alt="">
                                    </a>
                                </div>
                                <div class="col-3 text-right no-padding rating">
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
                                    7.7
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
                        <!-- Birdman - OPEN -->

                        <!-- Jaws - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/jaws.jpeg" />
                            <h5 class="card-title text-center"> Jaws </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    1975
                                </div>
                                <div class="col-3 text-center no-padding selected">
                                    <a href="">
                                        <img src="${pageContext.request.contextPath}/resources/media/icons/eye-selected.png" width="10" alt="">
                                    </a>
                                </div>
                                <div class="col-3 text-left no-padding">
                                    <a href="">
                                        <img src="${pageContext.request.contextPath}/resources/media/icons/heart.png" width="10" alt="">
                                    </a>
                                </div>
                                <div class="col-3 text-right no-padding rating">
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
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
                        <!-- Jaws - OPEN -->

                        <!-- Blade Runner - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/blade_runner.jpg" />
                            <h5 class="card-title text-center"> Blade Runner </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    1982
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
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
                                    8.1
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
                        <!-- Blade Runner - OPEN -->

                        <!-- Blade Runner 2049 - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/blade_runner_2049.jpg" />
                            <h5 class="card-title text-center"> Blade Runner 2049 </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    2017
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
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
                                    7.0
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
                        <!-- Blade Runner 2049 - OPEN -->

                        <!-- Call Me by Your Name - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/call_me_by_your_name.jpg" />
                            <h5 class="card-title text-center"> Call Me by Your Name </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    2017
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
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
                                    7.9
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
                        <!-- Call Me by Your Name - OPEN -->

                    </div>
                    <!-- Second row of Card Deck Layout - OPEN -->

                    <!-- Third row of Card Deck Layout - OPEN -->
                    <div class="card-deck">

                        <!-- Wonder Woman - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/wonder_woman.jpg" />
                            <h5 class="card-title text-center"> Wonder Woman </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    2017
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
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
                                    7.4
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
                        <!-- Wonder Woman - OPEN -->

                        <!-- Dallas Buyers Club - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/dallas_buyers_club.jpg" />
                            <h5 class="card-title text-center"> Dallas Buyers Club </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    2013
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
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
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
                        <!-- Dallas Buyers Club - OPEN -->

                        <!-- The Revenant - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/the_revenant.jpg" />
                            <h5 class="card-title text-center"> The Revenant </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    2015
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
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
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
                        <!-- The Revenant - OPEN -->

                        <!-- The Terminator - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/the_terminator.jpg" />
                            <h5 class="card-title text-center"> The Terminator </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    1984
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
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
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
                        <!-- The Terminator - OPEN -->

                        <!-- Ex Machina - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/ex_machina.jpg" />
                            <h5 class="card-title text-center"> Ex Machina </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    2014
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
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
                                    7.7
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
                        <!-- Ex Machina - OPEN -->

                    </div>
                    <!-- Third row of Card Deck Layout - OPEN -->

                    <!-- Fourth row of Card Deck Layout -->
                    <div class="card-deck">

                        <!-- Spotlight- OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/spotlight.jpg" />
                            <h5 class="card-title text-center"> Spotlight </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    2015
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
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
                                    8.1
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
                        <!-- Spotlight - OPEN -->

                        <!--Reservoir Dogs - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/reservoir_dogs.jpg" />
                            <h5 class="card-title text-center"> Reservoir Dogs </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    1992
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
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
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
                        <!-- Reservoir Dogs - OPEN -->

                        <!-- Annihilation - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/annihilation.jpg" />
                            <h5 class="card-title text-center"> Annihilation </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    2018
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
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
                                    6.9
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
                        <!-- Annihilation - OPEN -->

                        <!-- Prisoners - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/prisoners.jpg" />
                            <h5 class="card-title text-center"> Prisoners </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    2013
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
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
                                    8.1
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
                        <!-- Prisoners - OPEN -->

                        <!-- Fargo - OPEN -->
                        <div class="card carousel-cell">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/media/images/posters/fargo.jpg" />
                            <h5 class="card-title text-center"> Fargo </h5>
                            <div class="row">
                                <div class="col-3 text-left no-padding">
                                    1996
                                </div>
                                <div class="col-3 text-center no-padding selected">
                                    <a href="">
                                        <img src="${pageContext.request.contextPath}/resources/media/icons/eye-selected.png" width="10" alt="">
                                    </a>
                                </div>
                                <div class="col-3 text-left no-padding">
                                    <a href="">
                                        <img src="${pageContext.request.contextPath}/resources/media/icons/heart.png" width="10" alt="">
                                    </a>
                                </div>
                                <div class="col-3 text-right no-padding rating">
                                    <img src="${pageContext.request.contextPath}/resources/media/icons/star.png" width="10" alt="" class="padding-bottom-sm">
                                    8.1
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
                        <!-- Fargo - OPEN -->

                    </div>
                    <!-- Fourth row of Card Deck Layout - OPEN -->

                </div>
                <!-- Grid cards films - OPEN -->

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