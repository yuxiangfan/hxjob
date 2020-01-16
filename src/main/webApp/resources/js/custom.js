

//后台右侧设置弹出
$('.sidebarRight-toggle').click(function()	{
    $('.sidebar-right').toggleClass('active');
    $('.wrapper').toggleClass('display-right');
    $('footer').toggleClass('display-right');
    return false;
});
//后台右侧相关产品弹出
$('.sidebarRight-toggle-product').click(function()	{
    $('.sidebar-right-product').toggleClass('active');
    $('.wrapper').toggleClass('display-right');
    $('footer').toggleClass('display-right');
    return false;
});

$('.nav-right-btn .dropdown-toggle ').click(function(){
        $('.sidebar-right-product').removeClass('active');
        $('.sidebar-right').removeClass('active');
        $('.wrapper').removeClass('display-right');
        $('footer').removeClass('display-right');

        /*if($('.nav-right-btn > li').hasClass('.open')){
            $('.nav-right-btn > li').removeClass('.open');

        }*/

}
)


/*
jQuery('#set-view').click(function(){

    var body = jQuery('body');
    var bodypos = body.css('position');

    if(bodypos != 'relative') {

        if(!body.hasClass('set-view')) {
            body.addClass('leftpanel-collapsed set-view');
            jQuery('.nav-bracket ul').attr('style','');

        } else {

            body.removeClass('set-view');

            if(!jQuery('.menutoggle').hasClass('menu-collapsed')) {
                jQuery('body').removeClass('leftpanel-collapsed');
                jQuery('.nav-bracket li.active ul').css({display: 'block'});
            } else {

            }
        }

    } else {

        if(!body.hasClass('chat-relative-view')) {

            body.addClass('chat-relative-view');
            body.css({left: ''});

        } else {
            body.removeClass('chat-relative-view');
        }
    }

})*/;






// Refresh Widget
$('.widget-refresh-option').click(function()	{

    $activeWidget = $(this).parent().parent().parent();

    var $activeSpinIcon = $activeWidget.find('.refresh-icon-animated').fadeIn();

    setTimeout(function() {
        $activeSpinIcon.fadeOut();
    },2000);

    return false;
});

$(window).load(function() {
    $('body').removeClass('overflow-hidden');

    //Enable animation
    $('.wrapper').removeClass('preload');

    //Chat Notification on top navigation
    setTimeout(function() {
        $('.chat-notification').find('.badge').addClass('active');
        $('.chat-alert').addClass('active');
    }, 3000);

    setTimeout(function() {
        $('.chat-alert').removeClass('active');
    }, 8000);
});


//右下角置顶
$(".scroll-to-top").click(function()	{
    $("html, body").animate({ scrollTop: 0 }, 600);
    return false;
});
$(window).scroll(function(){

    var position = $(window).scrollTop();

    if(position >= 200)	{
        $('.scroll-to-top').addClass('active')
    }
    else	{
        $('.scroll-to-top').removeClass('active')
    }
});


$(".service_box .tab_nav li").hover(function(){
    var i=$(this).index();
    $(this).addClass("active").siblings().removeClass("active");
    $(".service_box .tab_plan:eq("+i+")").show().siblings().hide();
});
$(function(){
    var t;
    $(".service_box").hover(function(){
        $(".service_box").animate({right:0},300)
        clearTimeout(t);
    },function(){
        t=setTimeout(function(e){
            $(".service_box").animate({right:"-146px"},300);
            $(".service_box").find(".tab_nav li").removeClass("active");
        },1000);
    });
});
var isTransition=true;
$(".m_logo").hover(function(){
    var r=0;
    if(isTransition){
        animateTime = setInterval(function(){
            if (r>=153){
                clearInterval(animateTime);
                isTransition=true;
            }else{
                isTransition=false;
                r++;
                $(".m_logo a").attr("style","-webkit-mask:-webkit-gradient(radial, 45 25, "+r+", 45 25, "+(r+15)+", from(rgb(0, 0, 0)), color-stop(0.5, rgba(0, 0, 0, 0.2)), to(rgb(0, 0, 0)));")
            };
        },5);
    }
},function(){
    return;
});




