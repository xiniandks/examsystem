
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首页</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 80px;
            padding-left: 50px;
            font-size: 20px;
        }
        .container { margin:10px ; min-width:10px;}
    </style>

</head>
<body>

<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" style="font-size: 25px">C语言在线考试系统</a>
        </div>

        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav"> <!-- 下列class="active"  为那个高亮 -->
                <li  ><a href=""><span class="glyphicon glyphicon-home"></span> 知识点 </a></li>
                <li  ><a href=""><span class="glyphicon glyphicon-home"></span> 题库 </a></li>
                <li><a href="<%=basePath%>/teacher/findexam.do"><span class="glyphicon glyphicon-briefcase"></span> 考试 </a></li>
                <li class = "dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user" ></span> 学生 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="" style="font-size: 20px">学生信息导入</a></li>
                        <li><a href="" style="font-size: 20px">学生成绩查询</a></li>
                        <!--<li class="divider"></li> -->
                        <!--<li><a href="#">另一个分离的链接</a></li>-->
                    </ul>
                </li>
                <li><a href=""><span class="glyphicon glyphicon-envelope"></span> 公共信息 </a></li>
            </ul>
            <div  style="margin: 10px ; text-align: right" class="info">
                <span style="color: gray">欢迎您：${sessionScope.studentsession.username } 同学</span>
                <em>|</em>
                 <a  href="<%=basePath%>/student/logout.do">退出</a>

            </div>
        </div>
    </div><!-- /.container -->

</div>
<br/>
<br/>
<br/>
<br/>
<p align="center">  
       <canvas id="canvas_circle" width="700px" height="400px"> </canvas>  
</p>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<form action="<%=basePath%>/student/ajaxUpload.do" method="post" enctype="multipart/form-data">
    请选择Excel：<input type="file" name="file">
    <input type="submit" name="提交">
</form>
</body>
</html>