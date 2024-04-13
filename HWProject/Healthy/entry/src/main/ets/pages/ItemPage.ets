import router from '@ohos.router'
import { CommonConstants } from '../common/constants/CommonConstants'
import { RecordTypeEnum, RecordTypes } from '../model/RecordTypeModel'
import RecordService from '../services/RecordService'
import ItemPanelCard from '../view/item/ItemPanelCard'
import ItemPanelHeader from '../view/item/ItemPanelHeader'
import NumberKeyBoard from '../view/keyboard/NumKeyBoard'
import ItemList from '../view/record/ItemList'
import RecordItem from '../viewmodel/RecordItem'
import RecordType from '../viewmodel/RecordType'

@Entry
@Component
struct ItemPage {
  @State showPanel: boolean = false
  @State amount: number = 1
  // 记录上次输入的值
  @State lastValue: string = ''
  @State item: RecordItem = null
  @State type: RecordType = RecordTypes[0]
  @State isFood: boolean = true

  onPanelShow(item: RecordItem) {
    this.showPanel = true
    // 每次页面打开的时候
    // amount需要初始化成1 lastValue需要清空
    this.amount = 1
    this.lastValue = ''
    this.item = item
  }

  onPageShow() {
    let params: any = router.getParams()
    this.type = params.type
    this.isFood = this.type.id !== RecordTypeEnum.WORKOUT
  }

  build() {
    Column() {
      // 1.导航条
      this.headerBar()
      // 2.列表
      ItemList({ showPanel: this.onPanelShow.bind(this), isFood: this.isFood })
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
              RecordService.insert(this.type.id,this.item.id,this.amount)
                .then(()=>{
                  this.showPanel = false
                })
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

  @Builder headerBar() {
    Row() {
      Image($r('app.media.ic_public_back'))
        .width(24)
        .onClick(() => {
          router.back()
        })
      Blank()
      Text(this.type.name)
        .fontWeight(FontWeight.Bold)
        .fontSize(20)
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height(60)
    .alignItems(VerticalAlign.Center)

  }
}
