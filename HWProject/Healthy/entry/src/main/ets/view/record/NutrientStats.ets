import { CommonConstants } from '../../common/constants/CommonConstants'

@Preview
@Component
export default struct NutrientStats {
  // 碳水化合物
  @Prop carbon: number
  // 蛋白质
  @Prop protein: number
  // 脂肪
  @Prop fat: number
  carbonRecommend = CommonConstants.RECOMMEND_CARBON
  proteinRecommend = CommonConstants.RECOMMEND_PROTEIN
  fatRecommend = CommonConstants.RECOMMEND_FAT

  build() {
    Row() {
      this.statsBuilder('碳水化合物（克）', this.carbon, this.carbonRecommend, $r('app.color.carbon_color'))
      this.statsBuilder('蛋白质（克）', this.protein, this.proteinRecommend, $r('app.color.protein_color'))
      this.statsBuilder('脂肪（克）', this.fat, this.fatRecommend, $r('app.color.fat_color'))

    }
    .width(CommonConstants.THOUSANDTH_1000)
    .justifyContent(FlexAlign.SpaceBetween)
    .padding(20)
  }

  @Builder statsBuilder(label: string, value: number, recommend: number, color: Resource) {
    Column({ space: CommonConstants.SPACE_6 }) {
      Stack() {
        Progress({
          value: value,
          total: recommend,
          type: ProgressType.Ring
        })
          .width(95)
          .style({
            strokeWidth: CommonConstants.DEFAULT_8 })
          .color(color)
        Column({ space: CommonConstants.DEFAULT_6 }) {
          Text("摄入推荐").fontColor($r('app.color.gray'))
            .fontSize(12)
            .fontWeight(CommonConstants.FONT_WEIGHT_600)
          Text(value.toString() + "/" + recommend.toString()).fontSize(20)
            .fontWeight(CommonConstants.FONT_WEIGHT_700)
        }

      }

      Text(label).fontSize(12).fontColor($r('app.color.light_gray'))
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
    }
  }
}