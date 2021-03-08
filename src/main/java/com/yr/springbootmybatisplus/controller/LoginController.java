package com.yr.springbootmybatisplus.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yr.springbootmybatisplus.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: @pan
 * @Date: 2020/12/30/030 9:36
 */

@Controller
public class LoginController {

    private Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Resource
    private SessionRegistry sessionRegistry;

    @Resource
    private UserService userService;

    @RequestMapping("/")
    public ModelAndView showHome() {
        /**获取当前登录用户*/
        String name = SecurityContextHolder.getContext().getAuthentication().getName();
        ModelAndView model = new ModelAndView();
        model.addObject("name", name);
        model.setViewName("userList");

        System.out.println("当前登陆用户：" + name);
        return model;
    }

    @RequestMapping("/login")
    public String showLogin() {
        return "login";
    }


    @RequestMapping(value = "/errorlogin")
    public ModelAndView login(@RequestParam(value = "error", required = false) String error) {
        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "用户名或者密码错误！");
        }
        model.setViewName("login");
        return model;
    }

    /**
     * 分页查询
     *
     * @param
     * @param
     * @return
     */
    @RequestMapping("page")
    public String pageList(Page page, ModelMap modelMap) {
        modelMap.put("page", userService.page(page));
        modelMap.put("pages",page.getPages());
        return "list";
    }


    @ResponseBody
    @GetMapping("/index")
    public Map pageList1(Page page, @RequestParam(value = "sort",required = false)String sort, @RequestParam(value = "column",required = false) String column){
        //判断是否升序
        boolean isAsc = "asc".equals(sort);
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.orderBy(true,isAsc,column);
        userService.page(page,queryWrapper);
        Map map = new HashMap();
        map.put("total",page.getTotal());
        map.put("rows",page.getRecords());
        return map;
    }

    @GetMapping("/kick")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @ResponseBody
    public String removeUserSessionByUsername(@RequestParam String username) {
        int count = 0;
        // 获取session中所有的用户信息
        List<Object> users = sessionRegistry.getAllPrincipals();
        for (Object principal : users) {
            if (principal instanceof User) {
                String principalName = ((User)principal).getUsername();
                if (principalName.equals(username)) {
                    // 参数二：是否包含过期的Session
                    List<SessionInformation> sessionsInfo = sessionRegistry.getAllSessions(principal, false);
                    if (null != sessionsInfo && sessionsInfo.size() > 0) {
                        for (SessionInformation sessionInformation : sessionsInfo) {
                            sessionInformation.expireNow();
                            count++;
                        }
                    }
                }
            }
        }
        return "操作成功，清理session共" + count + "个";
    }

}
