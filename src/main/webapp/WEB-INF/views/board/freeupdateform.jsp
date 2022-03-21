<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: white;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #66bb6a;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
} /* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em; /* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

/* imaged preview */
.filebox .upload-display { /* 이미지가 표시될 지역 */
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */
	display: inline-block;
	width: 54px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img { /* 추가될 이미지 */
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}
</style>
<body>
	<section class="contact-page wf100 p80">
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="contact-form mb60">
						<h3>글쓰기</h3>
						<form action="freeUpdate.do" method="post" enctype="multipart/form-data">
							<ul class="cform">
							
								<li class="full">
									<input type="hidden" name="free_no" value="${freeVO.free_no}">
									<input type="text" id="free_title"
									name="free_title" class="form-control" placeholder="제목"
									oninvalid="toastr.error('제목을 입력해주세요')" value="${freeVO.free_title}">
								</li>
								
								<div class="filebox preview-image" style="float: right; margin-bottom: 30px;">
									<div class="upload-display">
										<div class="upload-thumb-wrap">
											<img src="${freeVO.free_phy_rou }" class="upload-thumb">
										</div>
									</div>
									<input class="upload-name" value="파일선택" disabled="disabled">
									<label for="file">업로드</label>
									<input class="upload-hidden" type="file" id="file" name="file">
								</div>

								<li class="full"><textarea class="textarea-control"
										id="free_con" name="free_con" placeholder="내용"
										oninvalid="toastr.error('내용을 입력해주세요')">${freeVO.free_con}</textarea>
								</li>

								<li class="full">
									<input type="submit" value="수정" class="fsubmit">
								</li>

							</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
	
	$(document).ready(function(){
		var fileTarget = $('.filebox .upload-hidden');

		fileTarget.on('change', function(){
			if(window.FileReader){
			// 파일명 추출
				var filename = $(this)[0].files[0].name;
			} 
	
			else {
			// Old IE 파일명 추출
				var filename = $(this).val().split('/').pop().split('\\').pop();
			};
	
			$(this).siblings('.upload-name').val(filename);
		});

		//preview image 
		var imgTarget = $('.preview-image .upload-hidden');

		imgTarget.on('change', function(){
			var parent = $(this).parent();
			parent.children('.upload-display').remove();

			if(window.FileReader){
		//image 파일만
				if (!$(this)[0].files[0].type.match(/image\//)) return;
		            
				var reader = new FileReader();
				reader.onload = function(e){
					var src = e.target.result;
					parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
				}
				reader.readAsDataURL($(this)[0].files[0]);
			}

			else {
				$(this)[0].select();
				$(this)[0].blur();
				var imgSrc = document.selection.createRange().text;
				parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

				var img = $(this).siblings('.upload-display').find('img');
				img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
			}
		});
	});
	</script>
</body>
</html>