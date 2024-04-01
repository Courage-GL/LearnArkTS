import { TaskDataModel } from './Models'
import ItemComponent from './ItemComponent'

@Entry
@Component
struct TaskListIndex {
  private totalData: Array<string> = []

  aboutToAppear() {
    this.totalData = new TaskDataModel().getData()
  }

  build() {
    Column({ space: 6 }) {
      Text('待办')
        .fontSize(30)
        .fontColor(Color.Black)
        .lineHeight(33)
        .fontWeight(FontWeight.Bold)
        .width('80%')
        .margin({ top: 24, bottom: 24 })
        .textAlign(TextAlign.Start)

      // 循环渲染
      ForEach(this.totalData, (item: string) => {
        ItemComponent({taskContent:item})
      })
    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}