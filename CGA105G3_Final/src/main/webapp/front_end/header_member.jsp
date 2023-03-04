<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- header start except for toolbarFixed  -->
<header class="header-section header-normal"> </header>
<div class="top-nav">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<ul class="tn-left">
					<a href="<%=request.getContextPath()%>/front_end/member/home.jsp"><img
						class="tttlogo"
						src="<%=request.getContextPath()%>/front_end/member/img/ttt-LOGO.png"
						alt="" style="cursor: pointer;"></a>
					<div>Time to Travel</div>
					<div class="search-icon search-switch">
						<span class="icon"><img class="searchicon"
							src="<%=request.getContextPath()%>/front_end/member/img/magnifying-glass.png"
							alt=""></span> <input type="search"
							style="border: 2px solid black" id="search" placeholder="探索..." />
					</div>
				</ul>
			</div>
			<div class="col-lg-6">
				<div class="tn-right">
					<div class="top-social">

						<a
							href="<%=request.getContextPath()%>/front_end/ticket/cartlist.jsp">
							<img class="shoppingCartIMG"
							src="<%=request.getContextPath()%>/front_end/member/img/shopping-cart_1.png">
						</a>
						<asp:Label ID="lblCartCount" runat="server"
							CssClass="badge badge-warning" ForeColor="White" />${cart.size() }

						<div class="dropdown" style="z-index: 15; cursor: pointer;">
							<a class="dropbtn"> <img class="account"
								src=" ${pageContext.request.contextPath}/front_end/member/member.do?action=getImg&member_id=${memberVO.member_id}"></a>
							<div class="dropdown-content">
								<a
									href="${pageContext.request.contextPath}/front_end/member/member.do?action=clickMemberCenter&member_email=${memberVO.member_email}"><i
									class="fa fa-solid fa-gear"></i> 會員中心</a> <a
									href="<%=request.getContextPath()%>/front_end/member/Orderlist.jsp"><i
									class="fa fa-file-text"></i> 我的訂單</a> <a class="fav_list"
									href="<%=request.getContextPath()%>/front_end/member/FavList.jsp"><i
									class="fa fa-heart"></i> 我的最愛</a> <a
									href="${pageContext.request.contextPath}/front_end/member/member.do?action=logOut"><i
									class="fa-solid fa-right-to-bracket"></i> 登出帳號</a>
							</div>
						</div>
						<div class="language-option">
							<img class="flag"
								src="<%=request.getContextPath()%>/front_end/member/img/taiwan.png"
								alt=""> <span>TW </span>
						</div>
						<form Method="post" action="shoppinglist.do" id="shoppingListForm">
							<input type="hidden" name="action" value="checklogin">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="menu-item">
	<div class="container">
		<div class="row">
			<div class="col-lg-10">
				<div class="nav-menu">
					<nav class="mainmenu">
						<ul>
							<li><a
								href="<%=request.getContextPath()%>/front_end/member/home.jsp">|&nbsp;&nbsp;首頁</a></li>
							<li><a href="#">|&nbsp;&nbsp;住宿</a></li>
							<li><a
								href="<%=request.getContextPath()%>/front_end/ticket/browseTicket.jsp">|&nbsp;&nbsp;票券</a>
								<ul class="dropdown">
									<li><a
										href="<%=request.getContextPath()%>/front_end/ticket/browseTicketByType.jsp?tkt_type_id=2">交通</a>
									<li><a
										href="<%=request.getContextPath()%>/front_end/ticket/browseTicketByType.jsp?tkt_type_id=3">主題樂園</a>
									<li><a
										href="<%=request.getContextPath()%>/front_end/ticket/browseTicketByType.jsp?tkt_type_id=1">展覽</a>
									<li><a
										href="<%=request.getContextPath()%>/front_end/ticket/browseTicketByType.jsp?tkt_type_id=4">觀光景點</a>
								</ul></li>
							<li><a href="#">|&nbsp;&nbsp;行程</a></li>
							<li><a
								href="<%=request.getContextPath()%>/front_end/article/listAllArticle.jsp">|&nbsp;&nbsp;文章</a></li>
							<li><a
								href="<%=request.getContextPath()%>/front_end/firm/addFirm.jsp">|&nbsp;&nbsp;廠商</a></li>
							<li><a
								href="<%=request.getContextPath()%>/front_end/news/news_front_getAll.jsp">|&nbsp;&nbsp;最新消息</a></li>
							<li><a
								href="<%=request.getContextPath()%>/front_end/qa/NewFile.jsp">|&nbsp;&nbsp;常見問題</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Header End except for toolbarFixed -->
