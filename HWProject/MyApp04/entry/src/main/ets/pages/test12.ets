class Article {
  public id: number
  public title: string
  public content: string

  constructor(id: number, title: string, content: string) {
    this.id = id
    this.title = title
    this.content = content
  }
}

// 定义一篇文章展示的子组件
@Component
struct ArticleComponent {
  article: Article

  build() {
    Row() {
      Image($r('app.media.icon')).width(80).height(80).margin(20)
      Column() {
        Text(this.article.title).fontColor(Color.Black).fontSize(20).margin(10)
        Text(this.article.content).fontColor(Color.Gray).fontSize(12).margin(10)
      }.alignItems(HorizontalAlign.Start).width('80%').height('100%')
    }
    .padding(12)
    .borderRadius(12)
    .height(120)
    .width('95%')
    .margin(10)
    .backgroundColor(Color.Brown)
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }
}

@Entry
@Component
struct ArticleParent {
  @State isListReadchEnd: boolean = false
  @State myArray: Array<Article> = [
    new Article(1, '狮子王1', '王子复仇子动物版1'),
    new Article(2, '狮子王2', '王子复仇子动物版2'),
    new Article(3, '狮子王3', '王子复仇子动物版3'),
    new Article(4, '狮子王4', '王子复仇子动物版4'),
    new Article(5, '狮子王5', '王子复仇子动物版5'),
    new Article(6, '狮子王6', '王子复仇子动物版6'),
    new Article(7, '狮子王7', '王子复仇子动物版7'),
    new Article(8, '狮子王8', '王子复仇子动物版8'),
    new Article(9, '狮子王9', '王子复仇子动物版9'),
    new Article(10, '狮子王10', '王子复仇子动物版10'),
    new Article(11, '狮子王11', '王子复仇子动物版11'),
    new Article(12, '狮子王12', '王子复仇子动物版12'),
    new Article(13, '狮子王13', '王子复仇子动物版13'),
    new Article(14, '狮子王14', '王子复仇子动物版14'),
    new Article(15, '狮子王15', '王子复仇子动物版15')
  ]

  build() {
    Column() {
      List() {
        ForEach(this.myArray, (article: Article) => {
          ArticleComponent({ article: article })
        })
      }.onReachEnd(() => {
        // 到达列表的底部
        this.isListReadchEnd = true

      })
      .onReachStart(() => {
        // 到达列表的顶部
      })
      .parallelGesture(PanGesture({ direction: PanDirection.Up, distance: 80 })
        .onActionStart(() => {
          if (this.isListReadchEnd) {
            // 加载新的文章
            let count = this.myArray.length
            let newCount = count += 1
            this.myArray.push(new Article(newCount, '狮子王' + newCount, '1111'))
            this.isListReadchEnd = false
          }
        }))
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)
  }
}