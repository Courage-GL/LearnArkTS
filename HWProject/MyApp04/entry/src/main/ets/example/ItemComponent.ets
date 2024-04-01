import media from '@ohos.multimedia.media'

@Component
export default struct ItemComponent {
  // 是否完成该任务的标记
  @State isComplete: boolean = false
  private taskContent: string // 代办任务的内容
  // 定义图标构建函数
  @Builder CreateIcon(icon: Resource) {
    Image(icon)
      .width(28)
      .height(28)
      .objectFit(ImageFit.Contain)
      .margin(20)
  }

  build() {
    Row() {
      // 图标
      if (this.isComplete) {
        this.CreateIcon($r('app.media.ic_ok'))
      } else {
        this.CreateIcon($r('app.media.ic_default'))
      }
      // 文字
      Text(this.taskContent)
        .fontSize(20)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
          // 根据任务是否完成还确定是否展示删除线
        .decoration({ type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None })
          // 透明度 0.5 半透明 1不透明
        .opacity(this.isComplete ? 0.5 : 1)
    }
    .borderRadius(20)
    .backgroundColor(Color.White)
    .width('93%')
    .height(60)
    .onClick(() => {
      this.isComplete = !this.isComplete
    })
  }
}