package com.yr.springbootmybatisplus.controller;


import com.yr.springbootmybatisplus.entity.User;
import com.yr.springbootmybatisplus.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author pan
 * @since 2020-12-28
 */
@RestController
public class UserController {

    @Resource
    private UserService userService;




    /**
     * 获取列表
     *
     * @return list
     */
    @GetMapping("list")
    public List<User> userList() {
        return userService.list();
    }

    /**
     * 根据id 逻辑删除
     *
     * @param id
     * @return boolean
     */
    @DeleteMapping("delete/{result}")
    public boolean deleteById(@PathVariable("result") String id) {
        List<Integer> idlist = new ArrayList<>();
        String[] ids = id.split(",");

        if(ids.length != 0){
            for (String ID:ids
            ) {
                idlist.add(Integer.valueOf(ID));
            }
            return userService.removeByIds(idlist);
        }
            return false;
    }

    /**
     * 修改
     *
     * @param user
     * @return
     */
    @PutMapping("update")
    public boolean updateByid(User user) {

        return userService.updateById(user);

    }

    /**
     * 根据id获取user
     *
     * @param id
     * @return user
     */
    @GetMapping("get/{id}")
    public User getUser(@PathVariable("id") Integer id) {
        return userService.getById(id);
    }


    /**
     * 添加一条数据
     *
     * @param user
     * @return id
     */
    @PostMapping("save")
    public Integer save(User user) {
        userService.save(user);
        return user.getId();
    }

    /**
     * 测试 防止删除全表
     *
     * @return
     */
    @PostMapping("deleteAll")
    public boolean deleteAll() {
        return userService.remove(null);
    }


}
