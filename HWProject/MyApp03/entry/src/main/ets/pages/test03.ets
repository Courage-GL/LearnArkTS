@Entry
@Component
struct UITest03 {
  @State textSize: number = 50
  textValue = 'Hello ArkTS'

  build() {
    Column() {
      Text(this.textValue)
        .fontSize(this.textSize)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bold)

      Button('增加字体')
        .height(50)
        .width(100)
        .margin({ top: 50 })
        .onClick(function(): void {
          this.textSize += 5
        }.bind(this))

      Button('减少字体')
        .height(50)
        .width(100)
        .margin({ top: 50 })
        .onClick(function(): void{
          this.textSize -= 5
        }.bind(this))
    }
  }
}