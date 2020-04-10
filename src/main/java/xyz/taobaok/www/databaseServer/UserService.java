package xyz.taobaok.www.databaseServer;

import xyz.taobaok.www.bean.ItemBean;
import xyz.taobaok.www.bean.UserBehaviorDataBean;
import xyz.taobaok.www.bean.UserDataBean;

import java.util.List;

/**
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/4/9   10:22 上午
 * @Version 1.0
 */
public interface UserService {
    //数据库插入注册信息
    boolean setUserInfo(String jsessionid, String email, String name, String phone, String password, Integer intsex);

    //查询邮箱和手机号是否存在
    int queryUserInfo(String phone);

    //登陆验证
    UserDataBean checkUserInfo(String phone, String password);

    //查询商品id
    List<UserBehaviorDataBean> queryShopId(Integer id);
    //查询收藏夹是否存在
    Integer selectGoodsid(Integer id, String goodsId);
    //查询收藏夹是否满
    Integer selectCollection(Integer id);
    //插入收藏商品信息
    Integer instCoolection(Integer id, String goodsId, String title, String pic, String originalPrice, String actualPrice);
    //修改用户信息里的收藏数量
    void updateUserInfoCoolection(Integer id, int nu);
    //插入商品详情
    void instShopItem(ItemBean list);
    //删除收藏夹
    Integer delcollection(String userid, String collid);
}
