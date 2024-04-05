import { CommonConstants } from '../../common/constants/CommonConstants'

@Preview
@Component
export default struct ItemPanelHeader {
  build() {
    Row() {
      // 日期
      Text('2024年4月4日 早餐')
        .fontSize(18)
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
      // 图片
      Image($r("app.media.ic_public_spinner"))
        .width(20)
        .fillColor(Color.Black)
    }
    .width(CommonConstants.THOUSANDTH_940)
    .justifyContent(FlexAlign.Center)
  }
}