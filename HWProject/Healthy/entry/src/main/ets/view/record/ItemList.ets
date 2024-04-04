import { CommonConstants } from '../../common/constants/CommonConstants'

@Preview
@Component
export default struct ItemList {
  showPanel:() => void
  build() {
    Tabs() {
      TabContent() {
        this.TabContentBuilder()
      }
      .tabBar('全部')
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height(CommonConstants.THOUSANDTH_1000)
  }

  @Builder TabContentBuilder() {
    List({ space: CommonConstants.SPACE_10 }) {
      ForEach([1, 2, 3, 4, 5], (item) => {
        ListItem() {
          Row({ space: CommonConstants.SPACE_4 }) {
            Image($r('app.media.toast')).width(50)
            Column({ space: CommonConstants.DEFAULT_6 }) {
              Text('全麦吐司').fontWeight(CommonConstants.FONT_WEIGHT_700)
              Text('1片').grayText()
            }

            Blank()
            Image($r("app.media.ic_public_add_norm_filled")).fillColor($r('app.color.primary_color')).width(20)
          }
          .width(CommonConstants.THOUSANDTH_1000)
          .padding(CommonConstants.DEFAULT_6)
        }
       .onClick(()=>{
         this.showPanel()
       })
      })
    }
    .width(CommonConstants.THOUSANDTH_1000)
    .height(CommonConstants.THOUSANDTH_1000)
  }
}

@Extend(Text) function grayText() {
  .fontSize(14)
  .fontColor($r('app.color.light_gray'))
}