/**
 * web组件用来加载网址
 * 需要申请网络权限
 */
import webview from '@ohos.web.webview'

@Entry
@Component
struct Index {
  // 准备一个web组件的控制器
  private myController: WebviewController = new webview.WebviewController()

  build() {
    Row() {
      Column() {
        Web({
          src: 'https://www.bilibili.com/video/BV1pb4y1g75m?p=45&vd_source=a85202fd8f595cb0052b30d4cf1ab0bb',
          controller: this.myController
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}