var path = "/smartBR";

$(function () {
    var layer;
    layui.use('layer', function () {
        layer = layui.layer;
    });
});


$(document).ready(function () {

//    设置头部信息
    $('#calendar').fullCalendar({
        header: {
            //左边的按钮  中间提示的文字  右边的按钮
            left: 'prev,next today',
            center: 'title',
            right: 'month,basicWeek,basicDay'
        },
        buttonText: {
            //右边按钮文字显示
            today: '今天',
            month: '月',
            week: '周',
            day: '日'
        },
        //禁用jquery ui相关的css和js文件,默认值就是faslse
        theme: false,

        //设置第一周的第一天是哪天,周日是零,周一是1,类推
        firstDay: 0,

        //显示日历从左往右显示,如果值为ture则相反
        isRTL: false,

        //是否显示周末,设为fales则不显示周六和周日.默认值为turn
        weekends: true,

        //隐藏一周中的某一天或某几天,数组形式,如隐藏周二和周五:[2,5]默认不隐藏,除非weekends设置为false.
        hiddenDays: [],

        //在月视图里显示周的模式,因为每月周数可能不同,所以月视图高度不一定.fixed:固定显示6周高,日历高度保持不变liquid:不固定周数,高度随机变化 variable:不固定周数,但高度固定
        weekMode: 'fixed',

        //周次的显示格式. //height:600,//设置日历的高度，包括header日历头部，默认未设置，高度根据aspectRatio值自适应。
        //contentHeight://设置日历主体内容的高度，不包括header部分，默认未设置，高度根据aspectRatio值自适应
        weekNumberCalculation: 'iso',

        //设置日历单元格宽度与高度的比例
        aspectRatio: 1.35,

        //是否随游览器窗口大小变化而自动变化.
        handleWindowResize: true,

        //method,绑定到日历的id上.$('#id').fullCalendar('render');
        render: function (view) {
            console.log('render', view)
        },

        //是否显示左边是多少周,默认为flase
        weekNumbers: true,

        //数据太多时,限制各自里显示的数据条数(多余的以"+2more"格式显示),默认false不限制,支持输入数字设定固定的显示条数
        eventRenderer: true,

        //在视图贝渲染触发(切换视图也触发)参与view为视图对象,参数elemennt为Jquery的视图Dom
        viewRender: function (view, element) {
        },

        //日期格式Render钩子函数（我没理解清楚）
        dayRender: function (date, cell) {
            console.log("↓↓↓dayRender↓↓↓");
            console.log(date);
            console.log(cell);
        },

        //浏览器窗体变化时触发
        handleWindowResize: function () {
            console.log("---windowResize---");
        },

        //自定义全天视图的名称
        allDayText: "全天",

        //一格时间槽代表多长时间，默认00:30:00（30分钟）
        slotDuration: "01:00:00",

        //日期视图左边那一列显示的每一格日期时间格式
        slotLabelFormat: "H(:mm)a",


        //日期视图左边那一列多长间隔显示一条日期文字(默认跟着slotDuration走的，可自定义)
        slotLabelInterval: "02:00:00",


        //其实就是动态创建一个日程时，默认创建多长的时间块
        snapDuration: "05:00:00",


        //相同时间段的多个日程视觉上是否允许重叠，默认true允许
        slotEventOverlap: false,


        //listview视图下，无数据时显示提示
        noEventsMessage: "请添加计划",


        //默认显示那一天的日期视图getDates(true)!!!!!!!!!!!!!!默认显示一定是要xxxx-xx-xx不然在火狐或者IE上会出错!
        defaultDate: new Date(),


        //周/日视图中显示今天当前时间点（以红线标记），默认false不显示
        nowIndicator: false,


        //月份自定义命名
        monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],


        //月份缩略命名（英语比较实用：全称January可设置缩略为Jan）
        monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],


        //同理monthNames
        dayNames: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],


        //同理monthNamesShort
        dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],


        //周的国际化,默认为"W"
        weekNumberTitle: "周",


        //当一块区域内容太多以"+2 more"格式显示时，这个more的名称自定义（应该与eventLimit: true一并用）
        eventLimitText: "更多",


        //点开"+2 more"弹出的小窗口标题，与eventLimitClick可以结合用
        dayPopoverFormat: "YYYY年M月d日",


        // “xx周”是否可以被点击，默认false，如果为true则周视图“周几”被点击之后进入日视图。本地测试：没什么效果
        navLinks: true,


        //当点击某一天时触发此操作
        dayClick: function (date, allDay, jsEvent, view) {
        },
        dayClick: function (date, allDay, jsEvent, view) {

//          alert('Clicked on: ' + date.format());
            // 改变点击后的颜色,在次点击后变回原来的颜色
            // i++;
            // if( i%2 != 0)
            // {
            //     $(this).css('background-color', 'white');
            // }
            // else{
            //     $(this).css('background-color', '#2f6f9f');
            // }
        },

        //当点击某一个事件时触发此操作 //跳转页面的功能在这边
        eventClick: function (event, jsEvent, view) {
        },
        eventClick: function (calEvent, jsEvent, view) {
            var x = calEvent.id;
            var y = calEvent.title;
            //当通过ID去判断的时候判断进的网址是tableA否则是tableB
            $(function () {
                if (y == "要报的名") {
                    $.ajax({
                        url: path + '/pcviews/openExam/' + x,
                        dataType: "json",
                        success: function (data) {
                            window.location.href = "/smartBR/pcviews/openApplyForm/" + data.msg;
                        }
                    });
                } else {
                    $.ajax({
                        url: path + '/pcviews/openExam/' + x,
                        dataType: "json",
                        success: function (data) {
                            window.location.href = "/smartBR/pcviews/openExamForm/" + data.msg;
                        }
                    });
                }

            })
        },

        events: function (start, end, timezone, callback) {
            $.ajax({
                url: path + '/pcviews/examCalendar',
                dataType: "json",
                success: function (data) {
                    var applyList = data.applyList;
                    var events = [];
                    if (data.status == -1) {
                        layer.msg(data.msg);
                    } else {
                        for (var i = 0; i < data.applyList.length; i++) {
                            events.push({
                                id: applyList[i].applyCode,
                                title: "要报的名",
                                start: new Date(applyList[i].startTime),
                                end: new Date(applyList[i].endTime)
                            }, {
                                id: applyList[i].applyCode,
                                title: "要考的试",
                                start: new Date(applyList[i].startTime),
                                end: new Date(applyList[i].endTime)
                            })
                        }
                    }
                    callback(events)
                },
                color: 'yellow',
                textColor: 'black'
            })
        },


        //鼠标在事件上时触发
        eventMouseover: function (calEvent, jsEvent, view) {
            $('.hover-container').removeClass('none').animate({'top': jsEvent.pageY, 'left': jsEvent.pageX})
            if (!canRun) {
                // 判断是否已空闲，如果在执行中，则直接return
                return;
            }

        },


        //鼠标从事件离开时触发
        eventMouseout: function (calEvent, jsEvent, view) {

            $('.hover-container').addClass('none')

        },


        //允许用户可以长按鼠标选择多个区域(比如月视图，可以选中多天；日视图可以选中多个小时)，默认false不能选择多区域的
        selectable: true,


        //接selectable，周/日视图在选择时是否预先画出“日程区块”的样式出来
        selectHelper: true,


        //是否点击页面上的其他地方会导致当前的选择被清除，默认true
        unselectAuto: true,


        //一种方法来指定元素，会忽略unselectauto选项，默认''
        unselectCancel: "",


        //确定用户是否被允许选择被事件占用的时间段，默认true可占用时间段
        selectOverlap: true,


        //精确的编程控制用户可以选择的地方，返回true则表示可选择，false表示不可选择
        selectAllow: function (selectInfo) {
            console.log("↓↓↓selectConstraint↓↓↓");
            console.log("start:" + selectInfo.start + "|end:" + selectInfo.end + "|resourceId:" + selectInfo.resourceId);
            return true;
        },


        //点击空白区域/选择区域内容触发
        select: function (start, end, jsEvent, view) {

        },


        //选择操作取消时触发
        unselect: function (view, jsEvent) {
            console.log("↓↓↓unselect↓↓↓");
            console.log("view:" + view);
        },


        //是否启用懒加载技术--即只取当前条件下的视图数据，其它数据在切换时触发，默认true只取当前视图的，false是取全视图的
        lazyFetching: true,


