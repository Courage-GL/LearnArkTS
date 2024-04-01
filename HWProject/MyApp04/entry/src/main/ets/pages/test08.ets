@Component
struct MyChild {
  // 子组件年龄修改父组件不变，父组件年龄修改 子组件跟着变
  @Prop age: number
  private increase: number = 1

  build() {
    Column() {
      if (this.age >= 18) {
        Text('子组件中的age已经成年了: ' + this.age).height(80)
      } else {
        Text('子组件中的age还未成年: ' + this.age).height(80)
      }

      Button('-修改子组件的age').onClick(() => {
        this.age -= this.increase
      }).height(80).width(200).margin(5)
    }
  }
}


@Entry
@Component
struct MyParent {
  @State initAge: number = 18

  build() {
    Column() {
      Text('父组件中的初始age为：' + this.initAge).height(80)
      Button('+修改父组件的age').onClick(() => {
        this.initAge += 1
      }).height(80).width(200).margin(5)
      MyChild({ age: this.initAge, increase: 2 })
    }
  }
}