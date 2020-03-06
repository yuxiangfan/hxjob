

$(function () {
    //载入首页
    if ($("#container").hasClass("index")) {
        if (window.location.hash === "" || window.location.hash === "#home") {
            $.ajax({
                url: "head_home.jsp",
                cache: false,
                success: function (html) {
                    $("#container").append(html);
                    home();
                }
            });
            //横幅
            $(".banner").css({"display": "block"});
            //按钮
            $(".header nav a").removeClass("select").eq(0).addClass("select");
        } else {
            judgeHash();
            $(".banner").css({"display": "none"});
        }
    }
    //nav导航条按钮监控
    $(".header nav a").click(function () {
        // 首页横幅搜索栏显示隐藏监控
        if ($(this).hasClass("home")) {
            $(".banner").css({"display": "block"});
        } else {
            $(".banner").css({"display": "none"});
        }
    });
    //监听导航栏按钮
    window.addEventListener('hashchange', function () {
        judgeHash();
    });

    //判断hash值,跳转页面方法
    function judgeHash() {
        var hash = document.location.hash;
        switch (hash) {
            case '#home' :
                $.ajax({
                    url: "head_home.jsp",
                    cache: false,
                    success: function (html) {
                        $("#container").empty().append(html);
                        home();
                    }
                });
                $(".header nav a").removeClass("select").eq(0).addClass("select");
                break;
            case '#job' :
                $.ajax({
                    url: "head_job.jsp",
                    cache: false,
                    success: function (html) {
                        $("#container").empty().append(html);
                        job();
                    }
                });
                $(".header nav a").removeClass("select").eq(1).addClass("select");
                break;
            case '#company' :
                $.ajax({
                    url: "head_company.jsp",
                    cache: false,
                    success: function (html) {
                        $("#container").empty().append(html);
                        company();
                    }
                });
                $(".header nav a").removeClass("select").eq(2).addClass("select");
                break;
            case '#good' :
                $.ajax({
                    url: "head_good.jsp",
                    cache: false,
                    success: function (html) {
                        $("#container").empty().append(html);
                        good();
                    }
                });
                $(".header nav a").removeClass("select").eq(3).addClass("select");
                break;
            case '#test' :
                $.ajax({
                    url: "head_test.jsp",
                    cache: false,
                    success: function (html) {
                        $("#container").empty().append(html);
                        test();
                    }
                });
                $(".header nav a").removeClass("select").eq(4).addClass("select");
                break;
            case '#day' :
                $.ajax({
                    url: "head_day.jsp",
                    cache: false,
                    success: function (html) {
                        $("#container").empty().append(html);
                        day();
                    }
                });
                $(".header nav a").removeClass("select").eq(5).addClass("select");
                break;
            default :
                break;
        }
    }

    //1.home页js
    function home() {
        var dp = 880;
        var ind = 1;
        // <!--热门岗位字段收缩-->
        $(document).ready(function () {
            contenta = $(".p_sm").text();
            stra = contenta.substr(0, 60);
            $(".p_sm").text(stra + "......");
        })
        $(document).ready(function () {
            contenta = $(".p_sn_a").text();
            stra = contenta.substr(0, 60);
            $(".p_sn_a").text(stra + "......");
        })

        $(document).ready(function () {
            contenta = $(".p_an_a").text();
            stra = contenta.substr(0, 70);
            $(".p_an_a").text(stra + "......");
            $(".p_zk").click(function () {
                if (ind == 1) {
                    $(".p_an_a").text(contenta);
                    $(".p_zk").text("收缩");
                    ind = 2;
                } else {
                    $(".p_an_a").text(stra);
                    $(".p_zk").text("展开");
                    ind = 1;
                }
            })
        })
        $(document).ready(function () {
            contenta = $(".p_an_b").text();
            stra = contenta.substr(0, 70);
            $(".p_an_b").text(stra + "......");
            $(".p_zk_b").click(function () {
                if (ind == 1) {
                    $(".p_an_b").text(contenta);
                    $(".p_zk_b").text("收缩");
                    $("")
                    ind = 2;
                } else {
                    $(".p_an_b").text(stra);
                    $(".p_zk_b").text("展开");
                    ind = 1;
                }
            })
        })
        $(document).ready(function () {
            contenta = $(".p_an_c").text();
            stra = contenta.substr(0, 70);
            $(".p_an_c").text(stra + "......");
            $(".p_zk_c").click(function () {
                if (ind == 1) {
                    $(".p_an_c").text(contenta);
                    $(".p_zk_c").text("收缩");
                    $("")
                    ind = 2;
                } else {
                    $(".p_an_c").text(stra);
                    $(".p_zk_c").text("展开");
                    ind = 1;
                }
            })
        })

        // 点评按钮实现
        $(document).ready(function () {
            $(".a_li_dp").click(function () {
                $(this).text("点评(" + (dp + 1) + ")");
            })
        })

        // 赞按钮实现
        $(document).ready(function () {
            $(".a_li_z").click(function () {
                $(this).text("赞(" + (dp + 1) + ")");
            })
        })

        // 收藏按钮实现
        $(document).ready(function () {
            $(".a_li_sc").click(function () {
                $(this).text("收藏(" + (dp + 1) + ")");
            })
        })


    }

    //2.job页js
    function job() {
        var x = 1;
        //监控招聘页全部热度筛选按钮
        $(".a_0").click(function () {
            $(this).css("color", "#fb8341");
            $(".a_1").css("color", "#000000");
            $(".a_2").css("color", "#000000");
            $(".a_3").css("color", "#000000");
        })
        $(".a_1").click(function () {
            $(this).css("color", "#fb8341");
            $(".a_0").css("color", "#000000");
            $(".a_2").css("color", "#000000");
            $(".a_3").css("color", "#000000");
        })
        $(".a_2").click(function () {
            $(this).css("color", "#fb8341");
            $(".a_0").css("color", "#000000");
            $(".a_1").css("color", "#000000");
            $(".a_3").css("color", "#000000");
        })
        $(".a_3").click(function () {
            $(this).css("color", "#fb8341");
            $(".a_0").css("color", "#000000");
            $(".a_1").css("color", "#000000");
            $(".a_2").css("color", "#000000");
        })
        $(".b_0").click(function () {
            $(this).css("color", "#fb8341");
            $(".b_1").css("color", "#000000");
            $(".b_2").css("color", "#000000");
            $(".b_3").css("color", "#000000");
            $(".b_4").css("color", "#000000");
            $(".b_5").css("color", "#000000");
            $(".b_6").css("color", "#000000");
            $(".b_7").css("color", "#000000");
        })
        $(".b_1").click(function () {
            $(this).css("color", "#fb8341");
            $(".b_0").css("color", "#000000");
            $(".b_2").css("color", "#000000");
            $(".b_3").css("color", "#000000");
            $(".b_4").css("color", "#000000");
            $(".b_5").css("color", "#000000");
            $(".b_6").css("color", "#000000");
            $(".b_7").css("color", "#000000");
        })
        $(".b_2").click(function () {
            $(this).css("color", "#fb8341");
            $(".b_0").css("color", "#000000");
            $(".b_1").css("color", "#000000");
            $(".b_3").css("color", "#000000");
            $(".b_4").css("color", "#000000");
            $(".b_5").css("color", "#000000");
            $(".b_6").css("color", "#000000");
            $(".b_7").css("color", "#000000");
        })
        $(".b_3").click(function () {
            $(this).css("color", "#fb8341");
            $(".b_0").css("color", "#000000");
            $(".b_1").css("color", "#000000");
            $(".b_2").css("color", "#000000");
            $(".b_4").css("color", "#000000");
            $(".b_5").css("color", "#000000");
            $(".b_6").css("color", "#000000");
            $(".b_7").css("color", "#000000");
        })
        $(".b_4").click(function () {
            $(this).css("color", "#fb8341");
            $(".b_0").css("color", "#000000");
            $(".b_1").css("color", "#000000");
            $(".b_2").css("color", "#000000");
            $(".b_3").css("color", "#000000");
            $(".b_5").css("color", "#000000");
            $(".b_6").css("color", "#000000");
            $(".b_7").css("color", "#000000");
        })
        $(".b_5").click(function () {
            $(this).css("color", "#fb8341");
            $(".b_0").css("color", "#000000");
            $(".b_1").css("color", "#000000");
            $(".b_2").css("color", "#000000");
            $(".b_3").css("color", "#000000");
            $(".b_4").css("color", "#000000");
            $(".b_6").css("color", "#000000");
            $(".b_7").css("color", "#000000");
        })
        $(".b_6").click(function () {
            $(this).css("color", "#fb8341");
            $(".b_0").css("color", "#000000");
            $(".b_1").css("color", "#000000");
            $(".b_2").css("color", "#000000");
            $(".b_3").css("color", "#000000");
            $(".b_4").css("color", "#000000");
            $(".b_5").css("color", "#000000");
            $(".b_7").css("color", "#000000");
        })
        $(".b_7").click(function () {
            $(this).css("color", "#fb8341");
            $(".b_0").css("color", "#000000");
            $(".b_1").css("color", "#000000");
            $(".b_2").css("color", "#000000");
            $(".b_3").css("color", "#000000");
            $(".b_4").css("color", "#000000");
            $(".b_5").css("color", "#000000");
            $(".b_6").css("color", "#000000");
        })


        $(".c_0").click(function () {
            $(this).css("color", "#fb8341");
            $(".c_1").css("color", "#000000");
            $(".c_2").css("color", "#000000");
            $(".c_3").css("color", "#000000");
            $(".c_4").css("color", "#000000");
            $(".c_5").css("color", "#000000");
        })
        $(".c_1").click(function () {
            $(this).css("color", "#fb8341");
            $(".c_0").css("color", "#000000");
            $(".c_2").css("color", "#000000");
            $(".c_3").css("color", "#000000");
            $(".c_4").css("color", "#000000");
            $(".c_5").css("color", "#000000");
        })
        $(".c_2").click(function () {
            $(this).css("color", "#fb8341");
            $(".c_0").css("color", "#000000");
            $(".c_1").css("color", "#000000");
            $(".c_3").css("color", "#000000");
            $(".c_4").css("color", "#000000");
            $(".c_5").css("color", "#000000");
        })
        $(".c_3").click(function () {
            $(this).css("color", "#fb8341");
            $(".c_0").css("color", "#000000");
            $(".c_1").css("color", "#000000");
            $(".c_2").css("color", "#000000");
            $(".c_4").css("color", "#000000");
            $(".c_5").css("color", "#000000");
        })
        $(".c_4").click(function () {
            $(this).css("color", "#fb8341");
            $(".c_0").css("color", "#000000");
            $(".c_1").css("color", "#000000");
            $(".c_2").css("color", "#000000");
            $(".c_3").css("color", "#000000");
            $(".c_5").css("color", "#000000");
        })
        $(".c_5").click(function () {
            $(this).css("color", "#fb8341");
            $(".c_0").css("color", "#000000");
            $(".c_1").css("color", "#000000");
            $(".c_2").css("color", "#000000");
            $(".c_3").css("color", "#000000");
            $(".c_4").css("color", "#000000");
        })

        // <!--热门岗位字段收缩-->
        $(document).ready(function () {
            contenta = $(".p_sm").text();
            stra = contenta.substr(0, 60);
            $(".p_sm").text(stra + "......");
        })
        $(document).ready(function () {
            contenta = $(".p_sn_a").text();
            stra = contenta.substr(0, 60);
            $(".p_sn_a").text(stra + "......");
        })
        // 点评按钮实现
        $(document).ready(function () {
            $(".a_li_dp").click(function () {
                $(this).text("点评(" + (dp + 1) + ")");
            })
        })

        // 赞按钮实现
        $(document).ready(function () {
            $(".a_li_z").click(function () {
                $(this).text("赞(" + (dp + 1) + ")");
            })
        })

        // 收藏按钮实现
        $(document).ready(function () {
            $(".a_li_sc").click(function () {
                $(this).text("收藏(" + (dp + 1) + ")");
            })
        })


    }


    //3.company页js
    function company() {


        $(".a_0").click(function () {
            $(this).css("color", "#fb8341");
            $(".a_1").css("color", "#000000");
            $(".a_2").css("color", "#000000");
            $(".a_3").css("color", "#000000");
            $(".a_4").css("color", "#000000");
            $(".a_5").css("color", "#000000");
            $(".a_6").css("color", "#000000");
        })
        $(".a_1").click(function () {
            $(this).css("color", "#fb8341");
            $(".a_0").css("color", "#000000");
            $(".a_2").css("color", "#000000");
            $(".a_3").css("color", "#000000");
            $(".a_4").css("color", "#000000");
            $(".a_5").css("color", "#000000");
            $(".a_6").css("color", "#000000");
        })
        $(".a_2").click(function () {
            $(this).css("color", "#fb8341");
            $(".a_0").css("color", "#000000");
            $(".a_1").css("color", "#000000");
            $(".a_3").css("color", "#000000");
            $(".a_4").css("color", "#000000");
            $(".a_5").css("color", "#000000");
            $(".a_6").css("color", "#000000");
        })
        $(".a_3").click(function () {
            $(this).css("color", "#fb8341");
            $(".a_0").css("color", "#000000");
            $(".a_1").css("color", "#000000");
            $(".a_2").css("color", "#000000");
            $(".a_4").css("color", "#000000");
            $(".a_5").css("color", "#000000");
            $(".a_6").css("color", "#000000");
        })
        $(".a_4").click(function () {
            $(this).css("color", "#fb8341");
            $(".a_0").css("color", "#000000");
            $(".a_1").css("color", "#000000");
            $(".a_2").css("color", "#000000");
            $(".a_3").css("color", "#000000");
            $(".a_5").css("color", "#000000");
            $(".a_6").css("color", "#000000");
        })
        $(".a_5").click(function () {
            $(this).css("color", "#fb8341");
            $(".a_0").css("color", "#000000");
            $(".a_1").css("color", "#000000");
            $(".a_2").css("color", "#000000");
            $(".a_3").css("color", "#000000");
            $(".a_4").css("color", "#000000");
            $(".a_6").css("color", "#000000");
        })
        $(".a_6").click(function () {
            $(this).css("color", "#fb8341");
            $(".a_0").css("color", "#000000");
            $(".a_1").css("color", "#000000");
            $(".a_2").css("color", "#000000");
            $(".a_3").css("color", "#000000");
            $(".a_4").css("color", "#000000");
            $(".a_5").css("color", "#000000");
        })
        $(".b_0").click(function () {
            $(this).css("color", "#fb8341");
            $(".b_1").css("color", "#000000");
            $(".b_2").css("color", "#000000");
            $(".b_3").css("color", "#000000");
            $(".b_4").css("color", "#000000");
        })
        $(".b_1").click(function () {
            $(this).css("color", "#fb8341");
            $(".b_0").css("color", "#000000");
            $(".b_2").css("color", "#000000");
            $(".b_3").css("color", "#000000");
            $(".b_4").css("color", "#000000");
        })
        $(".b_2").click(function () {
            $(this).css("color", "#fb8341");
            $(".b_0").css("color", "#000000");
            $(".b_1").css("color", "#000000");
            $(".b_3").css("color", "#000000");
            $(".b_4").css("color", "#000000");
        })
        $(".b_3").click(function () {
            $(this).css("color", "#fb8341");
            $(".b_0").css("color", "#000000");
            $(".b_1").css("color", "#000000");
            $(".b_2").css("color", "#000000");
            $(".b_4").css("color", "#000000");
        })
        $(".b_4").click(function () {
            $(this).css("color", "#fb8341");
            $(".b_0").css("color", "#000000");
            $(".b_1").css("color", "#000000");
            $(".b_2").css("color", "#000000");
            $(".b_3").css("color", "#000000");
        })


        var dp = 880;
        var ind = 1;
        // <!--热门岗位字段收缩-->
        $(document).ready(function () {
            contenta = $(".p_sm").text();
            stra = contenta.substr(0, 60);
            $(".p_sm").text(stra + "......");
        })
        $(document).ready(function () {
            contenta = $(".p_sn_a").text();
            stra = contenta.substr(0, 60);
            $(".p_sn_a").text(stra + "......");
        })

        $(document).ready(function () {
            contenta = $(".p_an_a").text();
            stra = contenta.substr(0, 70);
            $(".p_an_a").text(stra + "......");
            $(".p_zk").click(function () {
                if (ind == 1) {
                    $(".p_an_a").text(contenta);
                    $(".p_zk").text("收缩");
                    ind = 2;
                } else {
                    $(".p_an_a").text(stra);
                    $(".p_zk").text("展开");
                    ind = 1;
                }
            })
        })
        $(document).ready(function () {
            contenta = $(".p_an_b").text();
            stra = contenta.substr(0, 70);
            $(".p_an_b").text(stra + "......");
            $(".p_zk_b").click(function () {
                if (ind == 1) {
                    $(".p_an_b").text(contenta);
                    $(".p_zk_b").text("收缩");
                    $("")
                    ind = 2;
                } else {
                    $(".p_an_b").text(stra);
                    $(".p_zk_b").text("展开");
                    ind = 1;
                }
            })
        })
        $(document).ready(function () {
            contenta = $(".p_an_c").text();
            stra = contenta.substr(0, 70);
            $(".p_an_c").text(stra + "......");
            $(".p_zk_c").click(function () {
                if (ind == 1) {
                    $(".p_an_c").text(contenta);
                    $(".p_zk_c").text("收缩");
                    $("")
                    ind = 2;
                } else {
                    $(".p_an_c").text(stra);
                    $(".p_zk_c").text("展开");
                    ind = 1;
                }
            })
        })
        $(document).ready(function () {
            contenta = $(".p_an_d").text();
            stra = contenta.substr(0, 70);
            $(".p_an_d").text(stra + "......");
            $(".p_zk_d").click(function () {
                if (ind == 1) {
                    $(".p_an_d").text(contenta);
                    $(".p_zk_d").text("收缩");
                    $("")
                    ind = 2;
                } else {
                    $(".p_an_d").text(stra);
                    $(".p_zk_d").text("展开");
                    ind = 1;
                }
            })
        })
        $(document).ready(function () {
            contenta = $(".p_an_e").text();
            stra = contenta.substr(0, 70);
            $(".p_an_e").text(stra + "......");
            $(".p_zk_e").click(function () {
                if (ind == 1) {
                    $(".p_an_e").text(contenta);
                    $(".p_zk_e").text("收缩");
                    $("")
                    ind = 2;
                } else {
                    $(".p_an_e").text(stra);
                    $(".p_zk_e").text("展开");
                    ind = 1;
                }
            })
        })
        // 点评按钮实现
        $(document).ready(function () {
            $(".a_li_dp").click(function () {
                $(this).text("点评(" + (dp + 1) + ")");
            })
        })

        // 赞按钮实现
        $(document).ready(function () {
            $(".a_li_z").click(function () {
                $(this).text("赞(" + (dp + 1) + ")");
            })
        })

        // 收藏按钮实现
        $(document).ready(function () {
            $(".a_li_sc").click(function () {
                $(this).text("收藏(" + (dp + 1) + ")");
            })
        })


    }


    //4.good页js();
    function good() {

        // <!--热门岗位字段收缩-->
        $(document).ready(function () {
            contenta = $(".p_jx").text();
            stra = contenta.substr(0, 80);
            $(".p_jx").text(stra + "......");
        })
    }

    //5.test页js
    function test() {
        $(".open_test").click(function () {
            window.open("detail_test1.jsp");
        });
        $(".job_test").click(function () {
            window.open("detail_Form.jsp");
        });
    }



    //7.点评页JS;
    //7.1 .星星按钮监控
    $(".remark-star button span").css({"color": "#ccc"});
    $(".remark-star button").click(function () {
        $(this).prevAll().children().removeClass("glyphicon glyphicon-star-empty").addClass("glyphicon glyphicon-star").css({"color": "green"});
        $(this).children().removeClass("glyphicon glyphicon-star-empty").addClass("glyphicon glyphicon-star").css({"color": "green"});
        $(this).nextAll().children().removeClass("glyphicon glyphicon-star").addClass("glyphicon glyphicon-star-empty").css({"color": "#ccc"});
    });


    //7.2 .标检按钮监控
    $(".remark_bq button").click(function () {
        $(this).toggleClass("btn-success")
    });
});

