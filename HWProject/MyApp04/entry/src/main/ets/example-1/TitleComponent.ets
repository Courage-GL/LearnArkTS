 import AppContext from '@ohos.app.ability.common'
// 自定义标题组件
@Component
export struct FruitTitle {
  @State title: string = ''
  // 定义一个共享变量，是否刷新数据
  @Link isRefreshData: boolean

  build() {
    Row() {
      Row() {
        Image($r('app.media.back')).onClick(() => {
          //退出App
          let context = getContext(this) as AppContext.UIAbilityContext
          // 关闭当前组件
          context.terminateSelf()
        }).width(40)
          .height(21)
          .margin({ right: 10 })
        Text(this.title)
          .fontWeight(FontWeight.Bold)
          .fontSize('22.00fp')
          .fontColor(Color.Black)
      }
      .height('100%')
      .width('50%')
      // 居左对齐
      .justifyContent(FlexAlign.Start)

      Row() {
        Image($r('app.media.loading'))
          .width(21)
          .height(21)
          .margin({ right: 12 })
          .onClick(() => {
            this.isRefreshData = !this.isRefreshData
          })
      }
      .height('100%')
      .width('50%')
      // 居左对齐
      .justifyContent(FlexAlign.End)

    }
    .width('100%')
    .height(50)
    .padding({ left: 20, right: 20 })
    .margin({ top: 10, bottom: 10 })
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }
}