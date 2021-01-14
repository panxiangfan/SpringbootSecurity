<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Settings</a></li>
                <li><a href="#">Profile</a></li>
                <li>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="margin-top: -3px">
                        <img src="/img/02.jpg" width="25px" height="25px" class="img-circle" >
                        <span class="caret" ></span>
                    </a>
                    <div class="dropdown-menu pull-right"
                         style="background: #FFFFFF;width: 320px;overflow: hidden">
                        <div style="margin-top: 16px;border-bottom: 1px solid #eeeeee">
                            <div style="text-align: center">
                                <img class="img-circle" src="/img/02.jpg"
                                     style="width: 50px;height: 50px;"/>
                            </div>
                            <div style="color: #323534;text-align: center;line-height: 36px;font-size: 15px">
                                <span>username</span>
                            </div>
                        </div>

                        <div class="row" style="margin-left: 15px;margin-right: 15px;margin-top: 10px">
                            <div class="col-md-4 text-center grid">
                                <i class="fa fa-user" style="font-size: 25px;line-height: 45px;"></i>
                                <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                    个人中心</p>
                            </div>
                            <div class="col-md-4 text-center grid">
                                <i class="fa fa-gear" style="font-size: 25px;line-height: 45px;"></i>
                                <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                    账号管理</p>
                            </div>
                            <div class="col-md-4 text-center grid">
                                <i class="fa fa-key" style="font-size: 25px;line-height: 45px;"></i>
                                <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                    密码修改</p>
                            </div>
                        </div>

                        <div class="row" style="margin-left: 15px;margin-right: 15px;margin-top: 10px">
                            <div class="col-md-4 text-center grid">
                                <i class="fa fa-user-circle" style="font-size: 25px;line-height: 45px;"></i>
                                <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                    修改头像</p>
                            </div>
                            <div class="col-md-4 text-center grid">
                                <i class="fa fa-comments" style="font-size: 25px;line-height: 45px;"></i>
                                <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                    消息<span class="badge" style="font-size: 12px">4</span></p>
                            </div>
                            <div class="col-md-4 text-center grid">
                                <i class="fa fa-heart-o" style="font-size: 25px;line-height: 45px;"></i>
                                <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                    帮助中心</p>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 20px">
                            <div class="text-center"
                                 style="padding: 15px;margin: 0px;background: #f6f5f5;color: #323534;">
                                <i class="fa fa-sign-out"></i> 退出登入界面
                            </div>
                        </div>
                    </div>
                </li>



            </ul>
            <form class="navbar-form navbar-right">
                <div class="input-group">
                    <input type="search" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                        <#--搜索按钮-->
                        <button class="btn btn-primary" type="submit">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                     </span>
                </div>
            </form>

        </div>
    </div>
</nav>