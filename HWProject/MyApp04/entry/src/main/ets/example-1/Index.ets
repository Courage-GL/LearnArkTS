import { FruitData } from './Models'
import { FruitTitle } from './TitleComponent'
import { FruitTableHeadComponent } from './TableHeadComponent'
import { FruitItemComponent } from './FruitItemComponent'

@Entry
@Component
struct Index {
  @State dataSource1: FruitData[] = [
    new FruitData('1', '苹果', '12580'),
    new FruitData('2', '葡萄', '10320'),
    new FruitData('3', '西瓜', '9801'),
    new FruitData('4', '香蕉', '8431'),
    new FruitData('5', '菠萝', '7546'),
    new FruitData('6', '榴莲', '7432'),
    new FruitData('7', '青葡萄', '888'),
    new FruitData('8', '栗子', '678'),
    new FruitData('9', '杨桃', '666'),
    new FruitData('10', '番石榴', '565'),
    new FruitData('1', '番石榴', '12580'),
    new FruitData('2', '杨桃', '10320'),
    new FruitData('3', '栗子', '9801'),
    new FruitData('4', '香蕉', '8431'),
    new FruitData('5', '菠萝', '7546'),
    new FruitData('6', '榴莲', '7432'),
    new FruitData('7', '青葡萄', '888'),
    new FruitData('8', '栗子熟了', '678'),
    new FruitData('9', '杨桃3号', '666'),
    new FruitData('10', '番石榴2号', '565')
  ]
  @State dataSource2: FruitData[] = [
    new FruitData('1', '番石榴', '12580'),
    new FruitData('2', '杨桃', '10320'),
    new FruitData('3', '栗子', '9801'),
    new FruitData('4', '香蕉', '8431'),
    new FruitData('5', '菠萝', '7546'),
    new FruitData('6', '榴莲', '7432'),
    new FruitData('7', '青葡萄', '888'),
    new FruitData('8', '栗子熟了', '678'),
    new FruitData('9', '杨桃3号', '666'),
    new FruitData('10', '番石榴2号', '565'),
    new FruitData('1', '苹果', '12580'),
    new FruitData('2', '葡萄', '10320'),
    new FruitData('3', '西瓜', '9801'),
    new FruitData('4', '香蕉', '8431'),
    new FruitData('5', '菠萝', '7546'),
    new FruitData('6', '榴莲', '7432'),
    new FruitData('7', '青葡萄', '888'),
    new FruitData('8', '栗子', '678'),
    new FruitData('9', '杨桃', '666'),
    new FruitData('10', '番石榴', '565'),
  ]
  // 是否刷新数据
  @State isSwitchDataSource: boolean = false

  build() {
    Column() {
      FruitTitle({ title: "水果销售排行榜",
        isRefreshData: $isSwitchDataSource })
      FruitTableHeadComponent({ widthValue: '92%',
        paddingValue: { left: 15, right: 15 } })
        .margin({ top: 10, bottom: 4 })
      this.CreateFruitsList()

    }.width('100%')
    .height('100%')
    .backgroundColor("#F1F3F5")
  }

  @Builder CreateFruitsList() {
    Column() {
      List() {
        ForEach(this.isSwitchDataSource ? this.dataSource2 : this.dataSource1, (item: FruitData, index: number) => {
          ListItem() {
            FruitItemComponent({
              index: index + 1,
              name: item.name,
              vote: item.vote })
          }
        })
      }
      .width('100%')
      .height('80%')
      // 分割线
      .divider({ strokeWidth: 1 })
    }.padding({ left: 15, right: 15 })
    .width('92%')
    .borderRadius(20)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(Color.White)
  }
}