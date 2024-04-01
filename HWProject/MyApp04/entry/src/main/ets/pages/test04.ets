// 自定义组件
import router from '@ohos.router'

@Component
struct MyChildComponent {
  @State userName: string = '小胖'

  // 组件被创建回调函数
  aboutToAppear() {
    console.error('MyChildComponent组件被创建')
  }

  aboutToDisappear() {
    console.error('MyChildComponent组件被摧毁')
  }

  build() {
    Column() {
      Text('hello' + this.userName)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.userName = '高小胖'
        })
    }
  }
}


@Entry
@Component
struct Test04 {
  @State isShow: boolean = true

  aboutToAppear() {
    console.error('Test04组件被创建')
  }

  aboutToDisappear() {
    console.error('Test04组件被销毁')
  }

  onPageShow() {
    console.error('Test04页面展示')
  }

  onPageHide() {
    console.error('Test04页面隐藏')
  }

  onBackPress() {
    console.error('Test04页面返回')
  }

  build() {
    Column() {
      Text('我的主页面TEST04')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      // 自定义组件
      if (this.isShow) {
        MyChildComponent()
      }

      // 点击按钮改变
      Button('显示/隐藏子组件').onClick(() => {
        this.isShow = !this.isShow
      })
      Divider()
      // 跳转到另外一个界面，把当前界面隐藏
      Button('跳转新页面').onClick(() => {
        router.pushUrl({ url: 'pages/Index' })
      })
    }
  }
}

