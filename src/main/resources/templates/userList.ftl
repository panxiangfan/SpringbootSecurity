<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>列表</title>

    <#assign basePath=springMacroRequestContext.contextPath />

    <#--<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">-->
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="/jquery-3.4.1.js"></script>
    <#--<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>-->
    <#--<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <script src="${basePath}/serializeObject.js"></script>
    <link rel="stylesheet" href="css/bootstrap-table.min.css"/>
    <script src="css/bootstrap-table.min.js"></script>
    <link rel="stylesheet" href="css/toastr.css">
    <script src="js/toastr.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/akottr/dragtable@master/dragtable.css">
    <script src="https://cdn.jsdelivr.net/gh/akottr/dragtable@master/jquery.dragtable.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.18.1/dist/extensions/reorder-columns/bootstrap-table-reorder-columns.min.js"></script>
</head>
<style>
</style>
<script type="text/javascript">
    var result;
    $(function () {

        //显示添加框 回显框
        $("#addbutton").click(function () {
            clear();
            $("#update").hide();
            $("#insert").show();
        });

        $("#cancel").click(function () {
            clear();
        })
        //
        //$.mask_fullscreen(3000);


        InitMainTable();


        $("#deleteIds").click(function () {

            var count = 0;
            var rows = $("#pagetable").bootstrapTable('getSelections');
            if (rows.length == 0) {// rows 主要是为了判断是否选中，下面的else内容才是主要
                toastr.warning("请先选择要删除的记录!");
                return;
            } else {
                var arrays = new Array();// 声明一个数组
                $(rows).each(function () {// 通过获得别选中的来进行遍历
                    arrays.push(this.id);// cid为获得到的整条数据中的一列
                });
                var idcard = arrays.join(','); // 获得要删除的id
                deleteById(idcard);
            }
        });


        ///确认删除
        $("#deleteConfirm").click(function () {
            $.ajax({
                url: "${basePath}/delete/" + result,
                type: "delete",
                success: function (data) {
                    if (data == false) {
                        toastr.error("删除失败!");
                        $("#myDeleteModal").modal("hide");
                    } else {
                        $("#myDeleteModal").modal("hide");
                        $("#pagetable").bootstrapTable('refresh');
                        toastr.success('删除成功!');
                    }
                }
            });
        });


        //添加
        $("#insert").click(function () {
            var user = $("#form1").serializeObject();
            $.ajax({
                url: "${basePath}/save",
                type: "post",
                dataType: "json",
                data: user,
                success: function (result) {
                    console.log(result);
                    $("#pagetable").bootstrapTable('refresh');
                    $("#myModal").modal("hide");
                    //添加成功查询当前页
                    toastr.success("添加成功!");

                }
            });
        });

        /*
        * 修改*/
        $("#update").click(function () {
            var user = $("#form1").serializeObject();
            $.ajax({
                url: "${basePath}/update",
                type: "put",
                data: user,
                success: function (result) {
                    $("#pagetable").bootstrapTable('refresh');
                    $("#myModal").modal("hide");
                    toastr.success("修改成功!");
                }
            });
        })
    });


    var $table;

    //初始化bootstrap-table的内容
    function InitMainTable() {

        //记录页面bootstrap-table全局变量$table，方便应用
        //var queryUrl = '/TestUser/FindWithPager?rnd=' + Math.random()
        $table = $('#pagetable').bootstrapTable({
            url: "/index",                      //请求后台的URL（*）
            method: 'GET',                      //请求方式（*）
            //toolbar: '#toolbar',              //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: true,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）

            pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
            pageSize: 10,                     //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            search: false,                      //是否显示表格搜索
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列（选择显示的列）
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: false,                //是否启用点击选中行
            // height: 800,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                  //是否显示父子表
            loadingFontSize: 12,
            //得到查询的参数
            queryParams: function (params) {
                //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                var temp = {
                    size: params.limit,                         //页面大小
                    current: (params.offset / params.limit) + 1,   //页码
                    column: params.sort,      //排序列名
                    sort: params.order //排位命令（desc，asc）
                };
                return temp;
            },
            columns: [{
                checkbox: true,
                visible: true                  //是否显示复选框
            }, {
                field: 'name',
                title: '姓名',
                sortable: true,
                width: 200
            }, {
                field: 'password',
                title: "密码",
                sortable: true,
                width: 50
            }, {
                field: 'sex',
                title: '性别',
                sortable: true,
                width: 50
            }, {
                field: 'addr',
                title: '地址',
                visible: false,
                width: 50
            }, {
                field: 'email',
                title: '邮箱',
                sortable: true,
                visible: false,
                width: 200
                //formatter: emailFormatter
            }, {
                field: 'likes',
                title: '爱好',
                visible: false,
                width: 150
            }, {
                field: 'time',
                title: '时间',
                sortable: true,
                width: 100
                //formatter: dateFormatter
            }, {
                field: 'id',
                title: '操作',
                width: 120,
                align: 'center',
                valign: 'middle',
                formatter: actionFormatter
            },],
            onLoadSuccess: function () {
                //toastr.success("数据加载成功");
            },
            onLoadError: function () {
                //showTips("数据加载失败！");
            },
            onDblClickRow: function (row, $element) {
                var id = row.id;
                //EditViewById(id, 'view');
            },
            formatRecordsPerPage: function (pageNumber) {
                return '每页 ' + pageNumber + ' 条记录';
            },
//页码
            formatShowingRows: function (pageFrom, pageTo, totalRows) {
                return "第 " + pageFrom + "-" + pageTo + " 条记录，总共 " + totalRows + " 记录";
            },
            // loadingTemplate: function (message) {
            //     return '<span class="sp sp-clock"></span>';
            // }
        });
    };


    /**
     * 清理输入框
     */
    function clear() {
        $("#id").val("");
        $("#name").val("");
        $(":radio[name='sex']").prop("checked", false);
        $("#email").val("");
        $("#addr").val("");
        $("#likes").val("");
        $("#time").val("");
        $("#password").val("");
    }

    //操作栏的格式化
    function actionFormatter(value, row, index) {
        var id = value;
        var result = "";
        //result += "<a href='javascript:;' class='btn btn-xs blue btn-success' onclick=\"getUserById('" + id + "')\" title='详情'><span class='glyphicon glyphicon-search'></span></a>&nbsp;";
        result += "<a href='javascript:;' class='btn btn-xs blue btn-success' onclick=\"getUserById('" + id + "')\" title='编辑'><span class='glyphicon glyphicon-pencil'></span></a>&nbsp;";
        result += "<a href='javascript:;' class='btn btn-xs btn-danger' onclick=\"deleteById('" + id + "')\" title='删除'><span class='glyphicon glyphicon-remove'></span></a>";
        return result;
    }

    /**
     * 删除单个，或者批量删除
     * @param ids
     */
    function deleteById(result) {
        $("#myDeleteModal").modal("show");
        this.result = result;
    }

    function getUserById(id) {
        $("#insert").hide();
        $("#update").show();
        $("#myModal").modal("show");
        $.ajax({
            url: "${basePath}/get/" + id,
            type: "get",
            dataType: "json",
            success: function (result) {
                $("#id").val(result.id);
                $("#name").val(result.name);
                $("#email").val(result.email);
                $("#password").val(result.password);
                $("input[type='radio'][name='sex'][value='" + result.sex + "']").prop("checked", "checked");
                $("#addr").val(result.addr);
                $("#likes").val(result.likes);
                $("#time").val(result.time);
            }
        });
    }


    toastr.options = {

        "closeButton": false, //是否显示关闭按钮

        "debug": false, //是否使用debug模式

        "positionClass": "toast-center-center",//弹出窗的位置

        "showDuration": "300",//显示的动画时间

        "hideDuration": "1000",//消失的动画时间

        "timeOut": "1000", //展现时间

        "extendedTimeOut": "1000",//加长展示时间

        "showEasing": "swing",//显示时的动画缓冲方式

        "hideEasing": "linear",//消失时的动画缓冲方式

        "showMethod": "fadeIn",//显示时的动画方式

        "hideMethod": "fadeOut" //消失时的动画方式
    };
