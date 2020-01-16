/*参数提前说明*/
/*姓名*/
$(function () {

    var name = document.getElementById("name").value;
    if (1 > name.length && name.length > 5) {
        $(".can_name").text("验证通过");
        $(".can_name").css("color", "green");
    } else {
        $(".can_name").text("姓名在1个字到5个字之间（必填）");
        $(".can_name").css("color", "red");
        $(".can_name").css("font-size", "12px");
    }
    /*性别*/
    var gender = document.getElementById("gender").value;
    if (gender == "") {
        $(".can_gender").text("请选择性别 （必填）");
        $(".can_gender").css("color", "red");
        $(".can_gender").css("font-size", "12px");
    }
    /*年龄*/
    var birthday = document.getElementById("birthday").value;
    if (birthday == "") {
        $(".can_birthday").text("请填写出生年月（必填）");
        $(".can_birthday").css("color", "red");
        $(".can_birthday").css("font-size", "12px");
    }
    /*籍贯*/
    var native_place = document.getElementById("native_place").value;
    if (1 > native_place.length && native_place.length > 10) {
        $(".can_native_place").text("验证通过");
        $(".can_native_place").css("color", "green");
    } else {
        $(".can_native_place").text("籍贯应该填写直辖市或者省份+城市（必填）");
        $(".can_native_place").css("color", "red");
        $(".can_native_place").css("font-size", "12px");
    }
    /*政治面貌*/
    var political_background = document.getElementById("political_background").value;
    if (political_background == "") {
        $(".can_political_background").text("请选择政治面貌（必填）");
        $(".can_political_background").css("color", "red");
        $(".can_political_background").css("font-size", "12px");
    }
    /*本科*/
    var school = document.getElementById("school").value;
    if (school == "请选择大学") {
        $(".can_school").text("请选择本科院校(没有可不选)");
        $(".can_school").css("color", "green");
        $(".can_school").css("font-size", "12px");
    }
    /*本科专业*/
    var major_ben = document.getElementById("major_ben").value;
    if (major_ben == "") {
        $(".can_major_ben").text("请选择本科专业(没有选其他)");
        $(".can_major_ben").css("color", "green");
        $(".can_major_ben").css("font-size", "12px");
    }
    /*硕士*/
    var school_plus = document.getElementById("school_plus").value;
    if (school_plus == "请选择大学") {
        $(".can_school_plus").text("请选择硕士院校(没有可不选)");
        $(".can_school_plus").css("color", "green");
        $(".can_school_plus").css("font-size", "12px");
    }
    /*硕士专业*/
    var major_shuo = document.getElementById("major_shuo").value;
    if (major_shuo == "") {
        $(".can_major_shuo").text("请选择硕士专业(没有选其他)");
        $(".can_major_shuo").css("color", "green");
        $(".can_major_shuo").css("font-size", "12px");
    }
    /*博士*/
    var school_big = document.getElementById("school_big").value;
    if (school_big == "") {
        $(".can_school_big").text("请手填博士院校(没有不填)");
        $(".can_school_big").css("color", "green");
        $(".can_school_big").css("font-size", "12px");
    }
    /*博士专业*/
    var major_bo = document.getElementById("major_bo").value;
    if (major_bo == "") {
        $(".can_major_bo").text("请手填博士专业(没有不填)");
        $(".can_major_bo").css("color", "green");
        $(".can_major_bo").css("font-size", "12px");
    }
    /*实习单位1*/
    var practice_unit_one = document.getElementById("practice_unit_one").value;
    if (practice_unit_one == "") {
        $(".can_practice_unit_one").text("请选择您第一家实习单位(没有不选)");
        $(".can_practice_unit_one").css("color", "green");
        $(".can_practice_unit_one").css("font-size", "12px");
    }
    /*实习岗位1*/
    var practice_post_one = document.getElementById("practice_post_one").value;
    if (practice_post_one == "") {
        $(".can_practice_post_one").text("请填写第一家实习岗位(没有不填)");
        $(".can_practice_post_one").css("color", "green");
        $(".can_practice_post_one").css("font-size", "12px");
    }
    /*实习单位2*/
    var practice_unit_two = document.getElementById("practice_unit_two").value;
    if (practice_unit_two == "") {
        $(".can_practice_unit_two").text("请选择您第二家实习单位(没有不选)");
        $(".can_practice_unit_two").css("color", "green");
        $(".can_practice_unit_two").css("font-size", "12px");
    }
    /*实习岗位2*/
    var practice_post_two = document.getElementById("practice_post_two").value;
    if (practice_post_two == "") {
        $(".can_practice_post_two").text("请填写第二家实习岗位(没有不填)");
        $(".can_practice_post_two").css("color", "green");
        $(".can_practice_post_two").css("font-size", "12px");
    }
    /*实习单位3*/
    var practice_unit_three = document.getElementById("practice_unit_three").value;
    if (practice_unit_three == "") {
        $(".can_practice_unit_three").text("请选择您第三家实习单位(没有不选)");
        $(".can_practice_unit_three").css("color", "green");
        $(".can_practice_unit_three").css("font-size", "12px");
    }
    /*实习岗位3*/
    var practice_post_three = document.getElementById("practice_post_three").value;
    if (practice_post_three == "") {
        $(".can_practice_post_three").text("请填写第三家实习岗位(没有不填)");
        $(".can_practice_post_three").css("color", "green");
        $(".can_practice_post_three").css("font-size", "12px");
    }
    /*交换经历*/
    var exchange_student = document.getElementById("exchange_student").value;
    if (exchange_student == "") {
        $(".can_exchange_student").text("请填写交换(没有不填)");
        $(".can_exchange_student").css("color", "green");
        $(".can_exchange_student").css("font-size", "12px");
    }
    /*实践项目*/
    var social_sractice = document.getElementById("social_sractice").value;
    if (social_sractice == "") {
        $(".can_social_sractice").text("请填写实践项目(没有不填)");
        $(".can_social_sractice").css("color", "green");
        $(".can_social_sractice").css("font-size", "12px");
    }
    /*想要做设么*/
    var want_work = document.getElementById("want_work").value;
    if (want_work == "") {
        $(".can_want_work").text("请填写职业偏好(没有不填且不计分数)");
        $(".can_want_work").css("color", "green");
        $(".can_want_work").css("font-size", "12px");
    }
    var like_man = document.getElementById("like_man").value;
    if (like_man == "") {
        $(".can_like_man").text("请填写自我描述(没有不填且不计分数)");
        $(".can_like_man").css("color", "green");
        $(".can_like_man").css("font-size", "12px");
    }
});

