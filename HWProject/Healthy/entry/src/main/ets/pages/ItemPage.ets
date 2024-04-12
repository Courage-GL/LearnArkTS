import router from '@ohos.router'
import { CommonConstants } from '../common/constants/CommonConstants'
import ItemPanelCard from '../view/item/ItemPanelCard'
import ItemPanelHeader from '../view/item/ItemPanelHeader'
import NumberKeyBoard from '../view/keyboard/NumKeyBoard'
import ItemList from '../view/record/ItemList'
import RecordItem from '../viewmodel/RecordItem'

@Entry
@Component
struct ItemPage {
  @State topBarRightText: string = '早餐'
  @State showPanel: boolean = false
  @State amount: number = 1
  // 记录上次输入的值
  @State lastValue: string = ''
  @State item: RecordItem = null

  onPanelShow(item: RecordItem) {
    this.showPanel = true
    // 每次页面打开的时候
    // amount需要初始化成1 lastValue需要清空
    this.amount = 1
    this.lastValue = ''
    this.item = item
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
        if (this.item)
          ItemPanelCard({ amount: this.amount, item: $item })
        // 3.3 自定义数字键盘
        // 键盘布局
        NumberKeyBoard({ inputAmount: $amount, lastInputValue: $lastValue })
        // 3.4 按钮
        // Button('关闭').onClick(() => this.showPanel = false)
        Row() {
          Button('取消')
            .width(120)
            .backgroundColor($r('app.color.lightest_primary_color'))
            .type(ButtonType.Normal)
            .fontColor($r('app.color.light_gray'))
            .borderRadius(6)
            .onClick(() => {
              this.showPanel = false
            })
          // 同意
          Button('提交')
            .width(120)
            .type(ButtonType.Normal)
            .backgroundColor($r('app.color.primary_color'))
            .borderRadius(6)
            .onClick(() => {
              this.showPanel = false
            })
        }
        .width('100%')
        .backgroundColor($r('app.color.index_page_background'))
        .justifyContent(FlexAlign.SpaceEvenly)
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