</script>
<style type="text/css">
    body {
        padding-top: 70px;
        position: relative;
    }
</style>
<#--inverse-->
<body data-spy="scroll">

<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-12  col-xs-12 col-lg-12  ">
            <
            <h2 class="sub-header ">用户列表</h2>
            <hr>
            <input type="button" value="新增" id="addbutton" class="btn btn-primary  btn-sm " data-toggle="modal"
                   data-target="#myModal">
            <input type="button" value="删除" id="deleteIds" class="btn btn-danger  btn-sm">

<#--            <div class="aaa">-->
                <div id="testpage" class="table-responsive ">
                    <table class="table table-hover" id="pagetable" data-reorderable-columns="true">
                        <thead>
                        </thead>
                        <tbody id="databody">
                        </tbody>
                    </table>
                    <div id="page"></div>
                </div>

<#--                <script type="text/javascript">-->
<#--                </script>-->
<#--            </div>-->
        </div>
    </div>
</div>
<!-- 修改/添加模态框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">用户操作</h4>
            </div>
            <div class="modal-body">
                <#include "from.ftl"/>
            </div>
            <div class="modal-footer" id="footerDiv">
                <input type="button" value="Save changes" id="insert" class="btn btn-success btn-sm">
                <input type="button" value="Save changes" id="update" class="btn btn-success btn-sm">
                <input type="button" value="Close" id="cancel" class="btn btn-danger btn-sm" data-dismiss="modal">
                <#--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>-->
            </div>
        </div>
    </div>
</div>
<#--删除弹出框-->
<div class="modal fade bs-example-modal-sm " tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="myDeleteModal">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4>用户删除</h4>
            </div>
            <div class="modal-body">
                <div class="text-danger text-center">
                    是否删除选中用户？
                </div>
            </div>
            <div class="modal-footer">
                <input type="button" value="confirm " id="deleteConfirm" class="btn btn-success btn-sm">
                <input type="button" value="Close" id="cancel" class="btn btn-danger btn-sm" data-dismiss="modal">
            </div>
        </div>
    </div>
</div>
</body>
</html>

