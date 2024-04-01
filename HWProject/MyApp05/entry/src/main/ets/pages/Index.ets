import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State message: string = '第一个页面'
  @State backMsg: string = ''

  onPageShow() {
    // 当当前页面显示的时候，自动回调函数
    let record = router.getParams() as Record<string, string>
    if (record) {
      this.backMsg = record['backMsg']
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)

        Text(this.backMsg)
          .fontSize(20)
          .fontColor(Color.Gray)

        Button("跳转到第二个页面")
          .width('80%')
          .fontSize(18)
          .height(50)
          .margin({
            top: 30
          })
          .onClick(() => {
            router.pushUrl({
              url: 'pages/SecondPage',
              params: {
                sendMsg: "123321"
              } })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}