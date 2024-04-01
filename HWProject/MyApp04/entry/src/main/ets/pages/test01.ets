@Entry
@Component
struct ColumnTest01 {
  build() {
    Column({ space: 5 }) {
      Text('space').width('90%')
      // 默认
      Column({ space: 5 }) {
        Column().width('50%').height(30).backgroundColor(Color.Yellow)
        Column().width('50%').height(30).backgroundColor(Color.Brown)
      }.width('100%').height(100).border({ width: 1 })

      // 设置子元素水平方向对齐
      Text('alignItems(Start)').width('90%')
      Column() {
        Column().width('50%').height(30).backgroundColor(Color.Yellow)
        Column().width('50%').height(30).backgroundColor(Color.Brown)
      }.alignItems(HorizontalAlign.Start).width('90%').border({ width: 1 })


      Text('alignItems(End)').width('90%')
      Column() {
        Column().width('50%').height(30).backgroundColor(Color.Yellow)
        Column().width('50%').height(30).backgroundColor(Color.Brown)
      }.alignItems(HorizontalAlign.End).width('90%').border({ width: 1 })


      Text('alignItems(Center)').width('90%')
      Column() {
        Column().width('50%').height(30).backgroundColor(Color.Yellow)
        Column().width('50%').height(30).backgroundColor(Color.Brown)
      }.alignItems(HorizontalAlign.Center).width('90%').border({ width: 1 })


      // 设置子元素垂直方向的对齐方式
      // Text('justifyContent(Start)').width('90%')
      // Column() {
      //   Column().width('50%').height(30).backgroundColor(Color.Yellow)
      //   Column().width('50%').height(30).backgroundColor(Color.Brown)
      // }.justifyContent(FlexAlign.Start).width('90%').height(120).border({ width: 1 })

      Text('justifyContent(Center)').width('90%')
      Column() {
        Column().width('50%').height(30).backgroundColor(Color.Yellow)
        Column().width('50%').height(30).backgroundColor(Color.Brown)
      }.justifyContent(FlexAlign.Center).width('90%').height(120).border({ width: 1 })


      Text('justifyContent(End)').width('90%')
      Column() {
        Column().width('50%').height(30).backgroundColor(Color.Yellow)
        Column().width('50%').height(30).backgroundColor(Color.Brown)
      }.justifyContent(FlexAlign.End).width('90%').height(120).border({ width: 1 })

    }
  }
}