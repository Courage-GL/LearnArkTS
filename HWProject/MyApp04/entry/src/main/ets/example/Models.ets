// 定义APP中需要用到的数据模型
export class TaskDataModel{
  private tasks: Array<string> = [
    '早起晨练',
    '准备早餐',
    '阅读名著',
    '学习ArkTs',
    '玩游戏放松一下'
  ]

  public getData():Array<string>{
    return this.tasks;
  }
}

