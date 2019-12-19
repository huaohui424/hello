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
  <title>计算机</title>
  <link rel="stylesheet" href="/static/layui/css/layui.css">
  <link rel="stylesheet" href="/static/layui/css/global.css">
  <link rel="stylesheet" href="/static/admin/css/index.css">
  <script src="/static/layui/layui.js"></script>
  <script src="/static/admin/js/index.js"></script>
  <script src="/static/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<table class="layui-hide" id="demo" lay-filter="test"></table>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>



<%--<script src="/static/layui/layui.js" charset="utf-8"></script>--%>
<script>
  layui.config({
    version: '1575889601624' //为了更新 js 缓存，可忽略
  });

  layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
    var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,upload = layui.upload //上传
            ,element = layui.element //元素操作
            ,slider = layui.slider //滑块

    //向世界问个好
    // layer.msg('Hello World');

    //监听Tab切换
    element.on('tab(demo)', function(data){
      layer.tips('切换了 '+ data.index +'：'+ this.innerHTML, this, {
        tips: 1
      });
    });

    //执行一个 table 实例
    table.render({
      elem: '#demo'
      ,height: 620
      ,url: '/list' //数据接口
      ,title: '电脑表'
      ,page: true //开启分页
      ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
      ,totalRow: true //开启合计行
      ,cols: [[ //表头
        {type: 'checkbox', fixed: 'left'}
        ,{field: 'computerId', title: '机子号', width:80, sort: true, fixed: 'left', totalRowText: '合计：'}
        ,{field: 'computerName', title: '名字名称', width:80}
        ,{field: 'computerType', title: '机子型号', width: 90}
        ,{field: 'computerPrice', title: '机子价格', width:80, sort: true}
        ,{field: 'computerTime', title: '上网时间', width:150}
        ,{field: 'computerNid', title: '状态',templet:setComputerNid, width: 100}
        ,{field: 'computerSid', title: '消费', width: 100, sort: true, totalRow: true}
        ,{field: 'computerComment', title: '备注', width: 135}
        ,{field: 'computerMaintain',title: '维修',templet:setMaintain, width: 135}
        ,{field: 'computerImage', title: '图片',templet:'<div><img width="135" height="80" src="${pageContext.request.contextPath}../image/{{ d.computerImage}}"></div>', width: 135}
        ,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
      ]]
    });

   /* done:function sdf (res) {
      $('div[lay-id="BOMlist"]').find('.layui-table-cell').css('height', '100%')
    }*/
    $("body").on('click','.layui-table-body tr ',function () {
      console.log(this);
      var data_index=$(this).attr('data-index');//得到当前的tr的index
      console.log($(this).attr('data-index'));
      $(".layui-table-body tr").attr({"style":"background:#FFFFFF"});//其他tr恢复颜色
      $(".layui-table-body tr[data-index="+data_index+"]").attr({"style":"background:#EEEEEE"});//改变当前tr颜色

    });


      //设置上网状态
    function setComputerNid(data){
      var computerMaintain = data.computerMaintain;
      if(computerMaintain==1||computerMaintain=="1"){
        return "<span style='width:100px; color:green;'>上网中<a href='#'>让他下机</a></span>";
      }else{
        return "<span style='color:red;'>空机中</span>";
      }
    }

    //设置维修状态
    function setMaintain(data){
        var computerMaintain = data.computerMaintain;
      var computerMaintain = data.computerMaintain;
        if(computerMaintain==0||computerMaintain=="0"){
            return "<span style='color:green;'>正常</span>";
        }else{
          computerMaintain="不可上网";
            return "<span style='color:red;'>维修中</span>";
        }
    }


    //监听头工具栏事件
    table.on('toolbar(test)', function(obj){
      var checkStatus = table.checkStatus(obj.config.id)
              ,data = checkStatus.data//获取选中的数据

      switch(obj.event){
        case 'add':
          window.location.href="/insert";//你可以跟换里面的网址，以便成功后跳转
          break;
        case 'update':
          if(data.length === 0){
            layer.msg('请选择一行');
          } else if(data.length > 1){
            layer.msg('只能同时编辑一个');
          } else {
              var computerId = data.computerId;
              $.ajax({
                  url:'/update',
                  type:'get',
                  data:{'computerId':computerId},
                  success:function (result) {
                      if(result.code==500){
                          alert(result.message)
                      }else{
                          window.location.href="/update";//你可以跟换里面的网址，以便成功后跳转
                      }
                  }
              })
          }
          break;
        case 'delete':
          if(data.length === 0){
            layer.msg('请选择一行');
          } else {
            window.location.href="/delete";//你可以跟换里面的网址，以便成功后跳转
          }
          break;
      };
    });

    //监听行工具事件
    table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
      var data = obj.data //获得当前行数据
              ,layEvent = obj.event; //获得 lay-event 对应的值
      if(layEvent === 'detail'){
        layer.msg('查看操作');
      } else if(layEvent === 'del'){
        layer.confirm('真的删除行么', function(index){
          var computerId = data.computerId;
          var computerName = data.computerName;
          $.ajax({
            url:"/delete",
            type:'get',
            data:{'computerId':computerId,'computerName':computerName},
            success:function (result) {
              if(result.code==500){
                alert(result.message)
              }else{
                obj.del(); //删除对应行（tr）的DOM结构
                layer.close(index);
                //向服务端发送删除指令
              }
            }
          })
        });
      } else if(layEvent === 'edit'){
          var computerId = data.computerId;
          if (computerId!==null){
            window.location.replace("/update?computerId="+computerId);//你可以跟换里面的网址，以便成功后跳转
          }
          /*$.ajax({
              url:'/update',
              type:'get',
              data:{'computerId':computerId},
              success:function (result) {
                  if(result.code==500){
                      alert(result.message)
                  }else{
                    window.location.replace("/update?computerId=");//你可以跟换里面的网址，以便成功后跳转
                  }
              }
          })*/
      }
    });

    //执行一个轮播实例
    carousel.render({
      elem: '#test1'
      ,width: '100%' //设置容器宽度
      ,height: 200
      ,arrow: 'none' //不显示箭头
      ,anim: 'fade' //切换动画方式
    });

    //将日期直接嵌套在指定容器中
    var dateIns = laydate.render({
      elem: '#laydateDemo'
      ,position: 'static'
      ,calendar: true //是否开启公历重要节日
      ,mark: { //标记重要日子
        '0-10-14': '生日'
        ,'2018-08-28': '新版'
        ,'2018-10-08': '神秘'
      }
      ,done: function(value, date, endDate){
        if(date.year == 2017 && date.month == 11 && date.date == 30){
          dateIns.hint('一不小心就月底了呢');
        }
      }
      ,change: function(value, date, endDate){
        layer.msg(value)
      }
    });

    //分页
    laypage.render({
      elem: 'pageDemo' //分页容器的id
      ,count: 100 //总页数
      ,skin: '#1E9FFF' //自定义选中色值
      ,skip: true //开启跳页
      ,jump: function(obj, first){
        if(!first){
          layer.msg('第'+ obj.curr +'页', {offset: 'b'});
        }
      }
    });

    //上传
    upload.render({
      elem: '#uploadDemo'
      ,url: '' //上传接口
      ,done: function(res){
        console.log(res)
      }
    });

    //滑块
    var sliderInst = slider.render({
      elem: '#sliderDemo'
      ,input: true //输入框
    });


  });
</script>

</body>
</html>
