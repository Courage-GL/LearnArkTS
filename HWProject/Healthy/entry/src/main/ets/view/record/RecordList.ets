import { CommonConstants } from '../../common/constants/CommonConstants'

@Preview
@Component
export default struct RecordList {
  build() {
    List({ space: CommonConstants.SPACE_10 }) {
      ForEach([1, 2, 3, 4, 5], (item) => {
        ListItem() {
          Column() {
            // 1.分组的标题
            Row({ space: CommonConstants.SPACE_4 }) {
              Image($r('app.media.ic_breakfast')).width(24)
              Text('早餐').fontSize(18).fontWeight(CommonConstants.FONT_WEIGHT_700)
              Text('建议423-592').grayText()
              Blank()
              Text('190')
                .fontSize(14)
                .fontWeight(CommonConstants.FONT_WEIGHT_700)
                .fontColor($r('app.color.primary_color'))
              Text('千卡').grayText()
              Image($r('app.media.ic_public_add_norm_filled')).width(24).fillColor($r('app.color.primary_color'))
            }
            .width(CommonConstants.THOUSANDTH_1000)
            // 2.组内记录类表
            List() {
              ForEach([1, 2, 3, 4, 5], (item) => {
                ListItem() {
                  Row({ space: CommonConstants.SPACE_4 }) {
                    Image($r('app.media.toast')).width(50)
                    Column({ space: CommonConstants.DEFAULT_6 }) {
                      Text('全麦吐司').fontWeight(CommonConstants.FONT_WEIGHT_700)
                      Text('1片').grayText()
                    }

                    Blank()
                    Text('91千卡').grayText()
                  }
                  .width(CommonConstants.THOUSANDTH_1000)
                  .margin({
                    top: 10
                  })
                }.swipeAction({ end: this.deleteButton.bind(this) })
              })
            }
          }
          .width(CommonConstants.THOUSANDTH_1000)
          .backgroundColor(Color.White)
          .borderRadius(CommonConstants.DEFAULT_20)
          .padding(CommonConstants.DEFAULT_12)
        }
      })
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height(CommonConstants.THOUSANDTH_1000)
    .margin({
      top: 10
    })

  }

  @Builder deleteButton() {
    Text("删除")
      .fontSize(20)
      .fontColor(Color.White)
      .margin(CommonConstants.SPACE_6)
      .backgroundColor(Color.Red)
      .borderRadius(12)
      .height(CommonConstants.THOUSANDTH_1000)
      .padding({ left: 10, right: 10, top: 4, bottom: 4 })
  }
}

@Extend(Text) function grayText() {
  .fontSize(14)
  .fontColor($r('app.color.light_gray'))
}

