import router from '@ohos.router'
import AppContext from '@ohos.app.ability.common'

@Entry
@Component
struct SecondPage {
  @State message: string = '第二个页面'
  @State msg: string = (router.getParams() as Record<string, string>)['sendMsg']

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
        // 展示前一个页面传递过来的数据

        Text("第一个页面传递过来的数据" + this.msg)
          .fontSize(20)
          .fontColor(Color.Gray)

        Button("返回上一个界面")
          .width('80%')
          .fontSize(18)
          .height(50)
          .margin({
            top: 30
          })
          .onClick(() => {
            // let context = getContext(this) as AppContext.UIAbilityContext
            // context.terminateSelf()
            // 确认框
            router.showAlertBeforeBackPage({ message: '确认要返回吗？' })
            // 返回上一个界面
            router.back({
              url: 'pages/Index',
              params: {
                backMsg: '9998887766'
              }
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}