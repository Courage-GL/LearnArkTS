// 自定义数据类型
class Person {
  public name: string;
  public age: number;

  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }
}

// 自定义子组件
@Component
struct MyChild {
  @State person: Person = new Person('小胖', 27)
  private increase: number = 1

  build() {
    Column() {
      Text(this.person.name).height(80)
      Text(this.person.age + "").height(80)
      Divider()
      Button('修改名字').onClick(() => {
        this.person.name = this.person.name === '高小胖' ? '小胖' : '高小胖'
      }).height(80).width(250).margin(5)

      Button('增加年龄').onClick(() => {
        this.person.age += this.increase
      }).height(80).width(250).margin(5)
    }
  }
}

@Entry
@Component
struct MyParent {
  build() {
    Column() {
      // 构建两个子组件
      MyChild({ person: new Person('李四', 43) })
      Divider()
      MyChild({ person: new Person('张三', 28), increase: 2 })
    }
  }
}