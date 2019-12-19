<%--
  Created by IntelliJ IDEA.
  User: 野心
  Date: 2019/12/16
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css"  media="all">
</head>
<body>
<%--<form method="post" enctype="multipart/form-data" class="layui-form" action="/insertUsersDo">--%>
<form method="post" enctype="multipart/form-data" class="layui-form" action="/insertAdminDo">
    <div class="layui-form-item">
        <label class="layui-form-label">添加头像</label>
        <a class="file">选择文件
            <input type="file" name="myfile" id="">
        </a>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="adminUsername" lay-verify="title" autocomplete="off" placeholder="请输入用户名" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="adminPassword" lay-verify="title" autocomplete="off" placeholder="请输入密码" class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="adminName" lay-verify="title" autocomplete="off" placeholder="请输入姓名" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">身份证</label>
        <div class="layui-input-block">
            <input type="text" name="adminIdCard" lay-verify="identity"  placeholder="请输入身份证" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">年龄</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="adminAge" lay-verify="title" autocomplete="off" placeholder="年龄" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item" pane="">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="adminSex" value="男" title="男" checked="">
            <input type="radio" name="adminSex" value="女" title="女">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="adminAddress" lay-verify="title" autocomplete="off" placeholder="请输入地址" class="layui-input">
        </div>
    </div>

    <div class="layui-inline">
        <label class="layui-form-label">电话号码</label>
        <div class="layui-input-inline">
            <input type="tel" name="adminPhone" lay-verify="required|phone" placeholder="请输入地址" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">名族</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="adminNation" lay-verify="title" autocomplete="off" placeholder="请输入民族" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="adminRemark" lay-verify="title" autocomplete="off" placeholder="请输入地址" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">权限</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="adminEnabled" lay-verify="title" autocomplete="off" placeholder="权限" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <input type="submit" class="layui-btn" value="添加">
        <a href="/listAdmin"><input type="button" class="layui-btn" value="取消"></a>
    </div>

</form>

<script src="/static/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });

        //表单赋值
        layui.$('#LAY-component-form-setval').on('click', function(){
            form.val('example', {
                "username": "贤心" // "name": "value"
                ,"password": "123456"
                ,"interest": 1
                ,"like[write]": true //复选框选中状态
                ,"close": true //开关状态
                ,"sex": "女"
                ,"desc": "我爱 layui"
            });
        });

        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>

</body>
</html>
