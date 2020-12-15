<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="container-lg margin-top margin-bottom">
	<div class="tab-content" id="myTabContent" style="margin-top: 130px;">
		<!-- 검색된 내용이 없는 경우 안내문, 검색 키워드가 두글자 이하인 경우 경고문 -->
		<c:choose>
			<c:when test="${!empty requestScope.titleLength}">
				<h2 style="text-align: center;color: red;">두 글자 이상부터 검색 가능</h2>
			</c:when>
			<c:otherwise>
				<!-- Carousel - OPEN -->
				<!-- 장르 오픈 -->
				<c:forEach items="${requestScope.genreList}" var="genreVO">
					<h3>${genreVO.genreName}</h3>
					<div class="margin-top-under-sm tab-pane fade show active" id="trend"
						role="tabpanel" aria-labelledby="trend-tab">
						<!-- 컨텐츠 출력 -->
						<div class="carousel"
							data-flickity='{ "groupCells": true, "cellAlign": "center", "pageDots": false, "wrapAround": true, "draggable": false }'
							style="height: 280px; padding-top: 15px; margin-top: 15px;">
							<c:forEach items="${requestScope.contentsList}" var="contentsVO">
								<c:if test="${contentsVO.genreVO.genreCode==genreVO.genreCode}">
									<!--컨텐츠 리스트 출력 For문 START  -->
									<div class="carousel-cell">
										<!-- 컨텐츠 작은 썸네일 -->
										<img class="carousel-cell-image" src="${pageContext.request.contextPath}/${contentsVO.contentsSmallThumbnail}" />
										<!-- 컨텐츠 제목 -->
										<h5 class="text-center">${contentsVO.contentsTitle}</h5>
										<div class="row">
											<div class="col-4 text-left no-padding">
												${contentsVO.contentsDate}</div>
											<div class="col-4 text-center no-padding">
												<a href="">
													<img src="${pageContext.request.contextPath}/resources/media/icons/heart.png" width="10" alt="">
												</a>
											</div>
											<div class="col-4 text-right no-padding rating">
												<img src="${pageContext.request.contextPath}/resources/media/icons/star.png"	width="10" alt="" style="padding-bottom: 3px">
												${contentsVO.contentsAvgStars}
											</div>
										</div>
										<div class="overlay">
											<div class="text">
												<a href="#"	class="btn btn-secondary btn-sm margin-top-under-sm" role="button" aria-pressed="true">
													<img src="${pageContext.request.contextPath}/resources/media/icons/info.png" width="10" alt=""> Info
												</a>
												<a href="${pageContext.request.contextPath}/contentsDetail.do?contentsNo=${contentsVO.contentsNo}" class="btn btn-primary btn-sm margin-top-under-sm" role="button" aria-pressed="true">
													<img src="${pageContext.request.contextPath}/resources/media/icons/play.png" width="10" alt="">
													상세보기
												</a>
											</div>
										</div>
									</div>
									<!--컨텐츠 리스트 출력 For문 END  -->
								</c:if>
							</c:forEach>
						</div>
						<!-- 장르 끝 -->
						<!-- Carousel - CLOSE -->
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<c:if test="${empty requestScope.genreList}">
			<h2 style="text-align: center;">검색된 컨텐츠가 없습니다.</h2>
		</c:if>
	</div>

</div>