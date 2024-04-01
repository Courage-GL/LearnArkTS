@Entry
@Component
struct RowTest01 {
  build() {
    Column({ space: 5 }) {
      Text('space').width('90%')
      Row({ space: 5 }) {
        Row().width('30%').height(50).backgroundColor(Color.Red)
        Row().width('30%').height(50).backgroundColor(Color.Green)
      }.width('90%').height(107).border({ width: 1 })
      // 设置子元素垂直方向对齐方式
      Text('alignItems(Bottom)').width('90%')
      Row() {
        Row().width('30%').height(50).backgroundColor(Color.Red)
        Row().width('30%').height(50).backgroundColor(Color.Green)
      }.width('90%').alignItems(VerticalAlign.Bottom).height(107).border({ width: 1 })

      Text('alignItems(Center)').width('90%')
      Row() {
        Row().width('30%').height(50).backgroundColor(Color.Red)
        Row().width('30%').height(50).backgroundColor(Color.Green)
      }.width('90%').alignItems(VerticalAlign.Center).justifyContent(FlexAlign.Center).height(107).border({ width: 1 })

    }
  }
}