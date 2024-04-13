import BreakpointType from '../../common/bean/BreakpointType'
import BreakpointConstants from '../../common/constants/BreakpointConstants'
import { CommonConstants } from '../../common/constants/CommonConstants'
import DateUtil from '../../common/utils/DateUtil'
import RecordService from '../../services/RecordService'
import RecordVO from '../../viewmodel/RecordVO'
import StatsInfo from '../../viewmodel/StatsInfo'
import CalorieStats from './CalorieStats'
import { DatePickDialog } from './DatePickDialog'
import NutrientStats from './NutrientStats'

@Preview
@Component
export struct StatsCard {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_SM
  @StorageProp('SELECTED_DATE') currentDate: number = DateUtil.beginTimeOfDay(new Date())
  @State info: StatsInfo = new StatsInfo()
  @Consume
  @Watch('handleRecordsChange')
  records: RecordVO[]

  handleRecordsChange() {
    this.info = RecordService.calculateStatsInfo(this.records)
  }

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
      .width(CommonConstants.THOUSANDTH_1000)
      .onClick(() => {
        this.controller.open()
      })
      // 2.统计信息
      Swiper() {
        // 1.热量
        CalorieStats({ intake: this.info.intake, expend: this.info.expend })
        // 2.营养素
        NutrientStats({ carbon: this.info.carbon, protein: this.info.protein, fat: this.info.fat })
      }
      .displayCount(new BreakpointType({
        sm: 1,
        md: 1,
        lg: 2
      }).getValue(this.currentBreakpoint))
      .width(CommonConstants.THOUSANDTH_1000)
      .backgroundColor(Color.White)
      .borderRadius(CommonConstants.DEFAULT_20)
      .indicatorStyle({ selectedColor: $r('app.color.primary_color') })

    }
    .width(CommonConstants.THOUSANDTH_940)
    .backgroundColor($r('app.color.stats_title_bgc'))
    .borderRadius(CommonConstants.DEFAULT_20)
  }
}