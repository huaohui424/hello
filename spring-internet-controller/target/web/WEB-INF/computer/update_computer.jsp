<%--
  Created by IntelliJ IDEA.
  User: 野心
  Date: 2019/12/12
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css"  media="all">
</head>
<body>
    <form method="post" class="layui-form" action="/amend">
    <div class="layui-form-item">
        <label class="layui-form-label">机子号</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="Id" lay-verify="title" autocomplete="off" value="${computer.computerId}" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">机子名称</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="Name" lay-verify="title" autocomplete="off" value="${computer.computerName}" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">机子型号</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="Type" lay-verify="title" autocomplete="off" value="${computer.computerType}" class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">机子价格</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="Price" lay-verify="title" autocomplete="off" value="${computer.computerPrice}" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">数    量</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="Count" lay-verify="title" autocomplete="off" value="${computer.computerCount}" class="layui-input">
        </div>
    </div>

        <div class="layui-form-item">
            <label class="layui-form-label">开关-默认开</label>
            <div class="layui-input-block">
                <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
            </div>
        </div>

    <div class="layui-form-item">
        <label class="layui-form-label">备    注</label>
        <div class="layui-input-block">
            <input type="text" width="100" name="Comment" lay-verify="title" autocomplete="off" value="${computer.computerComment}" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item" pane="">
        <label class="layui-form-label">开关-开</label>
        <div class="layui-input-block">
            <div class="layui-form-item" pane="">
                <label class="layui-form-label">开关-开</label>
                <div class="layui-input-block">
                    <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" title="开关">
                </div>
            </div>
        </div>
    </div>

    <div class="layui-form-item" pane="">
        <label class="layui-form-label">单选框</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男" checked="">
            <input type="radio" name="sex" value="女" title="女">
            <input type="radio" name="sex" value="禁" title="禁用" disabled="">
        </div>
    </div>

    <div class="layui-form-item">
        <a href="/computer"><input type="button" class="layui-btn" value="返回"></a>
        <input type="submit" class="layui-btn" value="修改">
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
