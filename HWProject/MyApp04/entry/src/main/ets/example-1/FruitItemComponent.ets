// 自定义列表项子组件
@Component
export struct FruitItemComponent {
  private index: number
  private name: string
  private vote: string
  // 该行数据是否选中
  @State isChoose: boolean = false

  build() {
    Row() {
      Column() {
        // 第一部分排名
        if (this.isCircleText()) {
          // 圆形文本框
          this.CreateCircleText(this.index)
        } else {
          //普通文本框
          Text(this.index.toString())
            .fontWeight(400)
            .fontSize(16)
            .fontColor(this.isChoose ? Color.Blue : Color.Black)
            .lineHeight(24)
            .width(24)
        }
      }.width("20%")
      .alignItems(HorizontalAlign.Start)

      // 第二部分名称
      Text(this.name)
        .fontWeight(500)
        .fontSize(20)
        .fontColor(this.isChoose ? Color.Blue : Color.Black)
        .lineHeight(24)
        .width('50%')
      // 第三部分数量
      Text(this.vote)
        .fontWeight(500)
        .fontSize(20)
        .fontColor(this.isChoose ? Color.Blue : Color.Black)
        .lineHeight(24)
        .width('30%')
    }
    .width('100%')
    .height(50)
    .onClick(() => {
      // 选中该行之后 颜色改变
      this.isChoose = !this.isChoose
    })
  }

  // 判断排名是否为前三名
  isCircleText(): boolean {
    return this.index === 1 || this.index === 2 || this.index === 3
  }

  // 圆形文本框构建函数
  @Builder CreateCircleText(index: number) {
    Row() {
      Text(index.toString())
        .fontWeight(400)
        .fontSize(16)
        .fontColor(Color.White)
    }
    // 文本居中
    .justifyContent(FlexAlign.Center)
    // 画圆
    .borderRadius(24)
    .size({ width: 24, height: 24 })
    .backgroundColor(Color.Brown)
  }
}