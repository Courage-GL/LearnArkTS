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
        .onClick(() => {
          this.clickNum(item)
        })

      })
      GridItem() {
        Text("删除").fontWeight(CommonConstants.FONT_WEIGHT_900).fontSize(20)
      }
      .keyBoxStyle()
      .onClick(() => {
        this.clickDelete()
      })
    }
    .width(CommonConstants.THOUSANDTH_1000)
    .height(260)
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
  // 数字点击事件
  clickNum(num: string) {
    // 拼接用户输入的内容
    let val = this.lastInputValue + num
    // 校验输入格式
    // 从前往后数小数点的位置
    let firstIndex = val.indexOf('.')
    // 从后往前数小数点的位置
    let lastIndex = val.indexOf('.')
    // 如果两个位置不相同 说明小数点不止一个 输入异常 以及小数点位数不能超过两位
    if (firstIndex !== lastIndex || (lastIndex != -1 && lastIndex < val.length - 2)) {
      return
    }
    // 将字符串转为数值
    let amount = this.parseFloat(val)
    // 保存
    if (amount > 999.9) {
      this.inputAmount = 999
      this.lastInputValue = '999'
    } else {
      this.inputAmount = amount
      this.lastInputValue = val
    }

  }
  // 删除按钮点击事件
  clickDelete() {
    if (this.lastInputValue.length <= 0) {
      this.lastInputValue = '0'
      this.inputAmount = 0
      return
    }
    this.lastInputValue = this.lastInputValue.substring(0, this.lastInputValue.length - 1)
    this.inputAmount = this.parseFloat(this.lastInputValue)
  }

  parseFloat(strNum: string) {
    if (!strNum)
      return 0
    if (strNum.endsWith('.')) {
      strNum = strNum.substring(0, strNum.length - 1)
    }
    return parseFloat(strNum)
  }
}