//	   //在Event Object中如果没有end参数时使用，如start=7:00pm，则该日程对象时间范围就是7:00~9:00
//       defaultTimedEventDuration : "02:00:00",


        //默认1天是多长，（有的是采用工作时间模式，所以支持自定义）
        defaultAllDayEventDuration: {days: 1},


        //视图数据加载中、加载完成触发
        loading: function (isLoading, view) {
            console.log("↓↓↓loading↓↓↓");
            if (isLoading == true) {
                console.log("view:" + view + ",开始加载");
            } else if (isLoading == false) {
                console.log("view:" + view + ",加载完成");
            } else {
                console.log("view:" + view + ",出错了,请联系管理员");
            }
        },


        //多个相同的日程数据排序方式，String / Array / Function, 默认值: "title"
        eventOrder: "title",


        //当Event对象开始渲染时触发
        eventRender: function (event, element, view) {
            console.log("eventRender():" + event.title);
        },


        //当所有Event对象渲染完成时触发
        eventAfterAllRender: function (view) {
            console.log("eventAfterAllRender();");
        },


        //支持Event日程拖动修改，默认false
        editable: false,


        //Event日程开始时间可以改变，默认true，如果是false其实就是指日程块不能随意拖动，只能上下拉伸改变他的endTime
        eventStartEditable: false,


        //Event日程的开始结束时间距离是否可以改变，默认true，如果是false则表示开始结束时间范围不能拉伸，只能拖拽
        eventDurationEditable: false,


        //拖拽时不透明度，0.0~1.0之间，数字越小越透明
        dragOpacity: 0.2,


        //是否在拖拽时自动移动容器，默认true
        dragScroll: true,


        //拖拽时是否重叠
        eventOverlap: true,


        //限制拖拽拖放的位置（即限制有些地方拖不进去）：事件ID，“businessHours”，对象
