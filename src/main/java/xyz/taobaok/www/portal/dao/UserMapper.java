package xyz.taobaok.www.portal.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import xyz.taobaok.www.bean.UserDataBean;

/**
 * 用户数据查询
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/4/7   6:07 下午
 * @Version 1.0
 */
@Repository
public interface UserMapper {

    int instUserInfo(UserDataBean userDataBean);

    int queryUserInfo(@Param("phone") String phone);

    UserDataBean checkUserInfo(@Param("phone")String phone,@Param("password") String password);
}
