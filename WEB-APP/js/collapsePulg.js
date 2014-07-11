//一个导航卡打开后，其余的关闭
$(".collapse").on('show', function (){
    $(this).siblings(".collapse").siblings(".in").collapse('hide');
});