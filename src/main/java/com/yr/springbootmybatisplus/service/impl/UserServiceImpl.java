package com.yr.springbootmybatisplus.service.impl;

import com.yr.springbootmybatisplus.entity.User;
import com.yr.springbootmybatisplus.mapper.UserMapper;
import com.yr.springbootmybatisplus.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author pan
 * @since 2020-12-28
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {



}
