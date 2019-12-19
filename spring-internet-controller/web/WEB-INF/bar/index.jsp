<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>

	<!-- Title -->
	<title>野心网咖主页</title>
	<link rel="stylesheet" href="/static/bar/css/table.css">
	<!-- Meta tags -->
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="keywords" content="野心网吧主页" />
	<meta name="description" content="野心网吧主页" />
	<!-- Stylesheets -->
	<link rel="stylesheet" type="text/css" media="screen, projection" href="/static/bar/css/screen.css" />
	<link rel="stylesheet" href="/static/bar/css/prettyPhoto.css" type="text/css" media="screen" charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="/static/bar/css/vtip.css" />

	<!--layui-->
	<link rel="stylesheet" href="/static/layui/css/layui.css"  media="all">
	<script src="/static/layui/layui.js?t=1575889601627"></script>
	<link rel="stylesheet" href="/static/layui/css/layui.css?t=1575889601627" media="all">
	<style>
		body{margin: 10px;}
		.demo-carousel{height: 200px; line-height: 200px; text-align: center;}
	</style>

	<!-- Scripts -->
	<script language="javascript" type="text/javascript" src="/static/bar/js/jquery.js"></script>
	<script language="javascript" type="text/javascript" src="/static/bar/js/jquery.form.js"></script>
	<script language="javascript" type="text/javascript" src="/static/bar/js/cufon-yui.js"></script>
	<script language="javascript" type="text/javascript" src="/static/bar/js/Museo_Sans_500_400-Museo_700_600.font.js"></script>
	<script language="javascript" type="text/javascript" src="/static/bar/js/scripts.js"></script>
	<script language="javascript" type="text/javascript" src="/static/bar/js/vtip.js"></script>
	<script src="/static/bar/js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>

	<!--[if IE 6]>
	<script language="javascript" type="text/javascript" src="/static/bar/js/DD_belatedPNG.js"></script>

	<link rel="stylesheet" type="text/css" media="screen, projection" href="/static/bar/css/ie6.css" />
	<![endif]-->

	<script type="text/javascript">
		Cufon.replace('h2');
	</script>

	<style type="text/css">
		<!--
		.STYLE1 {
			font-family: "宋体";
			font-size: 12px;
		}
		-->
	</style>
</head>

<body>

