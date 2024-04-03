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
            .width('100%')
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
                  .width('100%')
                  .margin({
                    top: 10
                  })
                }
              })
            }
          }
          .width('100%')
          .backgroundColor(Color.White)
          .borderRadius(CommonConstants.DEFAULT_20)
          .padding(CommonConstants.DEFAULT_12)
        }
      })
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height('100%')
    .margin({
      top: 10
    })

  }
}

@Extend(Text) function grayText() {
  .fontSize(14)
  .fontColor($r('app.color.light_gray'))
}


