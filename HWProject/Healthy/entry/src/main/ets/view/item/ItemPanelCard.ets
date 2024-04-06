import { CommonConstants } from '../../common/constants/CommonConstants'
@Component
export default struct ItemPanelCard {
  @Prop amount: number

  build() {
    Column({ space: CommonConstants.DEFAULT_12 }) {
      Image($r('app.media.toast')).width(150)
      Text('全麦吐司').fontWeight(CommonConstants.FONT_WEIGHT_900)
        .backgroundColor($r('app.color.lightest_primary_color'))
        .borderRadius(20)
        .padding({ top: 6, bottom: 6, left: 12, right: 12 })
      Divider().width(CommonConstants.THOUSANDTH_940).opacity(0.6)
      Row({ space: CommonConstants.DEFAULT_8 }) {
        this.NutrientInfo("热量（千卡）", 91.0)
        this.NutrientInfo("碳水（克）", 15.5)
        this.NutrientInfo("蛋白质（克）", 4.4)
        this.NutrientInfo("脂肪（克）", 1.3)
      }
      .margin({ left: 20, right: 20 })

      Divider().width(CommonConstants.THOUSANDTH_940).opacity(0.6)
      Row({ space: CommonConstants.DEFAULT_12 }) {
        Column({ space: CommonConstants.DEFAULT_6 }) {
          Text(this.amount.toFixed(1))
            .fontSize(50)
            .fontColor($r("app.color.primary_color"))
            .fontWeight(CommonConstants.FONT_WEIGHT_600)

          Divider().color($r("app.color.primary_color"))
            .strokeWidth(3)
        }
        .width(150)

        Text("片")
          .fontSize(20)
          .fontColor($r("app.color.light_gray"))
          .fontWeight(CommonConstants.FONT_WEIGHT_600)

      }.justifyContent(FlexAlign.Center)
      .padding({
        bottom: 20
      })
    }
  }

  @Builder NutrientInfo(label: string, value: number) {
    Column({ space: CommonConstants.DEFAULT_6 }) {
      Text(label).fontSize(14)
        .fontColor($r('app.color.light_gray'))
      Text((this.amount * value).toFixed(1))
        .fontSize(18)
        .fontColor(Color.Black)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
    }
  }
}