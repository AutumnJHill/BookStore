<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="ko">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>공지사항</title>
		<!-- 다른 경로 타고오면 적용이 안돼서 /ePower2를 따로 적어줌 -->
		<link rel="stylesheet" href="/ePower2/resources/css/bcss.css">
		<link rel="stylesheet" href="/ePower2/resources/css/drop.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
		<link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />


		<!-- Google Font -->
		<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
		<!-- Plugin -->
		<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css" />
		
		<Style>
			.container {
				display: grid;
				grid-template-areas:

					"header header header"
					"nav article ads"
					"footer footer footer";

				grid-template-rows: 150px 1fr 150px;
				grid-template-columns: 20% 1fr 15%;

				grid-gap: 10px;

				margin: 0;
			}

			header,
			footer,
			article,
			nav {
				padding: 20px
			}

			#pageHeader {
				grid-area: header;
			}

			#pageFooter {
				grid-area: footer;
			}

			#mainContent {
				grid-area: article;
			}

			#mainNav {
				grid-area: nav;
			}

			#siteAds {
				grid-area: ads;
			}

			.container_size {
				margin-top: -200px;
			}
			#dropzone{
				border: 2px dashed #3498db !important;
				box-sizing: border-box;
				border-radius : 8px;
			}
		</style>


	</head>

	<body>

		<header id="pageHeader">
			<%@ include file="/view/common/header.jsp" %>
		</header>
		
		<div class="container">
		<!-- 사이드바 include -->
		<nav><%@ include file="/view/board/sidebar.jsp" %></nav>
		
			<article id="mainContent" class="container_size">
			<div class="board_wrap">
				<div class="board_title">
					<strong>1:1문의접수</strong>
					<p>문의사항을 빠르고 정확하게 안내해드립니다.</p>
				</div>
				
			<form method="post" class="dropzone" id="fileDropzone" action="<%=request.getContextPath()%>/InquiryInsert.bd" enctype="multipart/form-data"
			style= "border : none !important">
				<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
				
				<div class="board_write_wrap">
					<div class="board_write">
						<div class="title">
							<dl>
								<dt>제목</dt>
								<dd>
									<input type="text" placeholder="제목 입력" id="title" name="title" required>
								</dd>
							</dl>
						</div>
						<div class="cont">
							<textarea placeholder="내용 입력" id="content" name="content" required></textarea>
						</div>
					</div>
				</div>

				<!-- 드롭다운바 넣을꺼라서 깨질꺼라  css 못했습니다 나중에 수정할꼐여;; -->
				<!-- 첨부파일 부분  name잘봐야해요~-->

				<div id="dropzone">
					<div class="dz-message needsclick">
						<img src="http://www.freeiconspng.com/uploads/------------------------------iconpngm--22.png"alt="Camera" />
		           		<span class="note needsclick">(클릭 또는 드래그&드랍으로 업로드할 수 있습니다.)</span>
				    </div>
				</div> 
				
				<div class="bt_wrap">
					<input type="submit" id="btn_submit" class="btn btn-primary py-3 px-5" value="등록">
					<a href="<%=request.getContextPath()%>/InquiryGet.bd?currentPage=1" class="btn btn-primary py-3 px-5">취소</a>
				</div>
				</form>
			</div>
			</article>
		</div>
		
	<!-- 풋터 include -->
	<footer id="pageFooter"><%@ include file="/view/common/footer.jsp" %></footer>
	
	</body>
	<!-- upfile -->
	<script>
	 //fileDropzone dropzone 설정할 태그의 id로 지정
		Dropzone.options.fileDropzone = {
        url: '<%=request.getContextPath()%>/InquiryInsert.bd', //업로드할 url (ex)컨트롤러)
        init: function () {
            /* 최초 dropzone 설정시 init을 통해 호출 */
            var submitButton = document.querySelector("#btn_submit");
            var myDropzone = this; //closure
            submitButton.addEventListener("click", function (e) {
                console.log("업로드"); //tell Dropzone to process all queued files
                e.preventDefault();
                e.stopPropagation();
                myDropzone.processQueue();
                location.href='<%=request.getContextPath()%>/InquiryGet.bd?currentPage=1';
            });
        },
        autoProcessQueue: false, // 자동업로드 여부 (true일 경우, 바로 업로드 되어지며, false일 경우, 서버에는 올라가지 않은 상태임 processQueue() 호출시 올라간다.)
        clickable: true, // 클릭가능여부
        paramName:"upfile", //파라미터로 넘길 변수명 default는 file
        thumbnailHeight: 90, // Upload icon size
        thumbnailWidth: 90, // Upload icon size
        maxFiles: 5, // 업로드 파일수
        maxFilesize: 10, // 최대업로드용량 : 10MB
        parallelUploads: 1, // 동시파일업로드 수(이걸 지정한 수 만큼 여러파일을 한번에 컨트롤러에 넘긴다.)
        addRemoveLinks: true, // 삭제버튼 표시 여부
        dictRemoveFile: '삭제', // 삭제버튼 표시 텍스트
        uploadMultiple: false // 다중업로드 기능
        
    };
    
    
	
  
	</script>
	
</html>