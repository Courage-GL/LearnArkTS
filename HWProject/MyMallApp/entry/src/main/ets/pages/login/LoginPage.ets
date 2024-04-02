/**
 * 登录页面
 */
import CommonConstants from '../CommonConstants'
import prompt from '@ohos.promptAction'
import router from '@ohos.router'
/**
 * 自定义输入框的样式
 */
@Extend(TextInput) function inputStyle() {
  .placeholderColor(Color.Gray)
  .height(40)
  .fontSize(20)
  .width('90%')
  .margin({
    left: 20, bottom: 10, right: 20
  })
}


/**
 * 自定义文本样式
 */
@Extend(Text) function blueTextStyle() {
  .fontColor(Color.Blue)
  .fontSize(14)
  .fontWeight(400)
  .margin({ top: 12, left: 8, right: 8 })
}

@Entry
@Component
struct LoginPage {
  @State account: string = ''
  @State password: string = ''
  @State isShowProgress: boolean = false
  private timeOutId: number = -1 // 控制登录超时时间

  build() {
    Column() {
      Image($r('app.media.ic_love'))
        .width(80)
        .height(80)
        .margin({
          top: 110,
          bottom: 20
        })
      Text('登录界面')
        .fontWeight(FontWeight.Bold)
        .fontSize(26)

      Text('登录账号以使用更多服务')
        .fontSize(16)
        .fontWeight(FontWeight.Normal)
        .fontColor(Color.Gray)
        .margin({ top: 10, bottom: 50 })

      // 账号输入框
      TextInput({ placeholder: '请输入您的账号' }).inputStyle()
        .maxLength(CommonConstants.INPUT_ACCOUNT_LENGTH)
        .type(InputType.Number)
        .onChange((inputValue: string) => {
          this.account = inputValue
        })
      // Line().lineStyle()

      TextInput({ placeholder: '请输入您的密码' })
        .inputStyle()
        .maxLength(CommonConstants.INPUT_PWD_LENGTH)
        .type(InputType.Password)
        .onChange((inputValue: string) => {
          this.password = inputValue
        })
        .margin({
          top: 8
        })
      // Line().lineStyle()

      Row() {
        Text('短信验证码登录').blueTextStyle()
        Text('忘记密码').blueTextStyle()
      }
      // 设置左右平分
      .justifyContent(FlexAlign.SpaceBetween)
      .width(CommonConstants.FULL_PARENT)
      .padding({
        left: 24, right: 24
      })
      //
      Button('登录', { type: ButtonType.Capsule })
        .width('90%')
        .height(48)
        .fontSize(20)
        .fontWeight(400)
        .backgroundColor(Color.Blue)
        .margin({ top: 80, left: 40, right: 40 })
        .onClick(() => {
          // 触发登录事件
          this.login();
        })
      Text('注册账号').blueTextStyle().margin({
        top: 20
      })

      if (this.isShowProgress) {
        // 圆圈形状的进度条
        LoadingProgress().color(Color.Blue).width(30).height(30).margin({
          top: 10
        })
      }

      Text('其它登录方式').fontColor(Color.Gray).fontSize(10).margin({
        top: 45, bottom: 12
      })

      Row({ space: 35 }) {
        this.imageBtn($r('app.media.wechat'))
        this.imageBtn($r('app.media.qq'))
        this.imageBtn($r('app.media.sina'))
      }

    }.width('100%')
    .height('100%')

  }

  @Builder imageBtn(img: Resource) {
    Button({ stateEffect: true }) {
      Image(img)
    }.height(50)
    .width(50)
    .backgroundColor(null)
  }

  login() {
    if (this.account === '' || this.password === '') {
      prompt.showToast({ message: "用户名、密码不能为空！" })
    } else {
      this.isShowProgress = true
      if (this.timeOutId === -1) {
        // 设置一定两秒定时器
        this.timeOutId = setTimeout(() => {
          // 两秒后执行
          this.isShowProgress = false
          this.timeOutId = -1
          prompt.showToast({ message: '登录成功！页面即将跳转。' })
          router.pushUrl({
            url: 'pages/Index/Index'
          })
        }, 2000)
      }
    }
  }

  aboutToDisappear() {
    // 取消定时器 回收资源
    clearTimeout(this.timeOutId)
  }
}

