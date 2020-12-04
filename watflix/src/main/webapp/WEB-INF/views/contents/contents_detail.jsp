<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- Slider - OPEN -->
    <div id="mainCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
           <!-- Stranger Things - OPEN -->
            <div class="carousel-item active">
                <img class="d-block w-100" src="${pageContext.request.contextPath}/${contentsVO.contentsBigThumbnail}" alt="Second slide">
                <div class="carousel-caption d-none d-md-block container-lg align-middle">
                      <!-- 제목 -->
                    <h1>${contentsVO.contentsTitle}</h1>
                    <p> <a href="#">2016</a> | +16 | <a href="#">${contentsVO.contentsType}</a> | <a href="#">${contentsVO.genreVO.genreName}</a></p>
                    <!-- 줄거리 -->
                    <p class="margin-top-under-sm">
                        ${contentsVO.contentsSummary}
                    </p>
                    <div class="margin-top-under-sm">
                        <a href="#"  role="button" aria-pressed="true">
                            왓플평점 ${contentsVO.contentsAvgStars}
                        </a>
                    </div>
                     <div class="margin-top-under-sm">
                        <a href="#"  role="button" aria-pressed="true">
                            왓플리뷰 수 <font color="red">${contentsVO.contentsReviewCount} </font>개
                        </a>
                    </div>
                     <div class="margin-top-under-sm">
                        <a href="#"  role="button" aria-pressed="true">
                            예고편 감상하기
                        </a>
                    </div>
                </div>
            </div>
            <!-- Stranger Things - CLOSE -->
        </div>
    </div>
<!-- Slider - CLOSE -->
  