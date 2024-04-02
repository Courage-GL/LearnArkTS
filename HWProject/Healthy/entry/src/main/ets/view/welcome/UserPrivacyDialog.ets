// @Preview 可预览
import { CommonConstants } from '../../common/constants/CommonConstants'

@Preview
@CustomDialog
export default struct UserPrivacyDialog {
  controller: CustomDialogController
  // 定义两个函数
  // 同意
  confirm:() => void
  // 不同意
  refuse:() => void

  build() {
    Column({ space: 12 }) {
      // 1.标题
      Text($r('app.string.user_privacy_title'))
        .fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
      // 2.内容
      Text($r('app.string.user_privacy_content'))
      // 3.按钮
      Row() {
        // 不同意
        Button($r('app.string.refuse_label'))
          .width(100)
          .backgroundColor($r('app.color.lightest_primary_color'))
          .margin({ right: 14 })
          .fontColor($r('app.color.light_gray'))
          .onClick(()=>{
            this.refuse()
            this.controller.close()
          })
        // 同意
        Button($r('app.string.agree_label'))
          .width(100)
          .backgroundColor($r('app.color.primary_color'))
          .onClick(()=>{
            this.confirm()
            this.controller.close()
          })
      }
    }
    .width('100%')
    .padding(10)
  }
}
