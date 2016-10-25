$(function(){

    //下拉菜单处理
    var profile = $("#profile");
    var downMenu = $("#down-menu");

    profile.mouseover(function(){
        downMenu.show();
        $(this).css("background-color","#333");
    }).mouseout(function(){
        downMenu.hide();
        $(this).css("background-color","#3d444c");
    });

    downMenu.mouseover(function(){
        downMenu.show();
    }).mouseout(function(){
        downMenu.hide();
    });


});
