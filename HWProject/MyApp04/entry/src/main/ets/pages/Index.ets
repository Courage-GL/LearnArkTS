@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Flex({
      direction: FlexDirection.Column, //设置布局方向垂直排列
      alignItems: ItemAlign.Start, // 设置子项沿主轴的其实位置对齐
      justifyContent: FlexAlign.SpaceBetween // 设置子项间距均匀分布
    }) {
      Text('textAlign').fontSize('20.00fp').fontColor(0xccccc)
        .visibility(Visibility.Visible)
      Text('aaa')
        .textAlign(TextAlign.Center)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
        .width('100%')

      Text('bbb')
        .textAlign(TextAlign.Start)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
        .width('100%')
      Text('ccc')
        .textAlign(TextAlign.End)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
        .width('100%')
      Text('ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd')
        .textOverflow({ overflow: TextOverflow.Clip })
        .maxLines(1)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
        .width('100%')


      Text('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee2222222222222222222eeee')
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
        .width('100%')

      Text('lineHeight').fontSize('20.00fp').fontColor(0xccccc)

      Text('fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff')
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
      Text('fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff')
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
        .lineHeight(20)
    }.height(600)
    .width(350)
    .padding({ left: 30, right: 30, top: 30, bottom: 30 })
  }
}