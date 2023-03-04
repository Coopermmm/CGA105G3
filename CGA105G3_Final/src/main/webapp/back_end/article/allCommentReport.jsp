<%@page import="com.commentreport.model.CommentReportVO"%>
<%@page import="com.commentreport.model.CommentReportService"%>
<%@page import="com.comment.model.CommentService"%>
<%@page import="com.articlereport.model.ArticleReportVO"%>
<%@page import="com.articlereport.model.ArticleReportService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--要用for each之程式碼匯入-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%
ArticleReportService articleReportSvc = new ArticleReportService();
List<ArticleReportVO> listArticleReport = articleReportSvc.getAll();
pageContext.setAttribute("listArticleReport", listArticleReport);
CommentReportService commentReportSvc = new CommentReportService();
List<CommentReportVO> listCommentReport = commentReportSvc.getAll();
pageContext.setAttribute("listCommetReport", listCommentReport);
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Time To Travel</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"> -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> -->
<link rel="stylesheet" href="css/back.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/back_article.css" type="text/css">
<link rel="stylesheet" href="css/jquery.datetimepicker.css"
	type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>

<body>

	<div class="container-all">
		<!-- 左邊 -->
		<div class="container-left">
			<!-- 導覽列 -->
			<nav id="sidebar">
				<!-- 展開紐 -->
				<button type="button" id="collapse" class="collapse-btn">
					<i class="bi bi-arrow-left-square"></i>
				</button>

				<!-- list -->
				<ul class="list-unstyled">

					<p>
						<img id=logo src="images/TTT2.png" alt=""> <br>後台管理系統
					</p>
					<hr>

					<li><a href="./back_index.html">首頁 <i
							class="bi bi-house-door"></i></a></li>
					<li><a href="#memlist" data-bs-toggle="collapse" id="dropdown">會員管理
							<i class="bi bi-person"></i>
					</a> <!-- 子list -->
						<ul id="memlist" class="collapse list-unstyled">
							<li><a href="./back_member.html">會員帳號管理</a></li>

						</ul></li>
					<li><a href="#emplist" data-bs-toggle="collapse">員工管理 <i
							class="bi bi-people"></i></a>
						<ul id="emplist" class="collapse list-unstyled">
							<li><a href="./back_emp_1.html">員工資料管理</a></li>
							<li><a href="./back_emp_2.html">員工權限管理</a></li>
						</ul></li>
					<li><a href="#syslist" data-bs-toggle="collapse">平台管理 <i
							class="bi bi-window-fullscreen"></i></a>
						<ul id="syslist" class="collapse list-unstyled">
							<li><a href="./back_news.html">最新消息管理</a></li>
							<li><a class=active2 href="./back_article.html">文章檢舉管理</a></li>
							<li><a href="./back_firm.html">廠商審核管理</a></li>
							<li><a href="./back_message.html">即時客服管理</a></li>
							<li><a href="./back_QA.html">常見問題管理</a></li>
						</ul></li>
					<li><a href="#hotellist" data-bs-toggle="collapse">住宿管理 <i
							class="bi bi-house-heart"></i></a>
						<ul id="hotellist" class="collapse list-unstyled">
							<li><a href="./back_hotel_1.html">房型管理</a></li>
							<li><a href="./back_hotel_2.html">房型訂單管理</a></li>
							<li><a href="./back_hotel_3.html">房型促銷管理</a></li>
						</ul></li>
					<li><a href="#tklist" data-bs-toggle="collapse">票券管理 <i
							class="bi bi-ticket-perforated"></i></a>
						<ul id="tklist" class="collapse list-unstyled">
							<li><a href="./back_tk_1.html">票券管理</a></li>
							<li><a href="./back_tk_2.html">票券訂單管理</a></li>
							<li><a href="./back_tk_3.html">票券優惠管理</a></li>
						</ul></li>
					<li><a href="#ltrlist" data-bs-toggle="collapse">行程管理 <i
							class="bi bi-pin-map"></i></a>
						<ul id="ltrlist" class="collapse list-unstyled">
							<li><a href="./back_itr_1.html">行程種類管理</a></li>
							<li><a href="./back_itr_2.html">行程管理</a></li>
							<li><a href="./back_itr_3.html">行程訂單管理</a></li>
						</ul></li>
				</ul>


			</nav>



		</div>
		<!-- 右邊 -->
		<div class="container-right">
			<!-- 右上 -->
			<div class="header">
				<div class="col-md-12">
					<div class="float-right">
						<span>平台部門管理 卡卡西 (員工編號:06)</span> <a href="#" id="logout">登出<i
							class="bi bi-box-arrow-right"></i></a>

					</div>

				</div>
			</div>
			<!-- 右下 -->
			<section id="first">
				<div class="container right-down">
					<!-- 段1 -->
					<div class="row">
						<div class="col-md-12 h1">
							<h1>文章檢舉管理</h1>
						</div>

					</div>
					<!-- =======================以下區塊可自訂======================= -->
					<!-- 分頁標籤，可以新增分頁，若不要分頁可以整塊刪掉 -->
					<div class="nav nav-tabs">
						<!-- 分頁1 -->
						<button class="nav-link" data-bs-toggle="tab"
							data-bs-target="#tab-1" aria-selected="false">文章檢舉列表</button>
						<!-- 分頁2 -->
						<button class="nav-link" data-bs-toggle="tab"
							data-bs-target="#tab-2" aria-selected="false">文章檢舉處理</button>
						<!-- 分頁3 -->
						<button class="nav-link active" data-bs-toggle="tab"
							data-bs-target="#tab-3" aria-selected="true">留言檢舉列表</button>
						<!-- 分頁4 -->
						<button class="nav-link" data-bs-toggle="tab"
							data-bs-target="#tab-4" aria-selected="false">留言檢舉處理</button>

					</div>
					<!--  分頁內容，若不要分頁可以整塊刪掉 -->
					<div class="tab-content">
						<!-- 分頁1 內容 -->
						<div class="tab-pane" id="tab-1">

							<div class=>
								<table table border=1 rules="rows" class="table ">
									<thead>
										<tr>
											<th>文章檢舉編號</th>
											<th>文章編號</th>
											<th>檢舉會員編號</th>
											<th>文章檢舉事由</th>
											<th>文章檢舉時間</th>
											<th>文章處理註記</th>
											<th>文章處理狀態</th>
											<th>文章處理時間</th>
											<th>員工編號</th>
											<th>文章處理</th>

										</tr>
									</thead>
									<tbody>
										<c:forEach var="articleReportVO" items="${listArticleReport}">
											<tr>
												<td>${articleReportVO.article_report_id}</td>
												<td>${articleReportVO.article_id}</td>
												<td>${articleReportVO.member_id}</td>
												<td><c:choose>
														<c:when test="${articleReportVO.article_report_reason==0}">
												惡意洗版、重複張貼
												</c:when>
														<c:when test="${articleReportVO.article_report_reason==1}">
													包含未成年、裸露、色情內容
												</c:when>
														<c:when test="${articleReportVO.article_report_reason==2}">
													仇恨言論
												</c:when>
														<c:when test="${articleReportVO.article_report_reason==3}">
													廣告商業宣傳
												</c:when>
														<c:when test="${articleReportVO.article_report_reason==4}">
													其他
												</c:when>
													</c:choose></td>
												<td>${articleReportVO.article_report_time}</td>
												<td>${articleReportVO.article_reportprocess_content}</td>
												<td><c:choose>
														<c:when test="${articleReportVO.article_reportprocess_state==0}">
												         尚未處理
												</c:when>
														<c:when test="${articleReportVO.article_reportprocess_state==1}">
													   屏蔽文章內容
												</c:when>
														<c:when test="${articleReportVO.article_reportprocess_state==2}">
													  不屏蔽文章內容
												</c:when>
												</c:choose></td>
												<td><fmt:formatDate value="${articleReportVO.article_reportprocess_time}" pattern="yyyy-MM-dd"/></td>
												<td>${articleReportVO.emp_id}</td>
												<td>
													<form method="post" action="articleReport.do">
														<input type="hidden" name="action" value="articleDealPage">
														<input type="hidden" name="article_report_id" value="${articleReportVO.article_report_id}">
														<button type="submit" class="btn btn-primary rArticle-btn">
															處理</button>
													</form>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 分頁2 內容 -->
						<div class="tab-pane" id="tab-2">

							<form method="post" action="articleReport.do">
								<input type="hidden" name="action" value="articleDeal">
								<div class="row">
									<div class="col-md-12">
										<span>•文章檢舉編號:</span>${articleReportVO.article_report_id}<span></span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•文章編號:</span><span>${articleReportVO.article_id}</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•檢舉會員編號:</span><span>${articleReportVO.member_id}</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•文章連結:</span><span><a class="arArticle" href="#"
											target="_blank">檢舉出處連結</a></span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•文章檢舉事由:</span>
										<span>
										<c:choose>
														<c:when test="${articleReportVO.article_report_reason==0}">
												惡意洗版、重複張貼
												</c:when>
														<c:when test="${articleReportVO.article_report_reason==1}">
													包含未成年、裸露、色情內容
												</c:when>
														<c:when test="${articleReportVO.article_report_reason==2}">
													仇恨言論
												</c:when>
														<c:when test="${articleReportVO.article_report_reason==3}">
													廣告商業宣傳
												</c:when>
														<c:when test="${articleReportVO.article_report_reason==4}">
													其他
												</c:when>
													</c:choose>
										</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•文章檢舉時間:</span><span>${articleReportVO.article_report_time}</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•文章檢舉處理狀態:</span><span>
																<c:choose>
														<c:when test="${articleReportVO.article_reportprocess_state==0}">
												         尚未處理
												</c:when>
														<c:when test="${articleReportVO.article_reportprocess_state==1}">
													   屏蔽文章內容
												</c:when>
														<c:when test="${articleReportVO.article_reportprocess_state==2}">
													  不屏蔽文章內容
												</c:when>
												</c:choose>
										</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•文章檢舉處理:</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<select class="deal" name="article_reportprocess_state">
											<option value="-1" disabled selected>--請選擇--</option>
											<option value="1">屏蔽文章內容</option>
											<option value="2">不屏蔽文章內容</option>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•文章檢舉註記:</span>

									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<textarea class="rArticle-text" rows="2" name="article_reportprocess_content"> ${articleReportVO.article_reportprocess_content} </textarea>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•文章檢舉處理時間:</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<input class="dealDate" type="text"  name="article_reportprocess_time">
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<input type="hidden" name="article_id" value="${articleReportVO.article_id}">
										<input type="hidden" name="emp_id" value="1">
										<button type="submit" class="btn btn-primary rArticle-btn">
											送出處理</button>
									</div>
								</div>
							</form>
						</div>
						<!-- 分頁3 內容 -->
						<div class="tab-pane show active" id="tab-3">
							<div class=>
								<table table border=1 rules="rows" class="table">
									<thead>
										<tr>
											<th>留言檢舉編號</th>
											<th>文章編號</th>
											<th>留言編號</th>
											<th>留言內容</th>
											<th>檢舉會員編號</th>
											<th>留言檢舉事由</th>
											<th>留言檢舉時間</th>
											<th>留言處理註記</th>
											<th>留言處理狀態</th>
											<th>留言處理時間</th>
											<th>員工編號</th>
											<th>留言處理</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="commentReportVO" items="${listCommetReport}">
											<tr>
											<th>${commentReportVO.comment_report_id}</th>
											<th>${commentReportVO.commentVO.article_id}</th>
											<th>${commentReportVO.comment_id}</th>
											<th>${commentReportVO.commentVO.comment_content}</th>
											<th>${commentReportVO.member_id}</th>
												<td><c:choose>
														<c:when test="${commentReportVO.comment_report_reason==0}">
												惡意洗版、重複張貼
												</c:when>
														<c:when test="${commentReportVO.comment_report_reason==1}">
													包含未成年、裸露、色情內容
												</c:when>
														<c:when test="${commentReportVO.comment_report_reason==2}">
													仇恨言論
												</c:when>
														<c:when test="${commentReportVO.comment_report_reason==3}">
													廣告商業宣傳
												</c:when>
														<c:when test="${commentReportVO.comment_report_reason==4}">
													其他
												</c:when>
													</c:choose></td>
											<th>${commentReportVO.comment_report_time}</th>
											<th>${commentReportVO.comment_reportprocess_content}</th>
											<td>
												<c:choose>
														<c:when test="${commentReportVO.comment_reportprocess_state==0}">
												         尚未處理
												</c:when>
														<c:when test="${commentReportVO.comment_reportprocess_state==1}">
													   屏蔽留言內容
												</c:when>
														<c:when test="${commentReportVO.comment_reportprocess_state==2}">
													  不屏蔽留言內容
												</c:when>
												</c:choose>
												</td>
											<th><fmt:formatDate value="${commentReportVO.comment_reportprocess_time}" pattern="yyyy-MM-dd"/></th>
											<th>${commentReportVO.emp_id}</th>
												<td>
													<form method="post" action="commentReport.do">
														<input type="hidden" name="action" value="commentDealPage">
														<input type="hidden" name="comment_report_id" value="${commentReportVO.comment_report_id}">
														<button type="submit" class="btn btn-primary rComment-btn">
															處理</button>
													</form>
												</td>
											</tr>
											</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 分頁4 內容  -->
						<div class="tab-pane" id="tab-4">
							<form method="post" action="commentReport.do">
								<input type="hidden" name="action" value="commentDeal">
								<div class="row">
									<div class="col-md-12">
										<span>•留言檢舉編號:</span><span>${commentReportVO.comment_report_id}</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•文章編號:</span><span>${commentReportVO.commentVO.article_id}</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•留言編號:</span><span>${commentReportVO.comment_id}</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•留言內容:</span><span>${commentReportVO.commentVO.comment_content}</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•檢舉會員編號:</span><span>${commentReportVO.member_id}</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•文章連結:</span><span><a class="arArticle" href="#"
											target="_blank">檢舉出處連結</a></span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•留言檢舉事由:</span><span><c:choose>
														<c:when test="${commentReportVO.comment_report_reason==0}">
												惡意洗版、重複張貼
												</c:when>
														<c:when test="${commentReportVO.comment_report_reason==1}">
													包含未成年、裸露、色情內容
												</c:when>
														<c:when test="${commentReportVO.comment_report_reason==2}">
													仇恨言論
												</c:when>
														<c:when test="${commentReportVO.comment_report_reason==3}">
													廣告商業宣傳
												</c:when>
														<c:when test="${commentReportVO.comment_report_reason==4}">
													其他
												</c:when>
													</c:choose></span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•留言檢舉時間:</span><span>${commentReportVO.comment_report_time}</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•留言檢舉處理狀態:</span><span><c:choose>
														<c:when test="${commentReportVO.comment_reportprocess_state==0}">
												         尚未處理
												</c:when>
														<c:when test="${commentReportVO.comment_reportprocess_state==1}">
													   屏蔽文章內容
												</c:when>
														<c:when test="${commentReportVO.comment_reportprocess_state==2}">
													  不屏蔽文章內容
												</c:when>
												</c:choose></span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•留言檢舉處理:</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<select class="deal" name="comment_reportprocess_state">
											<option value="-1" disabled selected>--請選擇--</option>
											<option value="1">屏蔽留言內容</option>
											<option value="2">不屏留言章內容</option>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•留言檢舉註記:</span>

									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<textarea class="rComment-text" rows="2" name="comment_reportprocess_content">${commentReportVO.comment_reportprocess_content}</textarea>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span>•留言檢舉處理時間:</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<input class="dealDate" type="text" name="comment_reportprocess_time">
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<input type="hidden" name="comment_id" value="${commentReportVO.comment_id}">
										<input type="hidden" name="emp_id" value="1">
										<button type="submit" class="btn btn-primary rComment-btn">
											送出處理</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- =======================以上區塊可自訂======================= -->
				</div>
			</section>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="js/back.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.js"></script>
	<script src="js/jquery.datetimepicker.full.js"></script>
	<script src="js/main.js"></script>
	<script src="js/back-ariticle.js"></script>
</body>

</html>