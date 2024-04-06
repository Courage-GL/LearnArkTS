import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default struct NumberKeyBoard {
  @Link inputAmount: number
  @Link lastInputValue: string
  numbers: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.']

  build() {
    Grid() {
      ForEach(this.numbers, (item) => {
        GridItem() {
          Text(item).fontWeight(CommonConstants.FONT_WEIGHT_900).fontSize(20)
        }
        .keyBoxStyle()

      })
      GridItem() {
        Text("删除").fontWeight(CommonConstants.FONT_WEIGHT_900).fontSize(20)
      }
      .keyBoxStyle()
    }
    .width(CommonConstants.THOUSANDTH_1000)
    .height(280)
    .backgroundColor($r('app.color.index_page_background'))
    // 三列 1:1:1
    .columnsTemplate('1fr 1fr 1fr')
    .columnsGap(8)
    .rowsGap(8)
    .padding(8)
  }

  @Styles keyBoxStyle(){
    .backgroundColor(Color.White)
    .height(50)
    .borderRadius(CommonConstants.DEFAULT_8)
  }
}