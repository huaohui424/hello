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
    <title>User修改</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css"  media="all">
</head>
<body>
<form method="post" class="layui-form" action="/amendUsers">
    <div class="layui-form-item">
        <label class="layui-form-label">客户姓名</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="usersName" lay-verify="title" autocomplete="off" value="${users.usersName}" class="layui-input">
        </div>
    </div>

    <div class="layui-inline">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-inline">
            <input type="tel" name="usersCall" lay-verify="required|phone" value="${users.usersCall}" autocomplete="off" class="layui-input">
        </div>
    </div>

   <%-- <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="usersCall" lay-verify="title" autocomplete="off" value="${users.usersCall}" class="layui-input">
        </div>
    </div>--%>

    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="usersAddress" lay-verify="title" autocomplete="off" value="${users.usersAddress}" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">身份证</label>
        <div class="layui-input-block">
            <input type="text" name="usersIdCard" lay-verify="identity" value="${users.usersIdCard}" autocomplete="off" class="layui-input">
        </div>
    </div>

 <%--   <div class="layui-form-item">
        <label class="layui-form-label">身份证</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="usersIdCard" lay-verify="title" autocomplete="off" value="${users.usersIdCard}" class="layui-input">
        </div>
    </div>--%>

    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="usersPassword" lay-verify="title" autocomplete="off" value="${users.usersPassword}" class="layui-input">
        </div>
    </div>


    <div class="layui-form-item" pane="">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="usersSex" value="男" title="男" checked="">
            <input type="radio" name="usersSex" value="女" title="女">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">年    龄</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="usersAge" lay-verify="title" autocomplete="off" value="${users.usersAge}" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item" pane="">
        <label class="layui-form-label">是否成为会员</label>
        <div class="layui-input-block">
            <input type="radio" name="usersMenBer" value="1" title="是" checked="">
            <input type="radio" name="usersMenBer" value="0" title="否">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">余    额</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="usersAge" lay-verify="title" autocomplete="off" value="${users.usersBalance}" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <input hidden="hidden" name="usersId" value="${users.usersId}">
        <input type="submit" class="layui-btn" value="修改">
        <a href="/listUsers"><input type="button" class="layui-btn" value="取消"></a>
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
