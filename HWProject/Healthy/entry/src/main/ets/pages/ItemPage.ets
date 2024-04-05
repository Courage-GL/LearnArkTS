import router from '@ohos.router'
import { CommonConstants } from '../common/constants/CommonConstants'
import ItemPanelCard from '../view/item/ItemPanelCard'
import ItemPanelHeader from '../view/item/ItemPanelHeader'
import ItemList from '../view/record/ItemList'

@Entry
@Component
struct ItemPage {
  @State topBarRightText: string = '早餐'
  @State showPanel: boolean = false
  @State amount: number = 1

  onPanelShow() {
    this.showPanel = true
  }

  build() {
    Column() {
      // 1.导航条
      this.headerBar(this.topBarRightText)
      // 2.列表
      ItemList({ showPanel: this.onPanelShow.bind(this) })
        // 不加这个面板展示不出来
        .layoutWeight(1)
      // 3.底部弹出面板
      Panel(this.showPanel) {
        // 3.1.头部文本 + 弹窗
        ItemPanelHeader()
        // 3.2 食物、运动信息卡片
        ItemPanelCard({ amount: this.amount })
        // 3.3 自定义数字键盘

        // 3.4 键盘
        // Button('关闭').onClick(() => this.showPanel = false)
      }
      // 默认展示全屏
      .mode(PanelMode.Full)
      // 设置不可以调整
      .dragBar(false)
      // 背景
      .backgroundMask($r('app.color.light_gray'))
      .backgroundColor(Color.White)
    }
    .width(CommonConstants.THOUSANDTH_1000)
    .height(CommonConstants.THOUSANDTH_1000)
  }

  @Builder headerBar(topBarRightText: string) {
    Row() {
      Image($r('app.media.ic_public_back'))
        .width(24)
        .onClick(() => {
          router.back()
        })
      Blank()
      Text(topBarRightText)
        .fontWeight(FontWeight.Bold)
        .fontSize(20)
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height(60)
    .alignItems(VerticalAlign.Center)

  }
}
