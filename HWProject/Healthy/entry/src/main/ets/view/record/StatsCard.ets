import { CommonConstants } from '../../common/constants/CommonConstants'
import DateUtil from '../../common/utils/DateUtil'
import CalorieStats from './CalorieStats'
import  {DatePickDialog } from './DatePickDialog'
import NutrientStats from './NutrientStats'

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
      Swiper(){
        // 1.热量
        CalorieStats()
        // 2.营养素
        NutrientStats()

      }
      .width(CommonConstants.THOUSANDTH_1000)
      .backgroundColor(Color.White)
      .borderRadius(CommonConstants.DEFAULT_20)
      .indicatorStyle({selectedColor:$r('app.color.primary_color')})

    }
    .width(CommonConstants.THOUSANDTH_940)
    .backgroundColor($r('app.color.stats_title_bgc'))
    .borderRadius(CommonConstants.DEFAULT_20)
  }
}