<div id="container">

	<div id="header" class="group">

		<h1 id="logo">Hein Maas</h1>

		<div id="vcard">
			<a href="/adminLogin" title="进入后台管理" class="vtip"></a>
		</div><!-- /vcard -->

	</div><!-- /header -->

	<div id="nav" class="group">
		<ul>
			<li><a href="#about" title="About" class="STYLE1">网吧简介</a></li>
			<li><a href="#social" title="Link">网吧机子</a></li>
			<li><a href="#work" title="case">小卖部</a></li>
			<li><a href="#contact" title="Contact">联系方式</a></li>
		</ul>
	</div><!-- /nav -->

	<div id="main">

		<div id="about" class="panel group">

			<h2>About Me</h2>
			<div class="content-top"></div>
			<div class="content">
				<p>欢迎来到野心网咖，本网咖将带给你最好的服务。</p>
				<p>&nbsp;</p>
				<p>网吧简单：300多台全液晶22寸宽屏显示器，千兆光纤接入,适合玩大型网络游戏。上百款热门网络游戏应有尽有，聊天工具齐全，机器配置高、性能稳定，服务周到，深受广大网友和电脑游戏玩家的青睐。我们以一流的设备、一流的服务，热情欢迎广大网友前来光顾。你的满意就是我们网吧的追求。 <br />
				</p>
				<p>本网吧目前的上网价格是，会员价格为3.5元每小时，普通用户为4.5每小时</p>
				<p>
					<div class="layui-carousel" id="test1">
							<div carousel-item>
								<div><p class="layui-bg-green demo-carousel"><img width="440" height="200" src="/static/bar/img/m1.jpg"></p></div>
							<div><p class="layui-bg-red demo-carousel"><img width="440" height="200" src="/static/bar/img/m2.jpg"></p></div>
							<div><p class="layui-bg-blue demo-carousel"><img width="440" height="200" src="/static/bar/img/m3.jpg"></p></div>
							<div><p class="layui-bg-orange demo-carousel"><img width="440" height="200" src="/static/bar/img/m4.jpg"></p></div>
							<div><p class="layui-bg-cyan demo-carousel"><img width="440" height="200" src="/static/bar/img/m5.jpg"></p></div>
						</div>
					</div>
				</p>
			</div><!-- /content -->
			<div class="content-bottom"></div>

		</div><!-- /about -->

		<!--网吧机子-->
		<div id="social" class="panel group">

			<h2>Movie Link</h2>
			<table summary="user infomation table">
				<thead>
				<tr>
					<th style="color: #0a0a0a">机子号</th>
					<th style="color: #0a0a0a">名字名称</th>
					<th style="color: #0a0a0a">机子型号</th>
					<th style="color: #0a0a0a">状态</th>
					<th style="color: #0a0a0a">操作</th>
				</tr>
				</thead>

				<tbody>
				<c:forEach items="${pageInfo.list}" var="computer">
					<tr>
						<td>${computer.computerId}</td>
						<td>${computer.computerName}</td>
						<td>${computer.computerType}</td>
						<td>
							<c:choose>
								<c:when test="${computer.computerNid==0}">
									<span style="color: #00FF00">无人上网</span>
								</c:when>
								<c:otherwise>
									<span style="color: red">有人正在上网</span>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${computer.computerNid==0}">
									<a href="#"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">上网</button></a>
								</c:when>
								<c:otherwise>
									<a href="#"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">下机</button></a>
								</c:otherwise>

							</c:choose>
						</td>
					</tr>
				</c:forEach>
				</tbody>

			</table>
			<div style="margin-left:auto;text-align: center">
				<a href="/?pageNum=1&pageSize=${pageInfo.pageSize}&#social"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">刷新</button></a>
				<a href="/?pageNum=1&pageSize=${pageInfo.pageSize}&#social"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">首页</button></a>
				<a href="/?pageNum=${pageInfo.prePage}&pageSize=${pageInfo.pageSize}&#social"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">上一页</button></a>
				<a href="/?pageNum=${pageInfo.nextPage}&pageSize=${pageInfo.pageSize}&#social"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">下一页</button></a>
				<a href="/?pageNum=${pageInfo.pages}&pageSize=${pageInfo.pageSize}&#social"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">尾页</button></a>
			</div>
		</div><!-- /social -->

		<div id="work" class="panel group">

			<h2>Netbar Shop </h2>
			<div class="content-top"></div>
			<div class="content">

				<p>网吧购物系统. 界面友好,操作易上手,物品显示带图片，如果需要购买，请联系网管，或者到吧台购买。</p>
				<a href="/productClassify?type=0&#work"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">辣条</button></a>
				<a href="/productClassify?type=1&#work"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">汽水/水</button></a>
				<a href="/productClassify?type=2&#work"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">烟</button></a>
				<a href="/productClassify?type=3&#work"><button type="button" class="layui-btn layui-btn-primary layui-btn-sm">泡面</button></a>
				<p>
					<c:forEach items="${product}" var="product">
						<a href="/static/image/${product.productImage}" rel="prettyPhoto[gallery]" title="${product.productName}：${product.productPrice}元"><img src="/static/image/${product.productImage}" width="60" height="60" alt="${product.productName}" /></a>
					</c:forEach>
				</p>
				<%--<!-- /1st row --><p>
				<a href="/static/bar/img/work/1.1.jpg" rel="prettyPhoto[gallery]" title="可口可乐（灌装）：3.0元/罐"><img src="/static/bar/img/work/1.jpg" width="60" height="60" alt="可口可乐（灌装）" /></a>

				<a href="http://www.youtube.com/watch?v=OYk594Hhka0" rel="prettyPhoto" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="VideoHive" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="GraphicRiver" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="FlashDen" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="AudioJungle" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="FlashDen" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="Vectortuts" /></a>
				<!-- /End 1st row --></p>

				<!-- /2nd row --><p>
				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="ThemeForest" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="VideoHive" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="GraphicRiver" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="FlashDen" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="AudioJungle" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="FlashDen" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="Vectortuts" /></a>
				<!-- /End 2nd row --></p>

				<!-- /3th row --><p>
				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="ThemeForest" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="VideoHive" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="GraphicRiver" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="FlashDen" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="AudioJungle" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="FlashDen" /></a>

				<a href="img/work/1_B.png" rel="prettyPhoto[gallery]" title="相关文字介绍，待添加……."><img src="/static/bar/img/work/1_S.png" width="60" height="60" alt="Vectortuts" /></a>
				<!-- /End 3th row --></p>--%>

				<p>长期驻足于网吧服务领域，您的需要，我们最理解！</p>

			</div><!-- /content -->
			<div class="content-bottom"></div>

		</div><!-- /work -->

		<div id="contact" class="panel group">

			<h2>Contact</h2>
			<div class="content-top"></div>
			<div class="content">
				<form id="contactform" method="post" action="submitemail.php">
					<fieldset>
						<form action="" method="post">
							您的联系方式
							<input type="text" name="phone" id="name" onfocus="if(this.value=='Name')this.value='';" onblur="if(this.value=='')this.value='Name';" value="手机：138********" />

							您的姓名
							<input type="text"  name="name"/>

							请留言
							<input type="text"  name="subject" id="subject"/>


							<input type="button" name="submit" id="submit" value="点击提交" />
						</form>
						<div id="error"><a href="#" target="_blank">野心网咖，你的满意就是我们网吧的追求。</a></div>


					</fieldset>

				</form>
			</div><!-- /content -->
			<div class="content-bottom"></div>

		</div><!-- /contact -->

	</div><!-- /main -->

	<div id="footer"></div><!-- /footer -->


</div><!-- /container -->

</body>
<script>
	layui.config({
		version: '1575889601627' //为了更新 js 缓存，可忽略
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



		//执行一个轮播实例
		carousel.render({
			elem: '#test1'
			,width: '100%' //设置容器宽度
			,height: 200
			,arrow: 'none' //不显示箭头
			,anim: 'fade' //切换动画方式
		});


	});
</script>

</html>