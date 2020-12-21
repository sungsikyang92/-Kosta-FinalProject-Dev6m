$(document).ready(function() {

	//이미지 슬라이드를 위한 코드
  	var slides = document.querySelector('.slides'),
    slide = document.querySelectorAll('.slides>li'),
    currentIdx=0,
    slideCount=slide.length,
    //슬라이드 한개당 넢이
    slideWidth=198,
    slideMargin=30,
    prevBtn = document.querySelector('.prev'),
    nextBtn = document.querySelector('.next');

	slides.style.width=(slideWidth+slideMargin)*slideCount-slideMargin+'px';
	function moveSlide(num){
	    slides.style.left = -num*228+'px';
	    currentIdx=num;
	  }
	  nextBtn.addEventListener('click',function(){
	    if(currentIdx<slideCount-5){
	      moveSlide(currentIdx+1);
	    }
	    else{
	      moveSlide(0)
	    }
	
	  })

  prevBtn.addEventListener('click',function(){
    if(currentIdx>0){
      moveSlide(currentIdx-1);
    }
    else{
      moveSlide(slideCount-5)
    }
  })
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
}//장르출력 종료

//sorting 변수값
   var sortType="";
   //More버튼클릭시 페이징을 주기위한 변수
   var pageNo = 3;
   var contentsType;
   //tvshow 탭클릭시 tvshow 장르 가져옴
   $("#tvshow").click(function(){
      //정렬기준 초기화
      $("#sorting option:eq(0)").prop("selected", true);
      sortType="null";
      contentsType="TV";
      $("#typeForGenre").children().children().html("");
      //TV쇼에 대한 장르가져오기
      $.ajax({
         type: "get",
         url:"getGenreSelectForType.do",
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
            url:"sortingContents.do",
            data:{
               "contentsType":contentsType,
               "pageNo": i+1,
               "sortType":sortType
            },
            dataType: "json",
            success:function(result){
               denote(result);
            }
         })//ajax
      }
      pageNo = 3;
   })
   //movie 탭클릭시 movie 장르 가져옴
   $("#movie").click(function(){
      //정렬기준 초기화
      $("#sorting option:eq(0)").prop("selected", true);
      sortType="null";
      contentsType="영화";
      $("#typeForGenre").children().children().html("");
      //movie에 대한 장르가져오기
      $.ajax({
         type: "get",
         url:"getGenreSelectForType.do",
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
            url:"sortingContents.do",
            data:{
               "contentsType":contentsType,
               "pageNo": i+1,
               "sortType":sortType
            },
            dataType: "json",
            success:function(result){
               denote(result);
            }
         })//ajax
      }//for문 종료
      pageNo = 3;
   })//movie 탭클릭시 movie 장르 가져옴 종료
   
   //장르버튼 클릭시 이벤트
   $(document).on('click','.genreBtn',function(){
      //정렬기준 초기화
      $("#sorting option:eq(0)").prop("selected", true);
      sortType="null";
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
            url:"getContentsAllForTypeAndGenre.do",
            data:{
               "contentsType":contentsType,
               "pageNo":i+1,
               "genreCode":genreCode,
               "sortType":sortType
            },
            dataType: "json",
            success:function(result){
               denote(result);
            }
         })//비동기
      }//for문
      pageNo = 3;
   })//장르버튼 클릭이벤트 종료
   
   //홈화면에서 more버튼을 클릭시에 자료를 더 가져오는 비동기 함수
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
            url:"sortingContents.do",
            data: {
               "contentsType":contentsType,
               "pageNo":pageNo,
               "sortType":sortType
            },
            dataType: "json",
            success:function(result){ // result변수로 응답정보가 전달된다.
               pageNo++;
               denote(result)
            }         
         })//ajax끝
      }
      //전체리스트 출력(장르와 타입으로 loadMore)
      else{
         var genreCode = genreBtn.val();
         $.ajax({
            type: "get",
            url:"getContentsAllForTypeAndGenre.do",
            data: {
               "contentsType":contentsType,
               "pageNo":pageNo,
               "genreCode":genreCode,
               "sortType":sortType
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
                  me.parent().children("#ContentsLike").attr("src","/resources/media/icons/RedHeart.png");
               me.parent().children("#ContentsLikeCount").text(num+1);
            }else{
               me.parent().children("#ContentsLike").attr("src","/resources/media/icons/HeartLine.png");
               me.parent().children("#ContentsLikeCount").text(num-1);
               }
            }
      });//ajax
   });//click func for 컨텐츠 좋아요
   
   //정렬기준에 따른 액션
   $('#sorting').change(function () {
      sortType=$('#sorting').val();
      if($("#movie").hasClass("active") === true){
         contentsType = "영화";
      }
      else{
         contentsType ="TV";
      }
      //장르코드
      var genreCode = $("div.contentsForType").children(".flickity-viewport").children(".flickity-slider").children(".active").children().val();
      $("#grid-movies").html("");
      //장르를 선택하지 않았으니 전체 컨텐츠에서만 정렬적용
      if(genreCode==null){
         for(var i=0;i<2;i++){
            alert(i)
               $.ajax({
                  type: "get",
                  url:"sortingContents.do",
                  data: {
                     "sortType":sortType,
                     "contentsType":contentsType,
                     "pageNo": i+1
                  },
                  dataType: "json",
                  success:function(result){ // result변수로 응답정보가 전달된다.
                     denote(result);
                  }         
               })
         }
      }//if문 종료
      //특정 장르에서 정렬적용
      else{
         for(var i=0;i<2;i++){
               $.ajax({
                  type: "get",
                  url:"getContentsAllForTypeAndGenre.do",
                  data: {
                     "sortType":sortType,
                     "contentsType":contentsType,
                     "pageNo": i+1,
                     "genreCode":genreCode
                  },
                  dataType: "json",
                  success:function(result){ // result변수로 응답정보가 전달된다.
                     denote(result);
                  }         
               })
         }
      }//else문 종료
   })// sort
   //인기컨텐츠 탭 클릭시
   $("#highHits-tab").click(function(){
	   $.ajax({
           type: "get",
           url:"getContentsHighHitsList.do",
           dataType: "json",
           success:function(result){ // result변수로 응답정보가 전달된다.
        	   tabContents(result);
           }         
        })
   })
   //평점높은 컨텐츠 탭 클릭시
   $("#highAgeStar-tab").click(function(){
	   $.ajax({
           type: "get",
           url:"getContentsHighAvgStarsList.do",
           dataType: "json",
           success:function(result){ // result변수로 응답정보가 전달된다.
        	   tabContents(result);
           }         
        })
   })
   //최다등록평점 컨텐츠 탭 클릭시
   $("#highCommentsCount-tab").click(function(){
	   $.ajax({
           type: "get",
           url:"getContentsHighCommentsCountList.do",
           dataType: "json",
           success:function(result){ // result변수로 응답정보가 전달된다.
        	   tabContents(result);
           }         
        })
   })

  })