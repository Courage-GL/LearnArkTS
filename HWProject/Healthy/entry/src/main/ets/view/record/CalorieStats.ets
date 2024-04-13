import { CommonConstants } from '../../common/constants/CommonConstants'

@Preview
@Component
export default struct CalorieStats {
  // 饮食摄入
  @Prop intake: number
  // 运动消耗
  @Prop expend: number
  // 推荐
  recommend: number = CommonConstants.RECOMMEND_CALORIE
  // 还可以吃
  remainCalorie() {
    return this.recommend - this.intake + this.expend;
  }

  build() {
    Row() {
      this.statsBuilder('饮食摄入', this.intake, '')
      Stack() {
        Progress({
          value: this.intake,
          total: this.recommend,
          type:ProgressType.Ring
        })
          .width(120)
          .style({
            strokeWidth:CommonConstants.DEFAULT_10 })
          .color($r('app.color.primary_color'))
        this.statsBuilder('还可以吃', this.remainCalorie(),
          '推荐' + this.recommend)
      }
      this.statsBuilder('运动消耗', this.expend, '')
    }
    .width(CommonConstants.THOUSANDTH_1000)
    .justifyContent(FlexAlign.SpaceBetween)
    .padding(20)

  }

  @Builder statsBuilder(label: string, value: number, tip: string) {
    Column({ space: CommonConstants.SPACE_6 }) {
      Text(label).fontColor($r('app.color.gray'))
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
      Text(value.toString()).fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
      if (tip) {
        Text(tip).fontSize(12).fontColor($r('app.color.gray'))
          .fontWeight(CommonConstants.FONT_WEIGHT_700)
          .opacity(0.6)
      }
    }
  }
}