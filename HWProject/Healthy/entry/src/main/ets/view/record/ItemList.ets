import { CommonConstants } from '../../common/constants/CommonConstants'
import ItemModel from '../../model/ItemModel'
import GroupInfo from '../../viewmodel/GroupInfo'
import ItemCategory from '../../viewmodel/ItemCategory'
import RecordItem from '../../viewmodel/RecordItem'

@Preview
@Component
export default struct ItemList {
  showPanel: () => void
  @State isFood: boolean = true

  build() {
    Tabs() {
      TabContent() {
        this.TabContentBuilder(ItemModel.list(this.isFood))
      }
      .tabBar('全部')

      ForEach(ItemModel.listItemGroupByCategory(this.isFood), (group: GroupInfo) => {
        TabContent() {
          this.TabContentBuilder(group.items)
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