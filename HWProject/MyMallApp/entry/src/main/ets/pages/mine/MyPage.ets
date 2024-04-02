/**
 * 我的页面
 */
import router from '@ohos.router'

@Entry
@Component
struct MyPage {
  @State totalData: Array<ItemData> = [
    new ItemData($r('app.media.ic_favorite'), '数据管理'),
    new ItemData($r('app.media.ic_menu'), '菜单设置'),
    new ItemData($r('app.media.ic_target'), '关于'),
    new ItemData($r('app.media.ic_recycle'), '清除缓存'),
    new ItemData($r('app.media.ic_privacy'), '隐私协议')
  ]

  loginOut() {
    router.back()
  }

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Text("我的").fontColor(Color.Black).fontSize(30).width('100%').margin({ left: 20, top: 20 })
        Row() {
          Image($r('app.media.ic_love')).width(60).height(60).margin({ left: 20 }).objectFit(ImageFit.Fill)
          Column({ space: 4 }) {
            Text("高小胖！").fontColor(Color.Black).fontSize(20).width('100%')
            Text('XiaoPang19961006').fontColor(Color.Black).fontSize(14).width('100%')
          }.width("80%")
          .height('100%')
          .margin({ left: 20 })
        }
        .width('100%')
        .height(60)
        .justifyContent(FlexAlign.Center)
        .margin({
          top: 20, bottom: 40
        })

        List() {
          ForEach(this.totalData, (item: ItemData) => {
            ListItem() {
              SettingDataBind({ item: item })
            }
          })
        }
        .divider({ strokeWidth: 1 })
        .height("60%")

        Button('退出登录', { type: ButtonType.Capsule })
          .width('90%')
          .height(48)
          .fontSize(14)
          .fontColor(Color.Red)
          .fontWeight(400)
          .backgroundColor('#E7EBEF')
          .margin({ top: 20, left: 40, right: 40 })
          .onClick(() => {
            // 触发登录事件
            this.loginOut();
          })
      }

    }
  }
}

@Component
struct SettingDataBind {
  item: ItemData

  build() {
    Row({ space: 12 }) {
      Image(this.item.icon).width(24).height(24).objectFit(ImageFit.Contain)
      Text(this.item.content).fontSize(16).width('30%')
      Toggle({ type: ToggleType.Switch, isOn: false }).width('80%')
    }
    .width('95%')
    .justifyContent(FlexAlign.Start)
    .borderRadius(12)
    .height(50)
    .alignItems(VerticalAlign.Center)
    .margin({ left: 20, top: 10, right: 20 })
  }
}

class ItemData {
  public content: string // 文字
  public icon: Resource // 图标

  constructor(icon: Resource, content: string) {
    this.icon = icon
    this.content = content
  }
}