//       eventConstraint:{
//                                start: '10:00',     // 开始时间（本例中为上午10点）
//                                end: '18:00',       // 结束时间（本例中为下午6点）
//                                dow: [ 1, 2, 3, 4 ] // 一周的几天。 一组从零开始的星期几整数（0 =星期日）（本例中为星期一至星期四）
//                            },


        //面向可touch设备（如移动设备），长按多少毫秒即可拖动,默认1000毫秒（1S）
        longPressDelay: 1000,


        //日程开始拖拽时触发
        eventDragStart: function (event, jsEvent, ui, view) {
            console.log("eventDragStart():" + event.title);
        },


        //日程拖拽停止时触发
        eventDragStop: function (event, jsEvent, ui, view) {
            console.log("eventDragStop():" + event.title);
        },


        //日程拖拽停止并且已经拖拽到其它位置了
        eventDrop: function (event, delta, revertFunc, jsEvent, ui, view) {
            console.log("eventDrop():" + event.title);
        },


        //日程大小调整开始时触发
        eventResizeStart: function (event, jsEvent, ui, view) {
            console.log("eventResizeStart():" + event.title);
        },


        //日程大小调整停止时触发
        eventResizeStop: function (event, jsEvent, ui, view) {
            console.log("eventResizeStop():" + event.title);
        },


        //日程大小调整完成并已经执行更新时触发
        eventResize: function (event, delta, revertFunc, jsEvent, ui, view) {
            console.log("eventResize():" + event.title);
        },


        //利用events添加数据
        /*events: [
            {
                id: 110,
                title: '要考的试',
                start: '2019-03-01'
            },
            {
                id: 220,
                title: '要报的名',
                start: '2019-03-01',
            },
        ]*/

    });
});