// 7.3 表单徽章颜色变化
$(document).ready(function () {
    $("#span_0").click(function () {
        var a = $(this).css("background-color").toString();
        if (a == "rgb(119, 119, 119)") {
            $(this).css("background-color", "#5e0000");
        } else {
            $(this).css("background-color", "rgb(119, 119, 119)");
        }

    })
    $("#span_1").click(function () {
        var a = $(this).css("background-color").toString();
        if (a == "rgb(119, 119, 119)") {
            $(this).css("background-color", "#5e0000");
        } else {
            $(this).css("background-color", "rgb(119, 119, 119)");
        }

    })
    $("#span_2").click(function () {
        var a = $(this).css("background-color").toString();
        if (a == "rgb(119, 119, 119)") {
            $(this).css("background-color", "#5e0000");
        } else {
            $(this).css("background-color", "rgb(119, 119, 119)");
        }

    })
    $("#span_3").click(function () {
        var a = $(this).css("background-color").toString();
        if (a == "rgb(119, 119, 119)") {
            $(this).css("background-color", "#5e0000");
        } else {
            $(this).css("background-color", "rgb(119, 119, 119)");
        }

    })
    $("#span_4").click(function () {
        var a = $(this).css("background-color").toString();
        if (a == "rgb(119, 119, 119)") {
            $(this).css("background-color", "#5e0000");
        } else {
            $(this).css("background-color", "rgb(119, 119, 119)");
        }

    })
});


