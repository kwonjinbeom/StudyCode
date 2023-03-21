<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<link rel="stylesheet" type="text/css" href="/resources/include/css/chungnam.css"/>
	<link rel="stylesheet" type="text/css" href="/resources/include/css/lightbox.css" /> 
	<script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/cookie.js"></script>
	<style type="text/css">
		.media img{width:140px; height:140px;}
		#media-template{display:none;}
	</style>
	<script type="text/javascript">

		function template(id,sido_name,sigungu_name,remarks,shel_nm,address,lon,lat,shel_av,lenth,shel_div_type,seismic,height){
			let $table=$("<table></table>");

			let header=$("<tr>");
			header.append("<td>일련번호</td>")
			.append("<td>시도명</td>")
			.append("<td>시군구명</td>")
			.append("<td>대피지구명</td>")
			.append("<td>대피장소명</td>")
			.append("<td>주소</td>")
			.append("<td>경도</td>")
			.append("<td>위도</td>")
			.append("<td>수용가능인원(명)</td>")
			.append("<td>해변으로부터거리</td>")
			.append("<td>대피소분류명</td>")
			.append("<td>내진적용여부</td>")
			.append("<td>해발높이</td>")
			.append("</tr>");
			
		    $element.find('.id').html(id);
		    $element.find('.sido_name').html(sido_name);
		    $element.find('.sigungu_name').html(sigungu_name); 
		    $element.find('.remarks').html(remarks); 
		    $element.find('.shel_nm').html(shel_nm); 
		    $element.find('.address').html(address); 
		    $element.find('.lon').html(lon); 
		    $element.find('.lat').html(lat); 
		    $element.find('.shel_av').html(shel_av); 
		    $element.find('.lenth').html(lenth); 
		    $element.find('.shel_div_type').html(shel_div_type); 
		    $element.find('.seismic').html(seismic); 
		    $element.find('.height').html(height); 
		    
		    $table.append($element); 
		}
	
		$(function(){
			$(".contentLayout .page-header h1").html("대전 유기동물 공고");
			
			$.ajax({ 
				url: "/data/animalDaejeonList",  
				type: "get",
				dataType: "xml",
				success: data => {
					$(data).find('row').each(function(){
						let id = $(this).find("id").text();
						let sido_name = $(this).find("sido_name").text();
						let sigungu_name = $(this).find("sigungu_name").text();
						let remarks = $(this).find("remarks").text();
						let shel_nm = $(this).find("shel_nm").text();
						let address = $(this).find("address").text();
						let lon = $(this).find("lon").text();
						let lat = $(this).find("lat").text();
						let shel_av = $(this).find("shel_av").text();
						let lenth = $(this).find("lenth").text();
						let shel_div_type = $(this).find("shel_div_type").text();
						let seismic = $(this).find("seismic").text();
						let height = $(this).find("height").text();
						
						template(id,sido_name,sigungu_name,remarks,shel_nm,address,lon,lat,shel_av,lenth,shel_div_type,seismic,height);

				},
				error: (xhr, textStatus, errorThrown) => {
					alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
				}
			});
		});
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<script type="text/javascript">

		function template(animalSeq, age, filePath, species, hairColor, memo, foundPlace){
			let $div = $('#list');
			 
			let $element = $('#media-template').clone().removeAttr('id');
			
		    $element.find('.media-heading').html(species + " - "+ age);
		    $element.find('.item-place').html(foundPlace);
		    $element.find('.item-color').html(hairColor); 
		    $element.find('.item-memo').html(memo); 
		    
		    $div.append($element); 
		}
	
		$(function(){
			$(".contentLayout .page-header h1").html("대전 유기동물 공고");
			
			$.ajax({ 
				url: "/data/animalDaejeonList",  
				type: "get",
				dataType: "xml",
				success: data => {
					template(animalSeq, age, filePath, species, hairColor, memo, foundPlace);
					
				},
				error: (xhr, textStatus, errorThrown) => {
					alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
				}
			});
		});
		
		function setTable(){
			$("#container").html("");
				let $table=$("<table></table>");
				
				let header=$("<tr>");
				header.append("<td>일련번호</td>")
				.append("<td>시도명</td>")
				.append("<td>시군구명</td>")
				.append("<td>대피지구명</td>")
				.append("<td>대피장소명</td>")
				.append("<td>주소</td>")
				.append("<td>경도</td>")
				.append("<td>위도</td>")
				.append("<td>수용가능인원(명)</td>")
				.append("<td>해변으로부터거리</td>")
				.append("<td>대피소분류명</td>")
				.append("<td>내진적용여부</td>")
				.append("<td>해발높이</td>")
				.append("</tr>");
				
			}
			$("#container").html(table);
			}
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
</head>
<body>
	<div class="contentContainer container">
		<div id="list">
			<div class="media" id="media-template">
				<div class="media-left">
					<a href="#" data-lightbox="roadtrip">
						<img class="media-object img-rounded" />
					</a>
				</div>
				<div class="media-body">
					<h4 class="media-heading"></h4>
					<table class="table table-hover">
						<tbody class="media-content">
							<tr class="item">
								<td class="item-title">발견된 장소</td>
								<td class="item-place"></td>
							</tr>
							<tr class="item">
								<td class="item-title">색상</td>
								<td class="item-color"></td>
							</tr>
							<tr class="item">
								<td class="item-title">메모</td>
								<td class="item-memo"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>