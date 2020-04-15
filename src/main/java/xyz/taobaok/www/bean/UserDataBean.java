package xyz.taobaok.www.bean;

import java.util.Date;

/**
 * 用户信息表user_data
 */
public class UserDataBean {
    private Integer id;                 //唯一id

    private Integer sex;                //性别

    private String name;                //姓名

    private String password;            //密码

    private String cookieId;            //cookieid

    private String phone;               //手机号

    private String email;               //邮箱地址

    private Integer vip;                //vip等级

    private Integer collectionNum;      //收藏数

    private String portrait;            //头像地址

    private String creatDate;           //创建时间

    private Integer score;              //用户积分

    private Integer continueDay;        //签到持续天数

    private String rigninTime;          //签到时间戳

    private Integer rigninCount;        //累计签到天数

    private String rigninDay;          //本月第一次签到的日期时间

    private String continuousReward;    //连续签到领取标记,用,分割来标记

    public UserDataBean() {
    }

    public UserDataBean(Integer sex, String name, String password, String cookieId, String phone, String email, String creatDate) {
        this.sex = sex;
        this.name = name;
        this.password = password;
        this.cookieId = cookieId;
        this.phone = phone;
        this.email = email;
        this.creatDate = creatDate;
    }

    public UserDataBean(Integer id, Integer sex, String name, String password, String cookieId, String phone, String email, Integer vip, Integer collectionNum, String portrait, String creatDate, Integer score, Integer continueDay, String rigninTime, Integer rigninCount, String rigninDay, String continuousReward) {
        this.id = id;
        this.sex = sex;
        this.name = name;
        this.password = password;
        this.cookieId = cookieId;
        this.phone = phone;
        this.email = email;
        this.vip = vip;
        this.collectionNum = collectionNum;
        this.portrait = portrait;
        this.creatDate = creatDate;
        this.score = score;
        this.continueDay = continueDay;
        this.rigninTime = rigninTime;
        this.rigninCount = rigninCount;
        this.rigninDay = rigninDay;
        this.continuousReward = continuousReward;
    }

    public String getContinuousReward() {
        return continuousReward;
    }

    public void setContinuousReward(String continuousReward) {
        this.continuousReward = continuousReward;
    }

    public String getRigninDay() {
        return rigninDay;
    }

    public void setRigninDay(String rigninDay) {
        this.rigninDay = rigninDay;
    }

    public Integer getContinueDay() {
        return continueDay;
    }

    public void setContinueDay(Integer continueDay) {
        this.continueDay = continueDay;
    }

    public String getRigninTime() {
        return rigninTime;
    }

    public void setRigninTime(String rigninTime) {
        this.rigninTime = rigninTime;
    }

    public Integer getRigninCount() {
        return rigninCount;
    }

    public void setRigninCount(Integer rigninCount) {
        this.rigninCount = rigninCount;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getCookieId() {
        return cookieId;
    }

    public void setCookieId(String cookieId) {
        this.cookieId = cookieId == null ? null : cookieId.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getCreatDate() {
        return creatDate;
    }

    public void setCreatDate(String creatDate) {
        this.creatDate = creatDate;
    }

    public Integer getVip() {
        return vip;
    }

    public void setVip(Integer vip) {
        this.vip = vip;
    }

    public Integer getCollectionNum() {
        return collectionNum;
    }

    public void setCollectionNum(Integer collectionNum) {
        this.collectionNum = collectionNum;
    }

    public String getPortrait() {
        return portrait;
    }

    public void setPortrait(String portrait) {
        this.portrait = portrait;
    }
}