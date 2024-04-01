@Entry
@Component
struct Index {
  @State personName: string = '张三'

  build() {
    Row() {
      Column() {
        Text('hello ' + this.personName)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        // 分割组件
        Divider()
        Button("点我一下")
          .onClick(() => {
            this.personName = "李四"
          }).height(50)
          .width(100)
          .margin({ top: 20 })
      }
      .width('100%')
    }
    .height('100%')
  }
}