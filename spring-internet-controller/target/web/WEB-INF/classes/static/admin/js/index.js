layui.use(['element', 'jquery', 'layer'], function () {
    var element = layui.element;
    var layer = layui.layer;
    var $ = layui.jquery;
    //菜单按钮
    $('.subMenu').on('click', function () {
        var tabTitle = $(this).text();
        var tabId = $(this).prop("id");
        var pageUrl = $(this).children('a').data('url');
        if($('.layui-tab-title li[lay-id="'+tabId+'"]').length == 0){
            element.tabAdd('demo', {
                title: tabTitle,
                content: '<iframe src="' + pageUrl + '" class="layadmin-iframe" frameborder="no" border="0" allowtransparency="yes"></iframe>',
                id: tabId
            });
        }
        element.tabChange('demo', tabId);
    });
});