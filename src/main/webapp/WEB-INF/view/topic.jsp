<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/topic.css">
</head>
<body>
<%@ include file="header.jsp" %>


	<div class="main w clearfix">
		<div class="main-left">
			<div class="share">
				<div class="share-left"><span class="glyphicon glyphicon-th-large"></span>&nbsp;话题广场</div>
				<div class="share-right">
					<a href="#" id="open-mask"><span class="glyphicon glyphicon-pencil"></span>&nbsp;申请添加话题</a>
				</div>
			</div>
			<div class="topic-root">
				<div class="topic-root-wrap">
					<c:forEach items="${topicList}" var="topic">
                        <a href="#">${topic.name}</a>
                    </c:forEach>

				</div>
			</div>
			<%--话题列表--%>
			<div class="topic-list">
				<div class="topic-list-wrap clearfix">
                    <c:forEach items="${topicList}" var="topic" varStatus="status">
                        <c:choose>
                            <c:when test="${status.count%2!=0}">
                                <div class="topic-odd relative">
                                    <a href="#" class="topic-image"><img src="${topic.image}"></a>
                                    <div class="topic-content">
                                        <a href="#" class="topic-name">${topic.name}</a>
                                        <a href="#" class="topic-desc">${topic.content}</a>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="topic-even relative">
                                    <a href="#" class="topic-image"><img src="${topic.image}"></a>
                                    <div class="topic-content">
                                        <a href="#" class="topic-name">${topic.name}</a>
                                        <a href="#" class="topic-desc">${topic.content}</a>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
				</div>
			</div>
			<div class="topic-more">
				<a href="#">更多</a>
			</div>
		</div>
		<div class="main-right">
			
			<div class="hot-user">
				<div class="clearfix"><div class="hot-user-title"><span></span>&nbsp;推荐网站</div></div>
				<ul class="hot-user-list">
					<li class="clearfix">
						<a href="http://toutiao.io/" class="hot-user-image"><img src="http://tva2.sinaimg.cn/crop.0.0.1022.1022.180/005Fj2RDgw1ex5pinpg65j30sg0sgdg9.jpg"></a>
						<a href="http://toutiao.io/" class="hot-user-name">开发者头条</a>
					</li>
					<li class="clearfix">
						<a href="http://gold.xitu.io/" class="hot-user-image"><img src="http://tva3.sinaimg.cn/crop.0.0.227.227.180/005SiNxyjw8f6nd2g4erxj306g06c74g.jpg"></a>
						<a href="http://gold.xitu.io/" class="hot-user-name">稀土掘金</a>
					</li>
					<li class="clearfix">
						<a href="https://segmentfault.com/" class="hot-user-image"><img src="http://tva2.sinaimg.cn/crop.0.0.180.180.180/795bf814jw1e8qgp5bmzyj2050050aa8.jpg"></a>
						<a href="https://segmentfault.com/" class="hot-user-name">SegmentFault</a>
					</li>
					<li class="clearfix">
						<a href="http://www.nowcoder.com/" class="hot-user-image"><img src="http://tva2.sinaimg.cn/crop.163.177.629.629.180/8116e3ccjw8er0ic82ljxj20qo0zk0u6.jpg"></a>
						<a href="http://www.nowcoder.com/" class="hot-user-name">牛客网</a>
					</li>
                    <li class="clearfix">
                        <a href="http://www.importnew.com/" class="hot-user-image"><img src="http://tva3.sinaimg.cn/crop.0.0.200.200.180/b254dc71jw1edshiof1s8j205k05kweh.jpg"></a>
                        <a href="http://www.importnew.com/" class="hot-user-name">ImportNew</a>
                    </li>
                    <li class="clearfix">
                        <a href="http://www.imooc.com/" class="hot-user-image"><img src="http://tva4.sinaimg.cn/crop.39.34.440.440.180/c5131475tw1egjkvkxkltj20e80e83yr.jpg"></a>
                        <a href="http://www.imooc.com/" class="hot-user-name">慕课网</a>
                    </li>
                    <li class="clearfix">
                        <a href="http://www.jikexueyuan.com/" class="hot-user-image"><img src="http://tva4.sinaimg.cn/crop.0.0.1022.1022.180/005xFAqKgw1ena5m2p0nrj30sg0sgwge.jpg"></a>
                        <a href="http://www.jikexueyuan.com/" class="hot-user-name">极客学院</a>
                    </li>
                    <li class="clearfix">
                        <a href="http://www.maiziedu.com/" class="hot-user-image"><img src="http://tva2.sinaimg.cn/crop.0.0.283.283.180/ac95fb6cjw1f4gyjr7exkj207w07wdg0.jpg"></a>
                        <a href="http://www.maiziedu.com/" class="hot-user-name">麦子学院</a>
                    </li>
                    <li class="clearfix">
                        <a href="http://study.163.com/" class="hot-user-image"><img src="http://tva1.sinaimg.cn/crop.0.0.200.200.180/ba94de6bjw1eldy8chcy0j205k05kq2r.jpg"></a>
                        <a href="http://study.163.com/" class="hot-user-name">网易云课堂</a>
                    </li>
                    <li class="clearfix">
                        <a href="https://www.xuetangx.com/" class="hot-user-image"><img src="http://tva3.sinaimg.cn/crop.0.0.208.208.180/005CvE72jw8ep4f11x1qnj305s05swek.jpg"></a>
                        <a href="https://www.xuetangx.com/" class="hot-user-name">学堂在线</a>
                    </li>
                    <li class="clearfix">
                        <a href="https://www.jisuanke.com/" class="hot-user-image"><img src="http://tva1.sinaimg.cn/crop.0.0.500.500.180/005FHjdCjw8ezalw82qynj30dw0dwq33.jpg"></a>
                        <a href="https://www.jisuanke.com/" class="hot-user-name">计蒜客</a>
                    </li>
                    <li class="clearfix">
                        <a href="https://www.shiyanlou.com/" class="hot-user-image"><img src="http://tva4.sinaimg.cn/crop.3.0.123.123.180/005AWTo8gw1elmhwrcdndj303m03m3yd.jpg"></a>
                        <a href="https://www.shiyanlou.com/" class="hot-user-name">实验楼</a>
                    </li>
				</ul>
			</div>
		</div>
	</div>

	<div class="mask"></div>
	<div class="upon-mask">
		<form>
			<input type="text" name="" placeholder="请输入话题名称">
			<button>提交申请</button>
		</form>
		<span id="close-mask">×</span>
	</div>
<%@ include file="footer.jsp" %>
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript">
	$(function(){

		var openMask = $("#open-mask");
		var closeMask = $("#close-mask");
		var mask = $(".mask");
		var uponMask = $(".upon-mask");

		openMask.click(function(){
			mask.show();
			uponMask.show();
		});

		closeMask.click(function(){
			mask.hide();
			uponMask.hide();
		});
	});
</script>
</body>
</html>













