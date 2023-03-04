<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.empfunc.model.*"%>


<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Time To Travel</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/back_end/empFunc/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/back_end/empFunc/css/back.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<style>
	table td img {
		width: 50px;
		height: 50px;
	}
	
	table tbody td {
		vertical-align: middle;
	}
	
	label.normal {
		background-color: #fff;
		padding: 2px 5px;
		border-radius: 5px;
	}
	
	input:disabled {
    	color: red;
	}
	
	label.spotlight{
		background-color: #A4D6E6;
		padding: 2px 5px;
		border-radius: 5px;
	}
	
</style>

</head>

<body>

	<div class="container-all">
		<!-- 左邊 -->
		<div class="container-left">
			<!-- 導覽列 -->
		<jsp:include page="../sidebar.jsp"></jsp:include>

		</div>
		<!-- 右邊 -->
		<div class="container-right">
			<!-- 右上 -->
			<jsp:include page="../header.jsp"></jsp:include>
			<!-- 右下 -->
			<section id="first">
				<div class="container right-down">
					<!-- 段1 -->
					<div class="row">
						<div class="col-md-12 h1">
							<h1>所有員工權限資料</h1>
						</div>
					</div>

					<hr>
					<!-- =======================以下區塊可自訂======================= -->
					<!-- 分頁標籤，可以新增分頁，若不要分頁可以整塊刪掉 -->
					<div class="nav nav-tabs">
						<!-- 分頁1 -->
						<button class="nav-link active" data-bs-toggle="tab"
							data-bs-target="#tab-1" aria-selected="true">搜尋員工權限</button>
						<!-- 分頁2 -->
						<!-- 分頁3 -->
					</div>
					<!--  分頁內容，若不要分頁可以整塊刪掉 -->
					<div class="tab-content">
						<!-- 分頁1 內容 -->
						<jsp:useBean id="empSvc" scope="page" class="com.emp.model.EmpService" />
						<div class="row justify-content-center">
							<div class="col-4">
								<form method="post" action="<%=request.getContextPath()%>/back_end/empFunc/empFunc.do">
									<table>
										<tr>
											<td><b>依員工姓名篩選:</b></td>
											<td><select size="1" name="emp_id">
													<c:forEach var="empVO" items="${empSvc.all}">
														<option value="${empVO.emp_id}"
															${(param.emp_id==empVO.emp_id)? 'selected':'' }>${empVO.emp_name}
													</c:forEach>
											</select> 
											<input type="hidden" name="action" value="getEmpID_For_Display"> 
											<input type="submit" value="送出">
											</td>
											<td style="color: red">${errorMsgs.emp_id}</td>
										</tr>
									</table>
								</form>
							</div>
						</div>
	
						<table>
							<tr></tr>
						</table>
	
						<jsp:useBean id="funcSvc" scope="page" class="com.func.model.FuncService" />
						<div class="row justify-content-center">
							<div class="col-4">
								<form method="post" action="<%=request.getContextPath()%>/back_end/empFunc/empFunc.do">
									<table>
										<tr>
											<td><b>依權限篩選:</b></td>
											<td><select size="1" name="func_id">
													<c:forEach var="funcVO" items="${funcSvc.all}">
														<option value="${funcVO.func_id}">${funcVO.func_name}
													</c:forEach>
											</select> 
											<input type="hidden" name="action" value="getFuncID_For_Display"> 
											<input type="submit" value="送出">
											</td>
										</tr>
									</table>
								</form>
							</div>
						</div>
							<!-- 分頁2 內容 -->
						<div class="tab-pane show active" id="tab-1">
							<div class="row search">
								<div class="col-md-12">
								<br>
								<table border=1  class="table">
									<jsp:useBean id="empFuncSvc" scope="page" class="com.empfunc.model.EmpFuncService" />
										<tr>
											<th>編號</th>
											<th>姓名</th>
											<th>權限</th>
											<th>修改</th>
										</tr>
									<c:forEach var="empVO" items="${empSvc.all}">
										<tr>
											<td>${empVO.emp_id}</td>
											<td>${empVO.emp_name}</td>
											<td>
												<c:forEach var="funcVO" items="${funcSvc.all}" varStatus="xxx">
													<input type="checkbox" name="func${xxx.count}"
													${empFuncSvc.getByOne(empVO.emp_id,funcVO.func_id).func_id == funcVO.func_id ? 'checked':''}
													disabled>
													<label for="func${xxx.count}" ${empFuncSvc.getByOne(empVO.emp_id,funcVO.func_id).func_id == funcVO.func_id ? 'class=spotlight':'class=normal'}>
													${funcVO.func_name}
													</label>
												</c:forEach>
											</td>
											<td>
												<form method="post" action="<%=request.getContextPath()%>/back_end/empFunc/empFunc.do">
													<input type="submit" value="修改"> 
													<input type="hidden" name="emp_id" value="${empVO.emp_id}">
													<input type="hidden" name="action" value="getOne_For_Update">
												</form>
											</td>
										</tr>
									</c:forEach>
								</table>
							<!-- 分頁3 內容 -->
								</div>
							</div>
						</div>
					</div>
					<!-- =======================以上區塊可自訂======================= -->
				</div>
			</section>

		</div>

	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/back_end/empFunc/js/back.js"></script>
    <script src="<%=request.getContextPath()%>/back_end/empFunc/js/bootstrap.min.js"></script>

</body>

</html>