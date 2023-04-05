<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.e2.board.model.vo.Board"%>
<%
	Board b = (Board)session.getAttribute("b");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
   	
    <link rel="stylesheet" href="/ePower2/resources/css/bcss.css">
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
        nav{
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
		.container_size{
			margin-top : -200px;
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
			
			<!-- 메인부분-->
		<article id="mainContent" class="container_size">
    <div class="board_wrap">
        <div class="board_title">
            <strong>공지사항</strong>
            <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
        </div>
        
        <form action="<%=request.getContextPath()%>/InquiryUpdate.bd" method="post">
        <input type="hidden" name="bno" value="<%=b.getBoardNo()%>">
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력" name="title" value="<%=b.getBoardTitle() %>"></dd>
                    </dl>
                </div>

                <div class="cont">
                    <textarea placeholder="내용 입력" name="content"><%=b.getBoardContent() %></textarea>
                </div>
            </div>
            
            <div class="bt_wrap">
                <button id="btn_submit" class="btn btn-primary py-3 px-5" type="submit">수정</button>
                <a href="<%=request.getContextPath()%>/InquiryGet.bd?currentPage=1" class="btn btn-primary py-3 px-5" id="btn_cancel" >취소</a>
            </div>
            
            
        </div>
	</form>
    </div>
    		</article>
		</div>
	<!-- 풋터 include -->
	<footer id="pageFooter">
		<%@ include file="/view/common/footer.jsp" %>
	</footer>
	
</body>
</html>