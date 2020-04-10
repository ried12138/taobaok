package xyz.taobaok.www.bean;

public class UserBehaviorDataBean {
    private Integer id;                 //账号id

    private String createTime;          //创建时间

    private String collectionId;        //商品id

    private String mainPic;             //商品图片

    private String title;               //商品标题

    private String originalPrice;       //商品原价

    private String actualPrice;         //券后价

    public UserBehaviorDataBean() {
    }

    public UserBehaviorDataBean(Integer id, String createTime, String collectionId, String mainPic, String title, String originalPrice, String actualPrice) {
        this.id = id;
        this.createTime = createTime;
        this.collectionId = collectionId;
        this.mainPic = mainPic;
        this.title = title;
        this.originalPrice = originalPrice;
        this.actualPrice = actualPrice;
    }

    public String getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(String originalPrice) {
        this.originalPrice = originalPrice;
    }

    public String getActualPrice() {
        return actualPrice;
    }

    public void setActualPrice(String actualPrice) {
        this.actualPrice = actualPrice;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }

    public String getCollectionId() {
        return collectionId;
    }

    public void setCollectionId(String collectionId) {
        this.collectionId = collectionId == null ? null : collectionId.trim();
    }

    public String getMainPic() {
        return mainPic;
    }

    public void setMainPic(String mainPic) {
        this.mainPic = mainPic == null ? null : mainPic.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }
}