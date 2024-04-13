import { CommonConstants } from '../common/constants/CommonConstants'
import DateUtil from '../common/utils/DateUtil'
import RecordService from '../services/RecordService'
import RecordList from '../view/record/RecordList'
import { SearchHeader } from '../view/record/SearchHeader'
import { StatsCard } from '../view/record/StatsCard'
import RecordVO from '../viewmodel/RecordVO'

@Preview
@Component
export struct RecordPage {
  @StorageProp('SELECTED_DATE')
  @Watch('aboutToAppear')
  selectedDate: number = DateUtil.beginTimeOfDay(new Date())
  @Provide records: RecordVO[] = null
  @Prop @Watch('handlePageShow') isPageShow: boolean

  async aboutToAppear() {
    this.records = await RecordService.queryRecordByDate(this.selectedDate)
  }

  handlePageShow() {
    if (this.isPageShow){
      this.aboutToAppear()
    }
  }

  build() {
    Column() {
      //   1.头部搜索栏
      SearchHeader({ unReadCount: 25 })
      //   2.统计卡片
      StatsCard()
      //   3.记录类表
      RecordList().layoutWeight(1)

    }
    .width(CommonConstants.THOUSANDTH_1000)
    .height(CommonConstants.THOUSANDTH_1000)
    .backgroundColor($r('app.color.index_page_background'))
  }
}