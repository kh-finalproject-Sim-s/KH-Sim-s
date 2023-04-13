<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/biz/main.css"/>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

 	<!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/myinfo.css"/>
    
    
   <script type="text/javascript" 
    src="https://www.gstatic.com/charts/loader.js"></script>


    <script type="text/javascript">
      //google에서 기본 차트 관련된 package(모듈)명
      //chart 종류에 따라서 google 개발 문서 참조 필수
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  
    	  $.ajax({
  	        url: "${pageContext.request.contextPath}/biz/test",
  	        type: "post",
  	        dataType:"json",
  	        success: function(json) {
  	            // JSON 데이터를 받아 처리
  	            //var data = JSON.parse(json); //dataType:"json"라고 명시하면 이렇게 안써도 됨. 
  	            console.log(json);
  	          	var chartData = [['요금제명', '가입수']];
	  	        for (var i = 0; i < json.length; i++) {
	                chartData.push([json[i].planName, json[i].planApplyCnt]);
	            }  
	            console.log("차트 데이타 : "+chartData);
				
	            var options = {
		                title: '데이터 그래프',
		                width: 600,
		                height: 400,              
		                legend: { position: 'none' }
		            };
		
		            var chart = new google.visualization.ColumnChart(document.getElementById('chart_div2')); // Column Chart를 생성합니다.
		            chart.draw(google.visualization.arrayToDataTable(chartData), options); // 차트를 그립니다.
		        },
		        error : function(request,status,error) {
		        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+
		        	error);
  	        }     
  	    });
  	}

      
    </script>
<!--     
    <script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
		
    	
 		
 		  var data = google.visualization.arrayToDataTable([
 		        ["Element", "Density" ],
 		        ["Copper", 8.94],
 		        ["Silver", 10.49],
 		        ["Gold", 19.30],
 		        ["Platinum", 21.45]
 		      ]);
 		
 		
      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1]);

      var options = {
        title: "Density of Precious Metals, in g/cm^3",
        width: 600,
        height: 400,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
      chart.draw(view, options);
  }
  </script>
 -->

<!-- 최근 일주일간 해당 통신사 요금제 가입자 열 그래프 -->
<script type="text/javascript">
	  google.charts.load('current', {packages: ['corechart']}); // 로드할 패키지를 선택합니다.
	  google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
	    $.ajax({
	        url: "${pageContext.request.contextPath}/biz/main",
	        type: "post",
	        dataType:"json",
	        success: function(json) {
	            // JSON 데이터를 받아 처리
	            //var data = JSON.parse(json); //dataType:"json"라고 명시하면 이렇게 안써도 됨. 
	            console.log(json);
	            var chartData = [['일자', '가입수']];
	            for (var i = 0; i < json.length; i++) {
	                chartData.push([json[i].date, json[i].orderCnt]);
	            }  
	            console.log("차트 데이타 : "+chartData);
	
	            var options = {
	                title: '데이터 그래프',
	                width: 600,
	                height: 400,              
	                legend: { position: 'none' }
	            };
	
	            var chart = new google.visualization.ColumnChart(document.getElementById('chart_div')); // Column Chart를 생성합니다.
	            chart.draw(google.visualization.arrayToDataTable(chartData), options); // 차트를 그립니다.
	        },
	        error : function(request,status,error) {
	        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+
	        	error);
	        }     
	    });
	}

  </script>

<!-- 원형차트 -->
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

    	  $.ajax({
    		   url : "${pageContext.request.contextPath}/biz/piechart" //경로 항상 유의
    		  ,type : "post"
    		  ,dataType : "json" //아 date 오타...아오
    		  ,success : function(json){
    			  console.log(json);
    			  console.log("data : "+data);
    			  
    			  //원형차트는 Array 대신 DataTable 또는 DataView와 함께 호출하라고 에러
    			  //json 데이터를 DataTable 객체로 변환한 다음, 이를 draw() 메소드의 인자로 전달
    			  var data = new google.visualization.DataTable();
    	            data.addColumn('string', '연령대');
    	            data.addColumn('number', '가입수');
    	            for (var i = 0; i < json.length; i++) {
    	                data.addRow([json[i].ageGroup, json[i].ageCnt]);
    	            }
    			  console.log("data : "+data)
    			  
		          var options = {
		               title: 'My Daily Activities'
		               };
		
		          var chart = new google.visualization.PieChart(document.getElementById('piechart'));
		
		          chart.draw(data, options);
    		  }
    		  ,error : function(request,status,error) {
  	        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+
  	  	        	error);
  	  	        }     
    	  });
      }
    </script>





</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>
	

	<div id="chart_div2" style="width: 900px; height: 500px; padding-left: 500px"></div> pieChart가 적용되는 위치
	   
	
	<div id="chart_div" style="width: 900px; height: 300px;  padding-left: 500px;"></div>
	  
	<!-- 원형차트 -->
    <div id="piechart" style="width: 900px; height: 500px;"></div>
	  
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	<!-- Scripts -->
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/user/myinfo.js"></script>
	  
	  

</body>
</html>