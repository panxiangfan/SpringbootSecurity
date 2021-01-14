package com.yr.springbootmybatisplus.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yr.springbootmybatisplus.entity.User;
import com.yr.springbootmybatisplus.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.websocket.server.PathParam;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: @linbo
 * @Date: 2020/12/30/030 9:36
 * 保平嚣张起来
 */

@Controller
public class LoginController {




    @Resource
    private IUserService iUserService;
    /**
     * 分页查询
     *
     * @param
     * @param
     * @return
     */
    @RequestMapping("page")
    public String pageList(Page page, ModelMap modelMap) {
        modelMap.put("page", iUserService.page(page));
        modelMap.put("pages",page.getPages());
        return "list";
    }

    @GetMapping("/")
    public String login(){
        return "a";
    }



    @ResponseBody
    @GetMapping("/index")
    public Map pageList1(Page page, @RequestParam(value = "sort",required = false)String sort, @RequestParam(value = "column",required = false) String column){
        //判断是否升序
        boolean isAsc = "asc".equals(sort);
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.orderBy(true,isAsc,column);
        iUserService.page(page,queryWrapper);
        Map map = new HashMap();
        map.put("total",page.getTotal());
        map.put("rows",page.getRecords());
        return map;
    }
}
