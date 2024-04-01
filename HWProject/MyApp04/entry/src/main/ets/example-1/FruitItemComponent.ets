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
      Text(this.index + "")
      Text(this.name)
      Text(this.vote)
    }
    .width('100%')
    .height(50)
    .onClick(() => {
      // 选中该行之后 颜色改变
      this.isChoose = !this.isChoose
    })
  }
}