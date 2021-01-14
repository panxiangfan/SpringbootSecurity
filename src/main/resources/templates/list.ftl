<div id="testpage" class="table-responsive ">
    <table class="table table-hover" id="pagetable" data-reorderable-columns="true">
        <thead>
        </thead>
                <tbody id="databody">
                <#--<tr>
                    <td><input value="${user.id}"  type="checkbox" class="checkb"/></td>
                    <td>${user.id?default("-")}</td>
                    <td>${user.name?default("-")}</td>
                    <td>${user.sex?default("-")}</td>
                    <td>${user.age?default("-")}</td>
                    <td>${user.addr?default("-")}</td>
                    <td>${user.email?default("-")}</td>
                    <td>${user.likes?default("-")}</td>
                    <td>${user.time?string("yyyy-MM-dd")}</td>
                    <td><a href="javascript:getUserById([${user.id?default("")}])" data-toggle="tooltip"
                           data-placement="top" title="修改用户信息">

                                     <button type="button" class="btn btn-link" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>

                            </button>
                        </a>&nbsp;<a
                                href="javascript:deleteById([${user.id?default("")}]);">
                            <button type="button" class="btn btn-link" data-toggle="tooltip"
                                    data-placement="top"
                                    title="删除用户"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            </button>
                        </a></td>
                </tr>-->
                </tbody>
    </table>
    <div id="page"></div>
</div>

<script type="text/javascript">
    <#--function query(current){-->
    <#--    const size = 10;-->
    <#--    $.ajax({-->
    <#--        url:"page",-->
    <#--        type:"post",-->
    <#--        data:{-->
    <#--            'current':current,-->
    <#--            'size':size-->
    <#--        },-->
    <#--        success:function(data){-->
    <#--            $("#testpage").empty();-->
    <#--            $("#testpage").append(data);-->
    <#--        }-->
    <#--    });-->
    <#--}-->
    <#--    var pages = ${pages};-->
    <#--    var pageNo = ${page.current};-->




    <#--    var nums = ${page.total}, // 总数-->
    <#--    counts = ${page.size}; // 每页个数-->
    <#--    var p = new Page({-->
    <#--    el: '#page',-->
    <#--    nums: nums,-->
    <#--    counts: counts,-->
    <#--    defaultPage: ${page.current},//当前页-->
    <#--    showHeadFoot: !false, // 显示首页尾页-->
    <#--    jumpToOrder: true,  // 跳转到指定页-->
    <#--    showNowAndAll: true, // 当前页/共几页-->
    <#--    clickEvent: function (current) {-->
    <#--    query(current);-->
    <#--}-->
    <#--});-->
</script>




