import { CommonConstants } from '../common/constants/CommonConstants'
import RecordList from '../view/record/RecordList'
import { SearchHeader } from '../view/record/SearchHeader'
import { StatsCard } from '../view/record/StatsCard'

@Preview
@Component
export struct RecordPage {
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