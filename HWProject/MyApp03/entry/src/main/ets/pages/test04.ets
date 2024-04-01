@Entry
@Component
struct UITest03 {
  @State textSize: number = 50
  textValue = 'Hello ArkTS'

  /**
   * 增加字体大小
   */
  myAddClickHandler(): void {
    this.textSize += 5
  }

  /**
   * 减少字体大小
   */
  myReduceClickHandler(): void {
    this.textSize -= 5
  }

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
        .onClick(this.myAddClickHandler
          .bind(this))

      Button('减少字体')
        .height(50)
        .width(100)
        .margin({ top: 50 })
        .onClick(this.myReduceClickHandler
          .bind(this))
    }
  }
}