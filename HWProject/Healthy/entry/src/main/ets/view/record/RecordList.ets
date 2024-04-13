import router from '@ohos.router'
import { CommonConstants } from '../../common/constants/CommonConstants'
import RecordService from '../../services/RecordService'
import GroupInfo from '../../viewmodel/GroupInfo'
import RecordType from '../../viewmodel/RecordType'
import RecordVO from '../../viewmodel/RecordVO'

@Preview
@Component
export default struct RecordList {
  @Consume
  @Watch('handleRecordsChange')
  records: RecordVO[]
  @State groups: GroupInfo<RecordType, RecordVO>[] = []

  handleRecordsChange() {
    this.groups = RecordService.calculateGroupInfo(this.records)
  }

  build() {
    List({ space: CommonConstants.SPACE_10 }) {
      ForEach(this.groups, (item: GroupInfo<RecordType, RecordVO>) => {
        ListItem() {
          Column() {
            // 1.分组的标题
            Row({ space: CommonConstants.SPACE_4 }) {
              Image(item.type.icon).width(24)
              Text(item.type.name).fontSize(18).fontWeight(CommonConstants.FONT_WEIGHT_700)
              Text(`建议${item.type.min}~${item.type.max}千卡`).grayText()
              Blank()
              Text(item.calorie.toFixed(1))
                .fontSize(14)
                .fontWeight(CommonConstants.FONT_WEIGHT_700)
                .fontColor($r('app.color.primary_color'))
              Text('千卡').grayText()
              Image($r('app.media.ic_public_add_norm_filled')).width(24).fillColor($r('app.color.primary_color'))
            }
            .width(CommonConstants.THOUSANDTH_1000)
            .onClick(() => {
              router.pushUrl({
                url: 'pages/ItemPage',
                params: { type: item.type }
              })
            })
            // 2.组内记录类表
            List() {
              ForEach(item.items, (record: RecordVO) => {
                ListItem() {
                  Row({ space: CommonConstants.SPACE_4 }) {
                    Image(record.recordItem.image).width(50)
                    Column({ space: CommonConstants.DEFAULT_6 }) {
                      Text(record.recordItem.name).fontWeight(CommonConstants.FONT_WEIGHT_700)
                      Text(`${record.amount}/${record.recordItem.unit}`).grayText()
                    }

                    Blank()
                    Text(`${record.calorie}千卡`).grayText()
                  }
                  .width(CommonConstants.THOUSANDTH_1000)
                  .margin({
                    top: 10
                  })
                }.swipeAction({ end: this.deleteButton.bind(this) })
              })
            }
          }
          .width(CommonConstants.THOUSANDTH_1000)
          .backgroundColor(Color.White)
          .borderRadius(CommonConstants.DEFAULT_20)
          .padding(CommonConstants.DEFAULT_12)
        }
      })
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height(CommonConstants.THOUSANDTH_1000)
    .margin({
      top: 10
    })

  }

  @Builder deleteButton() {
    Text("删除")
      .fontSize(20)
      .fontColor(Color.White)
      .margin(CommonConstants.SPACE_6)
      .backgroundColor(Color.Red)
      .borderRadius(12)
      .height(CommonConstants.THOUSANDTH_1000)
      .padding({ left: 10, right: 10, top: 4, bottom: 4 })
  }
}

@Extend(Text) function grayText() {
  .fontSize(14)
  .fontColor($r('app.color.light_gray'))
}


