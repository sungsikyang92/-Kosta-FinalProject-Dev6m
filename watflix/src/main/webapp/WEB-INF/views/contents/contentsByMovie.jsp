<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
                <!-- Carousel - OPEN -->
		<div class="carousel" data-flickity='{ "groupCells": true, "cellAlign": "center", "pageDots": false, "wrapAround": true, "draggable": false }' style="height: 280px; padding-top: 15px;">
					<!--컨텐츠 리스트 출력 For문 START  -->
                  	<c:forEach items="${requestScope.contentsList}" var="contentsVO">
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
