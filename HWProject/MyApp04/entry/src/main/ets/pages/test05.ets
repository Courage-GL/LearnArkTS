// 自定义一个构建函数
// 按照引用传参
@Builder
function MyBuilder($$: {
  userName: string
}) {
  Column() {
    Text('Hello' + $$.userName)
      .fontSize(50)
      .margin(20)
  }
}

@Entry
@Component
struct Parent {
  @State personName: string = '张三'

  build() {
    Column() {
      MyBuilder({ userName: this.personName })
      Divider()
      Button('改变值').onClick(()=>{
        this.personName = '李四'
      })
    }
  }
}