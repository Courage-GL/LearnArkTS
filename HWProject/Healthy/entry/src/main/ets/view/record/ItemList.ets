import { CommonConstants } from '../../common/constants/CommonConstants'
import ItemModel from '../../model/ItemModel'
import ItemCategory from '../../viewmodel/ItemCategory'
import RecordItem from '../../viewmodel/RecordItem'

@Preview
@Component
export default struct ItemList {
  showPanel: () => void
  @State isFood: boolean = true
  data = [
    {
      type: new ItemCategory(0, '主食'),
      items: []
    },
    {
      type: new ItemCategory(0, '果蔬'),
      items: []
    },
    {
      type: new ItemCategory(0, '肉蛋奶'),
      items: []
    },
    {
      type: new ItemCategory(0, '坚果'),
      items: []
    },
    {
      type: new ItemCategory(0, '其它'),
      items: []
    },
  ]

  build() {
    Tabs() {
      TabContent() {
        this.TabContentBuilder(ItemModel.list(this.isFood))
      }
      .tabBar('全部')

      ForEach(this.data, (group) => {
        TabContent() {
          this.TabContentBuilder(ItemModel.list(this.isFood))
        }
        .tabBar(group.type.name)
      })
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height(CommonConstants.THOUSANDTH_1000)
  }

  @Builder TabContentBuilder(items: RecordItem[]) {
    List({ space: CommonConstants.SPACE_10 }) {
      ForEach(items, (item: RecordItem) => {
        ListItem() {
          Row({ space: CommonConstants.SPACE_12 }) {
            Image(item.image).width(50)
            Column({ space: CommonConstants.DEFAULT_6 }) {
              Text(item.name).fontWeight(CommonConstants.FONT_WEIGHT_700)
              Text(`${item.calorie}千卡/${item.unit}`).grayText()
            }
            .alignItems(HorizontalAlign.Start)

            Blank()
            Image($r("app.media.ic_public_add_norm_filled")).fillColor($r('app.color.primary_color')).width(20)
          }
          .width(CommonConstants.THOUSANDTH_1000)
          .padding(CommonConstants.DEFAULT_6)
        }
        .onClick(() => {
          this.showPanel()
        })
      })
    }
    .width(CommonConstants.THOUSANDTH_1000)
    .height(CommonConstants.THOUSANDTH_1000)
  }
}

@Extend(Text) function grayText() {
  .fontSize(14)
  .fontColor($r('app.color.light_gray'))
}