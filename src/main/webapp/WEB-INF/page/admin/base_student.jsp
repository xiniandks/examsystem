<%--
  Created by IntelliJ IDEA.
  User: 小鸣ds
  Date: 2018/12/11
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>基础设置</title>

    <link rel="stylesheet" href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css">
    <script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
    <script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>

    <style>
        table{
            border: 1px solid black;
            border-collapse: collapse;
            width: 500px;
        }
        table th {
            border: 1px solid black;
            width: 20%;
        }
        table td {
            align-items: center;
            border: 1px solid black;
            width: 20%;
        }
        table th {
            background-color: #c6d0e9;
        }
    </style>
    <script>
        //根据checkbox批量删除
        function todelete() {
            var msg = "确认删除选中试题";
            if(confirm(msg)==true){
                var chk_value = [];//定义一个数组
                //利用将name等于ids的多选按钮得到
                $("#tableId").find(":input[id='case']:checked").each(function(){
                    //获取id值，因为id单元格在复选框单元格的下一个元素
                    var val = $(this).parent().next().text();
                    //将id值添加到数组
                    chk_value.push(val);
                });
                if (chk_value.length == 0) {
                    alert("你还没有选择任何内容！");
                }
                if (chk_value.length > 0) {
                    //在浏览器控制台打印信息
                    console.log(chk_value);
                    location.href = "${ctx}/tec/isdeleteMany.do?chk_value=" + chk_value;
                }
            }
        }

    </script>

    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>/vendor/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="<%=basePath%>/vendor/js/123.js"></script>
    <script src="<%=basePath%>/vendor/js/456.js"></script>
    <![endif]-->

</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">C语言在线考试系统</a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="../login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="#"><i class="fa fa-dashboard fa-fw"></i>首页</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>题库<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="Choice%20question_query.html">选择题查询</a>
                            </li>
                            <li>
                                <a href="Completion%20question_query.html">填空题查询</a>
                            </li>
                            <li>
                                <a href="Fill_in_blanks%20question_query.html">程序填空查询</a>
                            </li>
                            <li>
                                <a href="Read_program_results%20question_query.html">读程序写结果查询</a>
                            </li><li>
                            <a href="Program_design%20question_query.html">程序设计查询</a>
                        </li>

                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="knowledge%20point.html"><i class="fa fa-table fa-fw"></i>知识点</a>
                    </li>
                    <li>
                        <a href="teacher.html"><i class="fa fa-edit fa-fw"></i>教师</a>
                    </li>
                    <li>
                        <a href="exam.html"><i class="fa fa-pencil fa-fw"></i>考试管理</a>
                    </li>
                    <li>
                        <a href="base_year.html"><i class="fa fa-wrench fa-fw"></i>基础设置</a>

                    </li>

                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>

    <!-- Page Content -->
    <div id="page-wrapper">
        <br>
        <br>
        <table border="1" class="table table-bordered" id = "tab1">
            <thead>
            <tr>
                <th colspan="5">${cname}学生信息设置</th>
            </tr>
            </thead>

            <tr>
                <th></th>
                <th>学号</th>
                <th>姓名</th>
                <th>密码</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${student}" var="st">
                <tr>
                    <td ><input type="checkbox"></td>
                    <td style="margin-top: 50%"  >${st.num}</td>
                    <td> <a href="base_test.html">${st.username}</a></td>
                    <td>${st.password}</td>
                    <td >
                        <input style="width: 30%" class="btn btn-outline btn-primary" type="button" value="编辑" data-toggle="modal" data-target="#myModal" >
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div align="center">
            <input style="width: 20%" class="btn btn-outline btn-primary" type="button" value="新增"  data-toggle="modal" data-target="#myModa_n" >
            <input style="width: 20%" class="btn btn-outline btn-primary" type="button" value="删除" onclick="todelete()"/>
        </div>
        <br>
    </div>

    <!-- 编辑-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">专业更改</h4>
                </div>
                <div class="modal-body" style="text-align:left">

                    <div class="form-group input-group">
                        <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入更改后的专业:</span>
                        <input type="text" style="height: 40px " class="form-control">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button"  class="btn btn-outline btn-primary" data-dismiss="modal">关闭</button>
                    <button type="button"  class="btn btn-outline btn-primary">确定</button>

                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->

    </div>
    <!-- /#wrapper -->
    <br>
    <div>
        <tr class="append-row">
            <td colspan="5" align="right">
                <!-- Modal -->
                <div class="modal fade" id="myModa_n" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <form action="<%=basePath%>/basic/insertclass.do" method="post">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabe2" style="text-align:center">添加选项</h4>
                                </div>
                                <input name="maid" id="maid"  value="${maid}" hidden="hidden"/>
                                <div class="modal-body" style="text-align:left">
                                    <div class="form-group input-group">
                                        <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入班级:</span>
                                        <input type="text" style="height: 40px " class="form-control" name="cname">
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button"  class="btn btn-outline btn-primary" data-dismiss="modal">关闭</button>
                                    <button type="submit"  class="btn btn-outline btn-primary">确定</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                    </form>
                    <!-- /.modal-dialog -->
                </div>
            </td>
        </tr>
    </div>


</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>/vendor/dist/js/sb-admin-2.js"></script>

</body>

</html>