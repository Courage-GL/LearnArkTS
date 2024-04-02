import { RecordPage } from './RecordPage'
@Entry
@Component
struct Index {
  @State currentIndex: number = 0

  build() {
    Tabs({ barPosition: BarPosition.End }) {
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
    .width('100%')
    .height('100%')
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