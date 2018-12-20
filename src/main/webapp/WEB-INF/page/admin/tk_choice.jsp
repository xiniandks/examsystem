<%--
  Created by IntelliJ IDEA.
  User: 小鸣ds
  Date: 2018/12/17
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>管理员首页</title>


    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>/vendor/dist/css/sb-admin-2.css" rel="stylesheet">

    <link href="<%=basePath%>/vendor/css/editTable.css" type="text/css" rel="stylesheet"/>
    <script language="javascript" type="text/javascript" src="<%=basePath%>/vendor/js/jquery-1.7.2.min.js"></script>
    <script language="javascript" type="text/javascript" src="<%=basePath%>/vendor/js/editTable.js"></script>
    <!-- Custom Fonts -->
    <link href="<%=basePath%>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>

    <![endif]-->

</head>
<style>
    .line {
        width: 70px;
        overflow: hidden;
        text-align: left;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    textarea:focus {
        border-color: #719ECE;
        box-shadow: 0 0 10px #719ECE;
    }
</style>
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
                    <li><a href="<%=basePath%>/user/index.do"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
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
                                <a href="<%=basePath%>/user/findallchoice.do">选择题查询</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/tk/blankall.do">填空题查询</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/tk/allReadFill.do">程序填空查询</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/tk/allReadProgram.do">读程序写结果查询</a>
                            </li><li>
<a href="<%=basePath%>/tk/allPgDesign.do">程序设计查询</a>                        </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="<%=basePath%>/user/findpoint1.do"><i class="fa fa-table fa-fw"></i>知识点</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/user/findallteacher.do"><i class="fa fa-edit fa-fw"></i>教师</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/teacher/allexam.do"><i class="fa fa-pencil fa-fw"></i>考试管理</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/basic/allsemester.do"><i class="fa fa-wrench fa-fw"></i>基础设置</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.navbar-static-side -->
    </nav>
    <!-- Page Content -->
    <div id="page-wrapper">
        <br>
        <!-- /.panel-heading -->
        <table class="edtitable">
            <thead>
            <tr>
                <th colspan="4" style="text-align:center">选择题</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>题号</td>
                <td>题目</td>
                <td>难度</td>
                <td class="del-col">操作</td>
            </tr>
            <c:forEach items="${requestScope.choice}" var="ch">
                <tr>
                    <c:set var="index" value="${index+1}"/>
                    <td>${index}</td>
                    <td class="line">${ch.content}</td>
                    <td>${ch.difficulty}</td>
                    <td class="del-col">
                        <a href="#" onclick="return edit(${ch.id})" style="text-decoration: none;">
                            <span class="fa fa-edit fa-fw"></span>
                        </a>
                        <a href="#" onclick="return trash(${ch.id})" style="text-decoration: none;"
                           data-toggle="modal" data-target="#trashModal">
                            <span class="fa fa-trash-o fa-fw"></span>
                        </a>
                        <a href="#">
                            <span class="glyphicon glyphicon-plus" onclick="add()"></span>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!-- Modal编辑模态框 -->
        <div class="modal fade" id="editch" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myedit">编辑</h4>
                    </div>
                    <form class="form-horizontal" action="<%=basePath%>/user/updatech.do" method="post">
                        <div class="modal-body">
                            <input name="id" id="id" hidden="hidden"/>
                            <div class="form-group input-group">
                                <span class="input-group-addon" style="height: 40px ; tab-size: 16px ">题目：</span>
                                <textarea class="form-control" rows="3" name="content" id="upcontent"></textarea>
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon" style="height: 40px ; tab-size: 16px ">A:</span>
                                <textarea class="form-control" rows="3" name="aoption" id="upaoption"></textarea>
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon" style="height: 40px ; tab-size: 16px ">B:</span>
                                <textarea class="form-control" rows="3" name="boption" id="upboption"></textarea>
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon" style="height: 40px ; tab-size: 16px ">C:</span>
                                <textarea class="form-control" rows="3" name="coption" id="upcoption"></textarea>
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon" style="height: 40px ; tab-size: 16px ">D:</span>
                                <textarea class="form-control" rows="3" name="doption" id="updoption"></textarea>
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon" style="height: 40px ; tab-size: 16px ">答案：</span>
                                <div class="col-sm-5">
                                    <select class="form-control" id="upanswer" name="answer">
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon" style="height: 40px ; tab-size: 16px ">分析：</span>
                                <textarea class="form-control" rows="3" name="analysis" id="upanalysis"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">知识点</label>
                                <div class="col-sm-6">
                                    <select class="form-control" id="upchapter" name="chapter">
                                    </select>
                                    <select class="form-control" id="upchaptertwo" name="chaptertwo"></select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">难度</label>
                                <div class="col-sm-5">
                                    <select class="form-control" id="updifficulty" name = "difficulty">
                                        <option value="1">热血青铜</option>
                                        <option value="2">不屈白银</option>
                                        <option value="3">英勇黄金</option>
                                        <option value="4">超级王牌</option>
                                        <option value="5">无敌战神</option></select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary" id="upaddbut">提交</button>
                        </div>
                    </form>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        </td>
        </tr>
        <!-- Button trigger modal -->
        <!-- /.modal -->
        <!-- Modal添加的模态框 -->
        <div class="modal fade" id="addch" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="my" style="text-align:center">添加题目</h4>
                    </div>
                    <form class="form-horizontal" action="<%=basePath%>/user/addchoice.do" method="post">
                        <div class="modal-body">
                            <input name="id" id="id" hidden="hidden"/>
                            <div class="form-group input-group">
                                <span class="input-group-addon" style="height: 40px ; tab-size: 16px ">题目：</span>
                                <textarea class="form-control" rows="3" name="content" id="content"></textarea>
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon" style="height: 40px ; tab-size: 16px ">A:</span>
                                <textarea class="form-control" rows="3" name="aoption" id="aoption"></textarea>
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon" style="height: 40px ; tab-size: 16px ">B:</span>
                                <textarea class="form-control" rows="3" name="boption" id="boption"></textarea>
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon" style="height: 40px ; tab-size: 16px ">C:</span>
                                <textarea class="form-control" rows="3" name="coption" id="coption"></textarea>
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon" style="height: 40px ; tab-size: 16px ">D:</span>
                                <textarea class="form-control" rows="3" name="doption" id="doption"></textarea>
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon" style="height: 40px ; tab-size: 16px ">答案：</span>
                                <div class="col-sm-5">
                                    <select class="form-control" id="answer" name="answer">
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon" style="height: 40px ; tab-size: 16px ">分析：</span>
                                <textarea class="form-control" rows="3" name="analysis" id="analysis"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">知识点</label>
                                <div class="col-sm-6">
                                    <select class="form-control" id="chapter" name="chapter">
                                    </select>
                                    <select class="form-control" id="chaptertwo" name="chaptertwo"></select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">难度</label>
                                <div class="col-sm-5">
                                    <select class="form-control" id="difficulty" name = "difficulty">
                                        <option value="1">热血青铜</option>
                                        <option value="2">不屈白银</option>
                                        <option value="3">英勇黄金</option>
                                        <option value="4">超级王牌</option>
                                        <option value="5">无敌战神</option></select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary" id="addbut">提交</button>
                        </div>
                    </form>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        </td>
        </tr>
        <!--删除的模态框-->
        <div class="modal fade" id="trashModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- 模糊框头部 -->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                        </button>
                        <h4 class="modal-title">删除！</h4>
                    </div>
                    <!-- 模糊框主体 -->
                    <div class="modal-body">
                        <strong>你确定要删除吗？</strong>
                    </div>
                    <!-- 模糊框底部 -->
                    <div class="modal-footer">
                        <button type="button" class="delSure btn btn-info" data-dismiss="modal">确定</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- /.container-fluid -->
    </div>

    <!-- /#page-wrapper -->
</div>

<!-- /#wrapper -->
<script>
    function add() {
        getpoint();
        $("#addch").modal({
            backdrop: "static"
        });
    };

    function getpoint() {
        $("#chapter").empty();
        $("#chaptertwo").empty();
        $.ajax({
            url: "<%=basePath%>/user/pointall.do",
            type: "GET",
            success: function (data) {
                console.log(data);
                var chapter = $(document).find("#chapter");
                var chaptertwo = $(document).find("#chaptertwo");
                for (var i = 0; i < data.length; i++) {
                    chapter.append("<option value='" + data[i].id + "'>" + data[i].pointname + "</option>");
                }
                for (var j = 0; j < data[0].point2.length; j++) {
                    console.log("当前位置" + data[0].point2[j].pname + "内容为" + data[0].point2[j].pname);
                    chaptertwo.append("<option value='" + data[0].point2[j].pname + "'>" + data[0].point2[j].pname + "</option>");
                }
                //select1绑定change事件
                $("#chapter").change(function () {
                    var p = this.value;
                    console.log("第几个" + p);
                    p = p - 1;
                    //删除原来的信息
                    $("#chaptertwo").empty();
                    // console.log("啦啦啦2"+data[p].point2);
                    //遍历p2的数组
                    for (var j = 0; j < data[p].point2.length; j++) {
                        chaptertwo.append("<option value='" + data[p].point2[j].pname + "'>" + data[p].point2[j].pname + "</option>");
                    }
                });
            }
        });
    }

    // 编辑信息的方法
    function edit(id) {
        // 先去查询数据
        $.ajax({
            url: '<%=basePath%>/user/findBychId.do',
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify({
                id: id
            }),
            success: function (data) {
                getpt(data.chapter);
                $("#id").val(data.id);
                $("#upcontent").val(data.content);
                $("#upaoption").val(data.aoption);
                $("#upboption").val(data.boption);
                $("#upcoption").val(data.coption);
                $("#updoption").val(data.doption);
                $("#upanswer").val(data.answer);
                $("#upanalysis").val(data.analysis);
                $("#upchapter").val(data.chapter);
                console.log("题目的chapter" + data.chapter);
                console.log("select当前的value" +   $("#upchapter").val());
                console.log(data.chapter);
                $("#upchaptertwo").val(data.chaptertwo);
                console.log(data.chaptertwo);
                $("#updifficulty").val(data.difficulty);
                $("#editch").modal('show');
            },
            error: function () {
                alert("错误");
            }
        });
    }
    function getpt(chid) {
        console.log("当前复选框" + chid);
        $("#upchapter").empty();
        $("#upchaptertwo").empty();
        $.ajax({
            url:"<%=basePath%>/user/pointall.do",
            type:"GET",
            success:function (data){
                console.log(data);
                var upchapter = $(document).find("#upchapter");
                var upchaptertwo = $(document).find("#upchaptertwo");
                for(var i = 0; i < data.length; i++){
                    console.log("当前select的option="+ data[i].id);
                    upchapter.append("<option value='" + data[i].id + "'>" + data[i].pointname + "</option>");
                    console.log("当前chapter的value" + data[i].id);
                }for(var j = 0; j < data[chid-1].point2.length; j++) {
                    upchaptertwo.append("<option value='" + data[chid-1].point2[j].pname + "'>" + data[chid-1].point2[j].pname + "</option>");
                }
                //select1绑定change事件
                $("#upchapter").change(function () {
                    var p = this.value;
                    p = p-1;
                    //删除原来的信息
                    $("#upchaptertwo").empty();
                    for (var j = 0; j < data[p].point2.length; j++) {
                        upchaptertwo.append("<option value='" + data[p].point2[j].pname+ "'>" + data[p].point2[j].pname+ "</option>");
                    }
                });
            }
        })
    }
    //删除
    function trash(id) {
        if (!id) {
            alert("error");
        } else {
            $(".delSure").click(function () {
                $.ajax({
                    url: '<%=basePath%>/user/deletech.do?id=' + id,
                    type: 'POST',
                    success: function (data) {
                        $("body").html(data);
                    }
                });
            });
        }
    }
</script>
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

