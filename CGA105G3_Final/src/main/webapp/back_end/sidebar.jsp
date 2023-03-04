<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<nav id="sidebar">
				<!-- 展開紐 -->
				<button type="button" id="collapse" class="collapse-btn">
					<i class="bi bi-arrow-left-square"></i>
				</button>

				<!-- list -->
				<ul class="list-unstyled">

					<p>
						<img id=logo src="<%=request.getContextPath()%>/back_end/emp/images/TTT2.png" alt=""> <br>後台管理系統
					</p>
					<hr>

					<li >
                        <a href="<%=request.getContextPath()%>/back_end/index/index.jsp">首頁 <i class="bi bi-house-door"></i></a>
                    </li>
                    
                    <c:forEach var="empFuncVO" items="${listEmpFunc}">
                    
                    <c:if test="${empFuncVO.func_id==2}">
                    <li>
                        <a href="#memlist" data-bs-toggle="collapse" id="dropdown">會員管理 <i class="bi bi-person"></i></a>
                        <ul id="memlist" class="collapse list-unstyled">
                            <li>
                                <a href="<%=request.getContextPath()%>/back_end/member/memberBack.jsp">會員帳號管理</a>
                            </li>
                        </ul>
                    </li>
                    </c:if>
                    
                    <c:if test="${empFuncVO.func_id==1}">
                    <li>
                        <a href="#emplist" data-bs-toggle="collapse">員工管理 <i class="bi bi-people"></i></a>
                        <ul id="emplist" class="collapse list-unstyled">
                            <li>
                                <a href="<%=request.getContextPath()%>/back_end/emp/select_page.jsp">員工資料管理</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/back_end/empFunc/listAllEmpFunc.jsp">員工權限管理</a>
                            </li>
                        </ul>
                    </li>
                    </c:if>
                    
                    <c:if test="${empFuncVO.func_id==3}">
                    <li>
                        <a href="#syslist" data-bs-toggle="collapse">平台管理 <i class="bi bi-window-fullscreen"></i></a>
                        <ul id="syslist" class="collapse list-unstyled">
                            <li>
                                <a href="./back_news.html">最新消息管理</a>
                            </li>
                            <li>
                                <a href="./back_article.html">文章檢舉管理</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/back_end/firm/select_page.jsp">廠商審核管理</a>
                            </li>
                            <li>
                                <a href="./back_message.html">即時客服管理</a>
                            </li>
                            <li>
                                <a href="./back_QA.html">常見問題管理</a>
                            </li>
                        </ul>
                    </li>
                    </c:if>
                    
                    <c:if test="${empFuncVO.func_id==5}">
                    <li>
                        <a href="#hotellist" data-bs-toggle="collapse">住宿管理 <i class="bi bi-house-heart"></i></a>
                        <ul id="hotellist" class="collapse list-unstyled">
                            <li>
                                <a href="./back_hotel_1.html">房型管理</a>
                            </li>
                            <li>
                                <a href="./back_hotel_2.html">房型訂單管理</a>
                            </li>
                            <li>
                                <a href="./back_hotel_3.html">房型促銷管理</a>
                            </li>
                        </ul>
                    </li>
                    </c:if>
                    
                    <c:if test="${empFuncVO.func_id==4}">
                    <li>
                        <a href="#tklist" data-bs-toggle="collapse">票券管理 <i class="bi bi-ticket-perforated"></i></a>
                        <ul id="tklist" class="collapse list-unstyled">
                            <li>
                                <a href="./back_tk_1.html">票券管理</a>
                            </li>
                            <li>
                                <a href="./back_tk_2.html">票券訂單管理</a>
                            </li>
                            <li>
                                <a href="./back_tk_3.html">票券優惠管理</a>
                            </li>
                        </ul>
                    </li>
                    </c:if>
                    
                    <c:if test="${empFuncVO.func_id==6}">
                    <li>
                        <a href="#ltrlist" data-bs-toggle="collapse">行程管理 <i class="bi bi-pin-map"></i></a>
                        <ul id="ltrlist" class="collapse list-unstyled">
                            <li>
                                <a href="./back_itr_1.html">行程種類管理</a>
                            </li>
                            <li>
                                <a href="./back_itr_2.html">行程管理</a>
                            </li>
                            <li>
                                <a href="./back_itr_3.html">行程訂單管理</a>
                            </li>
                        </ul>
                    </li>
                    </c:if>
                    
                    </c:forEach>
				</ul>

			</nav>