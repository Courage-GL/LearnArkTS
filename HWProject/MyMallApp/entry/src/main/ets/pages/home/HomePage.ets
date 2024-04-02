/**
 * 首页
 */
@Entry
@Component
struct HomePage {
  private swiperController: SwiperController = new SwiperController()

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Text("首页").fontColor(Color.Black).fontSize(30).width('100%').margin({ left: 20, top: 20 })
        // 轮播图
        Swiper(this.swiperController) {
          ForEach(this.getSwiperImages(), (imgResource: Resource) => {
            Image(imgResource).borderRadius(20)
          })
        }.autoPlay(true)
        .width('95%')
        .height(200)
        .margin({
          top: 20, left: 20, right: 20, bottom: 20
        })
        // 菜单列表 网格布局
        Grid() {
          ForEach(this.getRecommendList(), (recommendItem: ItemData) => {
            GridItem() {
              Column() {
                Image(recommendItem.icon).height(40).width(40)
                Text(recommendItem.content).fontSize(12).fontColor(Color.Black).fontWeight(400).margin({ top: 10 })
              }
            }
          })
        }
        // 设置网格的列模板，每列平分空间
        .columnsTemplate('1fr 1fr 1fr 1fr')
        // 设置网格的行模板，每行平分空间
        .rowsTemplate('1fr 1fr')
        // 列之间的间距
        .columnsGap(40)
        .rowsGap(20)
        .height(150)
        .padding({ left: 20, right: 20 })

        // 频道
        Text("列表").fontColor(Color.Black).fontSize(20).width('100%').margin({ left: 20 })
        Grid() {
          ForEach(this.getChannelList(), (channelItemData: ChannelItemData) => {
            GridItem() {
              Column() {
                Text(channelItemData.title).fontSize(20).fontWeight(400).fontColor(Color.Black)
                Text(channelItemData.introduce).fontSize(14).fontWeight(200).fontColor(Color.Black)
              }
              .alignItems(HorizontalAlign.Start)
              .margin({ left: 12, top: 14 })
            }
            .align(Alignment.TopStart)
            .backgroundImage(channelItemData.icon)
            .backgroundImageSize(ImageSize.Cover)
            .width('100%')
            .height('100%')
            .borderRadius(10)
          })
        }
        .height(600)
        .width('100%')
        // 设置网格的列模板，每列平分空间
        .columnsTemplate('1fr 1fr')
        // 设置网格的行模板，每行平分空间
        .rowsTemplate('1fr 1fr 1fr 1fr')
        // 列之间的间距
        .columnsGap(14)
        .rowsGap(16)
        .padding({ left: 14, right: 14, bottom: 14 })

      }
    }
    .height('100%')
  }

  /**
   * 轮播图数据
   * @returns
   */
  getSwiperImages(): Array<Resource> {
    let swiperImages: Resource[] = [
    $r('app.media.ic_first_card'),
    $r('app.media.ic_second_card'),
    $r('app.media.ic_third_card'),
    $r('app.media.ic_fourth_card'),
    $r('app.media.ic_found')
    ]
    return swiperImages
  }

  /**
   * 菜单数据
   * @returns
   */
  getRecommendList(): Array<ItemData> {
    let recommendList: ItemData[] = [
      new ItemData($r('app.media.ic_love'), '我的最爱'),
      new ItemData($r('app.media.ic_target'), '历史记录'),
      new ItemData($r('app.media.ic_message'), '消息'),
      new ItemData($r('app.media.ic_shopping'), '购物车'),
      new ItemData($r('app.media.ic_menu'), '我的目标'),
      new ItemData($r('app.media.ic_circle'), '圈子'),
      new ItemData($r('app.media.ic_favorite'), '收藏'),
      new ItemData($r('app.media.ic_recycle'), '回收站'),
    ]
    return recommendList
  }

  /**
   * 频道列表数据
   * @returns
   */
  getChannelList(): Array<ChannelItemData> {
    let channelList: ChannelItemData[] = [
      new ChannelItemData($r('app.media.ic_new'), '排行榜', 'TOP100!'),
      new ChannelItemData($r('app.media.ic_found'), '新品首发', 'NEW100!'),
      new ChannelItemData($r('app.media.ic_top'), '大牌闪购', '快冲鸭！'),
      new ChannelItemData($r('app.media.ic_brand'), '发现好物', '我们不见不散！'),
      new ChannelItemData($r('app.media.banner_1'), '我的最爱', '发现好物，不止现在！'),
      new ChannelItemData($r('app.media.banner_2'), '我的收藏', '我的收藏，你值得拥有！'),
      new ChannelItemData($r('app.media.banner_3'), '巅峰发布', '巅峰发布，快冲！'),
      new ChannelItemData($r('app.media.ic_first_card'), '春季特卖', '春季特卖，快来抢！'),
    ]
    return channelList
  }
}

class ItemData {
  public content: string // 文字
  public icon: Resource // 图标

  constructor(icon: Resource, content: string) {
    this.icon = icon
    this.content = content
  }
}

class ChannelItemData {
  public title: string // 标题
  public icon: Resource // 图标
  public introduce: string // 介绍

  constructor(icon: Resource, title: string, introduce: string) {
    this.icon = icon
    this.title = title
    this.introduce = introduce
  }
}