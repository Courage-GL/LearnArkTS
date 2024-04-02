import { CommonConstants } from '../../common/constants/CommonConstants'
import DateUtil from '../../common/utils/DateUtil'
import  {DatePickDialog } from './DatePickDialog'

@Preview
@Component
export struct StatsCard {
  @StorageProp("SELECTED_DATE") currentDate: number = DateUtil.beginTimeOfDay(new Date())
  controller: CustomDialogController = new CustomDialogController({
    builder: DatePickDialog({ selectedDate: new Date(this.currentDate)
    })
  })

  build() {
    Column() {
      // 1.日期选择器
      Row() {
        Text(DateUtil.formatDate(this.currentDate)).fontColor($r('app.color.secondary_color')).margin({ left: 12 })
        Image($r('app.media.ic_public_spinner'))
          .width(20)
          .fillColor($r('app.color.secondary_color'))
      }
      .padding(CommonConstants.THOUSANDTH_12)
      .justifyContent(FlexAlign.Start)
      .width('100%')
      .onClick(() => {
        this.controller.open()
      })
      // 2.统计信息

    }
    .width(CommonConstants.THOUSANDTH_940)
    .backgroundColor($r('app.color.stats_title_bgc'))
    .borderRadius(CommonConstants.DEFAULT_20)
  }
}