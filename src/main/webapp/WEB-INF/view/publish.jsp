<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/wangEditor.css">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/publis
	h.css">
</head>
<body>
<%@ include file="header.jsp" %>


	<!-- 中间主体板块 -->
	<div class="main w clearfix">
		<form action="publishPost.do" method="post">
            <input type="hidden" name="topic.tid" value="1" id="tid">
            <input type="hidden" name="user.uid" value="${sessionScope.uid}">

			<div class="pub-header"><span></span>&nbsp;话题发布</div>
			<div class="pub-title">
				<input type="text" name="title" placeholder="标题：一句话说明你遇到的问题或想分享的经验">
			</div>
			<div class="pub-topic">
				<span>标签：</span>
				<div class="topic-list">
					<c:forEach items="${topicList}" var="topic">
                        <a class="topics" href="#" title="${topic.tid}">${topic.name}</a>
                    </c:forEach>
				</div>
			</div>

			<div class="pub-textarea">
				<div style="width: 920px;">
					<textarea name="content" id="textarea" style="height: 300px;max-height: 1000px;"></textarea>
				</div>
                <button class="pub-button">发布</button>
			</div>
		</form>

	</div><!-- 主体结束 -->

<%@ include file="footer.jsp" %>
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/wangEditor.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript">
    $(function(){
        var editor = new wangEditor('textarea');

        editor.config.menus = [
            'source',
            '|',
            'bold',
            'underline',
            'italic',
            'strikethrough',
            'eraser',
            'fontsize',
            '|',
            'link',
            'table',
            'emotion',
            '|',
            'img',
            'insertcode',
            '|',
            'undo',
        ];

        //配置处理图片上传的路径，最好用相对路径
        editor.config.uploadImgUrl = 'upload.do';
        //配置图片上传到后台的参数名称
        editor.config.uploadImgFileName = 'myFileName';
        editor.create();

        //一次只能选中一个话题
        var topics = $(".topics");
        var tid = $("#tid");
        topics.click(function(){
            for(var i=0;i<topics.length;i++){
                $(topics[i]).css("background-color","#fff");
            }
            $(this).css("background-color","#1abc9c");
            tid.val(this.title);
        });

    });
    
</script>
</body>
</html>













