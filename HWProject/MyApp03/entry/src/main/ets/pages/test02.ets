@Entry
@Component
struct UITest02 {
  textValue = "Hello ArkTS"
  textSize = 50
  imageHeight = 800
  imageWidth = 500

  build() {
    Column() {
      Text(this.textValue)
        .fontSize(this.textSize)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bold)

      Image('https://img02.sogoucdn.com/app/a/100520021/46b805167ca269bbfc35922057a14665')
        .width(this.imageWidth)
        .height(this.imageHeight)
    }
  }
}

