@Component
struct MyChild {
  label: string

  build() {
    Text(this.label)
      .fontSize(30)
  }
}


@Entry
@Component
struct MyParent {
  @State myArray: Array<string> = ['1', '2', '3']

  build() {
    Column() {

      ForEach(this.myArray, (item: string, index: number) => {
        MyChild({ label: item + index })
          .margin(20)
      })

      Button('点击修改第二个值').fontSize(24).fontColor(Color.Red).onClick(() => {
        this.myArray[1] = "new Value"
      })
    }.justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .width('100%')
    .height('100%')
  }
}