import router from '@ohos.router'
import { CommonConstants } from '../common/constants/CommonConstants'
import ItemList from '../view/record/ItemList'
@Entry
@Component
struct ItemPage {
  @State topBarRightText: string = '早餐'

  build() {
    Column() {
      // 1.导航条
      this.headerBar(this.topBarRightText)
      // 2.列表
     ItemList()
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