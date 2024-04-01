// 自定义标头组件
@Component
export struct FruitTableHeadComponent {
  widthValue: Length = 0 // 组件的宽度
  paddingValue: Padding | Length = 0

  build() {
    Row() {
      Text('排名').fontColor(Color.Gray).fontSize(16).width('20%').fontWeight(400)
      Text('种类').fontColor(Color.Gray).fontSize(16).width('50%').fontWeight(400)
      Text('得票数').fontColor(Color.Gray).fontSize(16).width('30%').fontWeight(400)
    }
    .width(this.widthValue)
    .height(50)
    .padding(this.paddingValue)
  }
}