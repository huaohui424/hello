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
  <script src="/static/layui/layui.js"></script>
  <script src="/static/admin/js/index.js"></script>
</head>
<body>
<table summary="user infomation table">
  <thead>
  <tr>
    <th>用户ID</th>
    <th>客户姓名</th>
    <th>电话</th>
    <th>地址</th>
    <th>身份证</th>
    <th>密码</th>
    <th>性别</th>
    <th>年龄</th>
    <th>消费</th>
    <th>机子号</th>
    <th>是否会员</th>
    <th>余额</th>
    <th>操作</th>
  </tr>
  </thead>

  <tbody>
    <c:forEach items="${pageInfo.list}" var="users">
      <tr>
        <td>${users.usersId}</td>
        <td>${users.usersName}</td>
        <td>${users.usersCall}</td>
        <td>${users.usersAddress}</td>
        <td>${users.usersIdCard}</td>
        <td>${users.usersPassword}</td>
        <td>${users.usersSex}</td>
        <td>${users.usersAge}</td>
        <td>${users.usersConsume}</td>
        <td>${users.usersCarDid}</td>
        <td>${users.usersMenBer}</td>
        <td>${users.usersBalance}</td>
        <td>
          <a href="/updateUsers?usersId=${users.usersId}"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">修改</button></a>
          <a href="/deleteUsers?usersId=${users.usersId}"  οnclick="javascript:return deleteOne();"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">删除</button></a>
        </td>
      </tr>
    </c:forEach>
  </tbody>

</table>
<div style="margin-left:auto;text-align: center">
  <a href="/insertUser"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">添加用户</button></a>
      <a href="/listUsers?pageNum=1&pageSize=${pageInfo.pageSize}"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">首页</button></a>
      <a href="/listUsers?pageNum=${pageInfo.prePage}&pageSize=${pageInfo.pageSize}"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">上一页</button></a>
      <a href="/listUsers?pageNum=${pageInfo.nextPage}&pageSize=${pageInfo.pageSize}"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">下一页</button></a>
      <a href="/listUsers?pageNum=${pageInfo.pages}&pageSize=${pageInfo.pageSize}"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">尾页</button></a>
</div>

<script type="text/javascript">
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
