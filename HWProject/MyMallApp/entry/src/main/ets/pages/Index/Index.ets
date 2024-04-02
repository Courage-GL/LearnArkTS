/**
 * APP主页
 */
import HomePage from '../home/HomePage'
import MyPage from '../mine/MyPage'

@Entry
@Component
struct Index {
  private tabsController: TabsController = new TabsController()
  // 当前页面的索引号
  @State currentIndex: number = 0

  build() {
    // 标签容器
    Tabs({
      // 标签显示的位置
      barPosition: BarPosition.End,
      // 页面标签容器的控制器
      controller: this.tabsController
    }) {
      // 首页
      TabContent() {
        HomePage()
      }
      .padding({ left: 20, right: 20 })
      .backgroundColor(Color.White)
      .tabBar(this.TabBuilder('首页', 0, $r('app.media.ic_home_selected'), $r('app.media.ic_home_normal')))

      // 我的
      TabContent() {
        MyPage()
      }
      .padding({ left: 20, right: 20 })
      .backgroundColor(Color.White)
      .tabBar(this.TabBuilder('我的', 1, $r('app.media.ic_mine_selected'), $r('app.media.ic_mine_normal')))

    }
  }

  @Builder TabBuilder(title: string, index: number, selectedIcon: Resource, normalIcon: Resource) {
    Column() {
      Image(index === this.currentIndex ? selectedIcon : normalIcon).width(30).height(30)
      Text(title).fontSize(12).fontColor(index === this.currentIndex ? Color.Blue : Color.Black).margin({
        top: 6
      })
    }
    .justifyContent(FlexAlign.Center)
    .height(60)
    .width('100%')
    .onClick(() => {
      this.currentIndex = index
      // 通过索引进行页面切换
      this.tabsController.changeIndex(this.currentIndex)
    })
  }
}