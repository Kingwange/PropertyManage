/// <reference path="jquery-1.10.2.min.js" />

function ShowLoginBox() {
    $("#txtUserName").val("");
    $("#txtPwd").val("");
    layer.open({
        type: 1,//表示弹出是一个页面层
        title: "登录",
        area: ["393px", "260px"],//宽度和高度
        content: $("#dloginbox") //内容所对应的jq对象
    });
}

function Login() {
    var username = $.trim($("#txtUserName").val());//获取到用户名
    var pwd = $.trim($("#txtPwd").val());//获取到用户名
    if (username == "" || pwd == "") {
        layer.msg("用户名或密码不能为空", {
            time: 2000,
            icon: 5
        });
    }
    else {
        //1、后台页面是哪个 2、传什么数据  3、后台处理之后的结果
        $.post("/Handler1.ashx", { "username": username, "pwd": pwd }, function (data) {
            if (data == "ok") {
                layer.msg("登录成功", {
                    time: 2000,
                    icon: 6
                }, function () {
                    location.href = "http://www.ruanmou.net";
                });
            }
            else {
                layer.msg("用户名或者密码错误", {
                    time: 2000,
                    icon: 5
                });
            }
        });
    }
}