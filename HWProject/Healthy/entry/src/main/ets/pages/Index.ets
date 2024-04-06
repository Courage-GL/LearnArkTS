import BreakpointType from '../common/bean/BreakpointType'
import BreakpointConstants from '../common/constants/BreakpointConstants'
import { CommonConstants } from '../common/constants/CommonConstants'
import BreakpointSystem from '../common/utils/BreakpointSystem'
import { RecordPage } from './RecordPage'

@Entry
@Component
struct Index {
  @State currentIndex: number = 0
  private breakpointSystem: BreakpointSystem = new BreakpointSystem()
  @StorageProp('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_SM

  aboutToAppear() {
    this.breakpointSystem.register()
  }

  aboutToDisappear() {
    this.breakpointSystem.unRegister()
  }

  chooseBarPosition() {
    // 通过键值队 取消ifelse判断
    return new BreakpointType({
      sm: BarPosition.End,
      md: BarPosition.Start,
      lg: BarPosition.Start
    }).getValue(this.currentBreakpoint)
  }

  build() {
    Tabs({ barPosition: this.chooseBarPosition() }) {
      TabContent() {
        RecordPage()
      }.tabBar(this.TabBuilder($r('app.string.tab_record'), $r('app.media.ic_calendar'), 0))

      TabContent() {
        Text($r('app.string.tab_discover'))
      }.tabBar(this.TabBuilder($r('app.string.tab_discover'), $r('app.media.discover'), 1))

      TabContent() {
        Text($r('app.string.tab_user'))
      }.tabBar(this.TabBuilder($r('app.string.tab_user'), $r('app.media.ic_user_portrait'), 2))
    }.onChange((index) => {
      this.currentIndex = index
    })
    .width(CommonConstants.THOUSANDTH_1000)
    .height(CommonConstants.THOUSANDTH_1000)
    .vertical(new BreakpointType({
      sm: false,
      md: true,
      lg: true
    }).getValue(this.currentBreakpoint))
  }

  @Builder TabBuilder(title: Resource, normalIcon: Resource, index: number) {
    Column({ space: 4 }) {
      Image(normalIcon)
        .width(22)
          // 使用fillColor 图片必须是svg格式
        .fillColor(this.selectColor(index))
      Text(title)
        .fontColor(this.selectColor(index))
        .fontSize(14)
    }

  }

  selectColor(index: number): Resource {
    return index === this.currentIndex ? $r('app.color.primary_color') : $r('app.color.tab_default')
  }
}