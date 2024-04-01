// 自定义按钮状态类型
class ButtonState {
  value: string
  width: number = 0

  constructor(value: string, width: number) {
    this.value = value
    this.width = width
  }
}


@Component
struct MyChildGreenButton {
  // 拥有绿色按钮的组件
  @Link // Link装饰器实现双向同步
  buttonSate: ButtonState

  build() {
    Button(this.buttonSate.value)
      .width(this.buttonSate.width)
      .height(150)
      .backgroundColor(Color.Green)
      .onClick(() => {
        if (this.buttonSate.width < 700) {
          this.buttonSate.width += 100
        } else {
          this.buttonSate = new ButtonState('绿色按钮', 100)
        }
      })
  }
}

@Component
struct MyChildRedButton {
  // 拥有绿色按钮的组件
  @Link // Link装饰器实现双向同步
  value: string
  @Link
  myWidth: number

  build() {
    Button(this.value)
      .width(this.myWidth)
      .height(150)
      .backgroundColor(Color.Red)
      .onClick(() => {
        this.myWidth += 50
      })
  }
}

@Entry
@Component
struct MyParent {
  @State parentGreenButtonSata: ButtonState = new ButtonState('一号子组件', 300)
  @State parentValue: string = '二号子组件'
  @State parentRedWidth: number = 200

  build() {
    Column() {
      Button('父组件修改红色子组件的宽度：' + this.parentRedWidth).onClick(() => {
        this.parentRedWidth = this.parentRedWidth < 700 ? this.parentRedWidth += 100 : 100
      })

      Button('父组件修改绿色子组件的宽度：' + this.parentGreenButtonSata.width).onClick(() => {
        this.parentGreenButtonSata.width = this.parentGreenButtonSata.width < 700 ? this.parentGreenButtonSata.width += 100 : 100
      })

      Divider()
      MyChildRedButton({ value: $parentValue, myWidth: $parentRedWidth })
      Divider()
      MyChildGreenButton({ buttonSate: $parentGreenButtonSata })

    }
  }
}