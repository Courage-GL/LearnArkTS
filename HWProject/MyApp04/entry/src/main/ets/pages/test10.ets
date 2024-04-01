@Component
struct MyChild {
  // 计数器
  @Link counter: number
  label: string

  build() {
    Row() {
      Text(this.label)
        .width(100)
        .height(100)
        .fontSize(20)

      Button('计数器的读数是：' + this.counter)
        .width(200)
        .height(60)
        .onClick(() => {
          this.counter += 1
        })
    }
  }
}

@Entry
@Component
struct MyParent {
  @State flag: boolean = true
  @State myCounter: number = 0;

  build() {
    Column() {
      //根据判断，来确定子组件
      if (this.flag) {
        MyChild({ counter: $myCounter, label: '真真' })
      } else {
        MyChild({ counter: $myCounter, label: '假假' })
      }
      Divider()
      Button('修改flag的值')
        .onClick(() => {
          this.flag = !this.flag
        })
        .width(300)
        .height(60)
        .fontSize(30)
        .margin(40)
    }
  }
}