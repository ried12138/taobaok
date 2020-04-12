package xyz.taobaok.www.portal.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import xyz.taobaok.www.bean.ItemBean;
import xyz.taobaok.www.bean.UserBehaviorDataBean;
import xyz.taobaok.www.bean.UserDataBean;

import java.util.List;

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

    List<UserBehaviorDataBean> queryShopId(@Param("userid") Integer id);

    Integer selectGoodsid(@Param("goodsId")String goodsId, @Param("userid")Integer id);

    Integer selectCollection(@Param("userid")Integer id);

    Integer instCoolection(@Param("userid")Integer id, @Param("goodsId")String goodsId,@Param("creatData")String creatData,@Param("title")String title, @Param("mainPic")String pic, @Param("originalPrice")String originalPrice, @Param("actualPrice")String actualPrice);

    void updateUserInfoCoolection(@Param("userid")Integer id, @Param("num")Integer nu);

    void instShopItem(@Param("list")ItemBean list);

    Integer delcollection(@Param("userid")String userid, @Param("collid")String collid);

    UserDataBean selectUserInfo(@Param("userid")Integer id);

    Integer updateUserInfoRegister(@Param("user")UserDataBean userinfo);
}
