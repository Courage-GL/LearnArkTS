import { CommonConstants } from '../../common/constants/CommonConstants'

@Preview
@Component
export struct SearchHeader {
  @State unReadCount: number = 1

  build() {
    Row({ space: CommonConstants.DEFAULT_8 }) {
      Search({ placeholder: '请输入你想搜索的信息' })
        .textFont({ size: 18 })
        .layoutWeight(1)
      Badge({ count: this.unReadCount, position: BadgePosition.RightTop, style: { fontSize: 10 } }) {
        Image($r('app.media.ic_public_email')).width(24)
      }

    }
    .width(CommonConstants.THOUSANDTH_1000)
    .padding({
      left: 12,
      right: 12
    })

  }
}