//detail_company JS
var dp = 880;
var ind = 1;
// <!--热门岗位字段收缩-->
$(document).ready(function () {
    contenta = $(".p_sm").text();
    stra = contenta.substr(0, 60);
    $(".p_sm").text(stra + "......");
})
$(document).ready(function () {
    contenta = $(".p_sn_a").text();
    stra = contenta.substr(0, 60);
    $(".p_sn_a").text(stra + "......");
})

$(document).ready(function () {
    contenta = $(".p_an_a").text();
    stra = contenta.substr(0, 70);
    $(".p_an_a").text(stra + "......");
    $(".p_zk").click(function () {
        if (ind == 1) {
            $(".p_an_a").text(contenta);
            $(".p_zk").text("收缩");
            ind = 2;
        } else {
            $(".p_an_a").text(stra);
            $(".p_zk").text("展开");
            ind = 1;
        }
    })
})
$(document).ready(function () {
    contenta = $(".p_an_b").text();
    stra = contenta.substr(0, 70);
    $(".p_an_b").text(stra + "......");
    $(".p_zk_b").click(function () {
        if (ind == 1) {
            $(".p_an_b").text(contenta);
            $(".p_zk_b").text("收缩");
            $("")
            ind = 2;
        } else {
            $(".p_an_b").text(stra);
            $(".p_zk_b").text("展开");
            ind = 1;
        }
    })
})
$(document).ready(function () {
    contenta = $(".p_an_c").text();
    stra = contenta.substr(0, 70);
    $(".p_an_c").text(stra + "......");
    $(".p_zk_c").click(function () {
        if (ind == 1) {
            $(".p_an_c").text(contenta);
            $(".p_zk_c").text("收缩");
            $("")
            ind = 2;
        } else {
            $(".p_an_c").text(stra);
            $(".p_zk_c").text("展开");
            ind = 1;
        }
    })
})
$(document).ready(function () {
    contenta = $(".p_an_d").text();
    stra = contenta.substr(0, 70);
    $(".p_an_d").text(stra + "......");
    $(".p_zk_d").click(function () {
        if (ind == 1) {
            $(".p_an_d").text(contenta);
            $(".p_zk_d").text("收缩");
            $("")
            ind = 2;
        } else {
            $(".p_an_d").text(stra);
            $(".p_zk_d").text("展开");
            ind = 1;
        }
    })
})
$(document).ready(function () {
    contenta = $(".p_an_e").text();
    stra = contenta.substr(0, 70);
    $(".p_an_e").text(stra + "......");
    $(".p_zk_e").click(function () {
        if (ind == 1) {
            $(".p_an_e").text(contenta);
            $(".p_zk_e").text("收缩");
            $("")
            ind = 2;
        } else {
            $(".p_an_e").text(stra);
            $(".p_zk_e").text("展开");
            ind = 1;
        }
    })
})
// 点评按钮实现
$(document).ready(function () {
    $(".a_li_dp").click(function () {
        $(this).text("点评(" + (dp + 1) + ")");
    })
})

// 赞按钮实现
$(document).ready(function () {
    $(".a_li_z").click(function () {
        $(this).text("赞(" + (dp + 1) + ")");
    })
})

// 收藏按钮实现
$(document).ready(function () {
    $(".a_li_sc").click(function () {
        $(this).text("收藏(" + (dp + 1) + ")");
    })
})



