import common from '@ohos.app.ability.common'
import router from '@ohos.router'
import { CommonConstants } from '../common/constants/CommonConstants'
import PreferenceUtil from '../common/utils/PreferenceUtil'
import UserPrivacyDialog from '../view/welcome/UserPrivacyDialog'

@Entry
@Component
struct WelcomePage {
  context = getContext(this) as common.UIAbilityContext
  controller: CustomDialogController = new CustomDialogController({
    builder: UserPrivacyDialog({
      confirm: () => this.onConfirm(),
      refuse: () => this.onRefuse()
    })
  })

  onConfirm() {
    //  1.保存首选项 跳转到首页
    console.log("aaaa", '同意')
    PreferenceUtil.putPreferenceValue(CommonConstants.PREF_KEY, true)
    this.jumpToIndex()
  }

  onRefuse() {
    // 拒绝时，退出App
    console.log("aaaa", '不同意')
    PreferenceUtil.putPreferenceValue(CommonConstants.PREF_KEY, false)
    this.context.terminateSelf()
  }

  async aboutToAppear() {
    let isAgree = await PreferenceUtil.getPreferenceValue(CommonConstants.PREF_KEY, false)
    // 1.加载首选项
    //2. 判断是否同意
    if (isAgree) {
      // 已同意 跳转主页 面
      this.jumpToIndex()
    } else {
      // 未同意 弹窗提示
      this.controller.open()
    }
  }

  jumpToIndex() {
    setTimeout(() => {
      router.replaceUrl({
        url: 'pages/Index'
      })
    }, 1000)
  }

  build() {
    Column({ space: 10 }) {
      // 1.中央logo
      Row() {
        Image($r('app.media.home_slogan')).width(260)
      }
      // 设置权重 占据剩下所有空间
      .layoutWeight(1)

      Image($r('app.media.home_logo')).width(150)
      Row() {
        Text("健康支持").opacityWhiteText(0.8, 12)
        Text("IPV6").opacityWhiteText(0.8, 10)
          // 实线边框
          .border({
            style: BorderStyle.Solid, width: 1, color: Color.White
          })
          .borderRadius(16)
          .padding({
            left: 4, right: 4, top: 1, bottom: 1
          })
        Text("网络").opacityWhiteText(0.8, 12)
      }

      Text("健康APP希望通过软件工具的形式，帮助用户实线身材管理").opacityWhiteText(0.6, 12)

      Text("沪ICP备0000000001号-00A").opacityWhiteText(0.6, 12).margin({
        bottom: 30
      })

    }
    .width(CommonConstants.THOUSANDTH_1000)
    .height(CommonConstants.THOUSANDTH_1000)
    .backgroundColor($r('app.color.welcome_page_background'))
  }
}

// 公共属性抽取
@Extend(Text) function opacityWhiteText(opacity: number, fontSize: number) {
  .fontColor(Color.White).fontSize(fontSize).opacity(opacity)
}