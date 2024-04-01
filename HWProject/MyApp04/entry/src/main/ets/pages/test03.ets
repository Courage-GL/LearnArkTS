@Component
  // 自定义组件
struct MyCustomComponent {
  @State username: string = '张三'

  build() {
    Column() {
      Text('hello ' + this.username)
        .fontSize(30)
        .width(200)
        .height(50)
        .onClick(() => {
          this.username = "李四"
        })
    }
  }
}


@Entry
@Component
struct Test03 {
  build() {
    Column({ space: 5 }) {
      Text('我的主UI界面')
        .fontSize(50)
        .height(100)
        .fontWeight(FontWeight.Bold)

      MyCustomComponent()
      Divider()
      MyCustomComponent({ username: '小胖' })
      Divider()
      MyCustomComponent({ username: '大瘦' })
    }
  }
}
