import { CommonConstants } from '../../common/constants/CommonConstants'

@Preview
@CustomDialog
export struct DatePickDialog {
  selectedDate: Date = new Date()
  controller: CustomDialogController

  build() {
    Column({ space: 12 }) {
      // 1.日期选择器
      DatePicker({
        start: new Date('2020-1-1'),
        end: new Date('2099-12-31'),
        selected: this.selectedDate
      }).onChange((value: DatePickerResult) => {
        this.selectedDate.setFullYear(value.year, value.month, value.day)
      })

      //   2.按钮
      Row() {
        // 取消
        Button('取消')
          .width(100)
          .backgroundColor($r('app.color.lightest_primary_color'))
          .margin({ right: 14 })
          .fontColor($r('app.color.light_gray'))
          .onClick(() => {
            this.controller.close()
          })
        // 确定
        Button('确定')
          .width(100)
          .backgroundColor($r('app.color.primary_color'))
          .onClick(() => {
            // 1.保存日期到全局存储
            AppStorage.SetOrCreate(CommonConstants.SELECTED_DATE, this.selectedDate.getTime())
            // 2.关闭窗口
            this.controller.close()
          })
      }
    }
    .padding(CommonConstants.SPACE_12)
  }
}