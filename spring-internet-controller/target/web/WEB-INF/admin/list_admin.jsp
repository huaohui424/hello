<%--
  Created by IntelliJ IDEA.
  User: 野心
  Date: 2019/12/5
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>会员表</title>

  <link rel="stylesheet" href="/static/layui/css/layui.css">
  <link rel="stylesheet" href="/static/layui/css/global.css">
  <link rel="stylesheet" href="/static/admin/css/index.css">
  <link rel="stylesheet" href="/static/css/users.css">
  <link rel="stylesheet" type="text/css" href="/static/css/tanchuang.css">
  <script src="/static/layui/layui.js"></script>
  <script src="/static/admin/js/index.js"></script>
</head>
<body>
<table summary="user infomation table">
  <thead>
  <tr>
    <th>网管ID</th>
    <th>用户名</th>
    <th>密码</th>
    <th>姓名</th>
    <th>性别</th>
    <th>年龄</th>
    <th>身份证</th>
    <th>地址</th>
    <th>电话号码</th>
    <th>名族</th>
    <th>备注</th>
    <th>权限</th>
    <th>操作</th>
  </tr>
  </thead>

  <tbody>
    <c:forEach items="${pageInfo.list}" var="admin">
      <tr>
        <td>${admin.adminId}</td>
        <td>${admin.adminUsername}</td>
        <td>${admin.adminPassword}</td>
        <td>${admin.adminName}</td>
        <td>${admin.adminSex}</td>
        <td>${admin.adminAge}</td>
        <td>${admin.adminIdCard}</td>
        <td>${admin.adminAddress}</td>
        <td>${admin.adminPhone}</td>
        <td>${admin.adminNation}</td>
        <td>${admin.adminRemark}</td>
        <td>${admin.adminEnabled}</td>
        <td>
          <%--id="open_btn" name="opens_btn" class="btn"--%>
          <a  href="/updateAdmin?adminId=${admin.adminId}"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">修改</button></a>
          <a href="/deleteAdmin?adminId=${admin.adminId}"  οnclick="javascript:return deleteOne();"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">删除</button></a>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<!-- 弹窗内容开始 -->
<div id="background" class="back">
  <div id="div1" class="content">
    <div id="close">
      <span id="close-button">×</span>
      <h2>商品购买</h2>
    </div>
    <div id="div2">
      <form class="layui-form layui-form-pane" action="">
        <div class="layui-form-item">
          <label class="layui-form-label">商品名称</label>
          <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" value="" autocomplete="off" class="layui-input">
          </div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label">商品价格</label>
          <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" placeholder="价格" autocomplete="off" class="layui-input">
          </div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label">购买数量</label>
          <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" placeholder="购买数量" autocomplete="off" class="layui-input">
          </div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label">备注</label>
          <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" placeholder="备注" autocomplete="off" class="layui-input">
          </div>
        </div>
        <input type="button" id="goumai" value="确定购买"/>
        <input type="button" id="quxiao" value="取消"/>
      </form>

    </div>

  </div>
</div>
<!-- 弹窗内容结束 -->

<div style="margin-left:auto;text-align: center">
      <a href="/insertAdmin"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">添加用户</button></a>
      <a href="/listAdmin?pageNum=1&pageSize=${pageInfo.pageSize}"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">首页</button></a>
      <a href="/listAdmin?pageNum=${pageInfo.prePage}&pageSize=${pageInfo.pageSize}"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">上一页</button></a>
      <a href="/listAdmin?pageNum=${pageInfo.nextPage}&pageSize=${pageInfo.pageSize}"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">下一页</button></a>
      <a href="/listAdmin?pageNum=${pageInfo.pages}&pageSize=${pageInfo.pageSize}"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">尾页</button></a>
</div>

<script type="text/javascript">
  <!--弹窗-->

  //var btn = document.getElementById('open_btn');
  var div = document.getElementById('background');
  var close = document.getElementById('close-button');

  btn.onclick = function show() {
    div.style.display = "block";
  }

  close.onclick = function close() {
    div.style.display = "none";
  }

  window.onclick = function close(e) {
    if (e.target == div) {
      div.style.display = "none";
    }
  }


  function deleteOne() {
    var msg = "您真的确定要删除吗?\n请确认！";
    if (confirm(msg)==true){
      return true;
    }else{
      return false;
    }
  }

  //动态给js添加class属性
  function addClass(element, value) {
    if(!element.className) {
      element.className = value; //如果element本身不存在class,则直接添加class为value的值
    } else {
      element.className += " "+value; //如果element之前有一个class值，注意中间要多一个空格,然后再加上value的值
    }
  }

  //隔行换色
  function stripeTable() {
    var tables = document.getElementsByTagName("table"); //遍历文档中的所有table
    for(var i=0; i<tables.length; i++) {
      var rows = document.getElementsByTagName("tr");
      for(var j=0; j<rows.length; j++) {
        if(j%2 == 0) {
          addClass(rows[j], "odd"); //如是偶数行，则添加class为odd的属性
          //rows[j].setAttribute("class", "odd");
        }
      }
    }
  }

  //鼠标经过时高亮显示
  function highlightRows() {
    var rows = document.getElementsByTagName("tr");
    for(var i=0; i<rows.length; i++) {
      rows[i].oldClassName = rows[i].className; //首先保存之前的class值
      rows[i].onmouseover = function() {
        addClass(this, "highlight"); //鼠标经过时添加class为highlight的值
      }
      rows[i].onmouseout = function() {
        this.className = this.oldClassName; //鼠标离开时还原之前的class值
      }
    }
  }

  window.onload = function() {
    stripeTable();
    highlightRows();
  }
</script>
</body>
</html>
