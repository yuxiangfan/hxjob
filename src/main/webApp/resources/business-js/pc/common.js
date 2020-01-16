$(function () {

    $("#search").on('click', function () {

        var content = $("#header-search").val();
        content = escape(escape(content));
        window.location.href = "pos?sc=" + content;

    });

    $("#search_index").on('click', function () {
        var content = $("#input-16").val();
        content = escape(escape(content));
        window.location.href = "pos?sc=" + content;
    });

    /*回车键搜索*/
    $("#input-16").keydown(function (e) {
        if (e.which == 13) {
            var content = $("#input-16").val();
            content = escape(escape(content));
            window.location.href = "pos?sc=" + content;
        }
    });

    $("#header-search").keydown(function (e) {
        if (e.which == 13) {
            var content = $("#header-search").val();
            content = escape(escape(content));
            window.location.href = "pos?sc=" + content;
        }
    })
});