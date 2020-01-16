var myAlert = function (message) {
    BootstrapDialog.alert(
        {
            title: "提示",
            message: message,
            closeable: true,
            buttonLabel: "确定",
            onshown: function () {
                console.log($(".modal-backdrop").css('z-index'));
                $(".modal-dialog").css('z-index', $(".modal-backdrop").css('z-index') + 1);
            }
        });
};