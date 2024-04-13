import GroupInfo from '../viewmodel/GroupInfo'
import RecordItem from '../viewmodel/RecordItem'
import { FoodCategories, FoodCateGoryEnum, WorkoutCategories, WorkoutCategoryEnum } from './ItemCategoryModel'


class ItemModel {
  getById(id: number, isFood = true) {
    return isFood ? foods[id] : workouts[id]
  }

  list(isFood: boolean = true): RecordItem[] {
    return isFood ? foods : workouts
  }

  listItemGroupByCategory(isFood: boolean = true) {
    let categories = isFood ? FoodCategories : WorkoutCategories
    let items = isFood ? foods : workouts
    //1.创建空的分组
    let groupInfo = categories.map(itemCategory => new GroupInfo(itemCategory, []))
    //2.遍历食物列表，将食物添加进对应的列表
    items.forEach(item => {
      groupInfo[item.categoryId].items.push(item)
    })
    return groupInfo;
  }
}

let itemModel = new ItemModel()

export default itemModel as ItemModel

const foods: RecordItem[] = [
  new RecordItem(0, '米饭', $r('app.media.rice'), FoodCateGoryEnum.STAPLE, '碗', 209, 46.6, 4.7, 0.5),
  new RecordItem(1, '馒头', $r('app.media.steamed_bun'), FoodCateGoryEnum.STAPLE, '个', 114, 24.0, 3.0, 0.6),
  new RecordItem(2, '面包', $r('app.media.bun'), FoodCateGoryEnum.STAPLE, '个', 188, 46.6, 4.7, 0.5),
  new RecordItem(3, '全麦吐司', $r('app.media.toast'), FoodCateGoryEnum.STAPLE, '片', 91, 35.2, 5.0, 3.1),
  new RecordItem(4, '紫薯', $r('app.media.purple_potato'), FoodCateGoryEnum.STAPLE, '个', 163, 46.6, 4.7, 0.5),
  new RecordItem(5, '煮玉米', $r('app.media.corn'), FoodCateGoryEnum.STAPLE, '根', 111, 24.0, 3.0, 0.58),
  new RecordItem(6, '黄瓜', $r('app.media.cucumber'), FoodCateGoryEnum.FRUIT, '根', 29, 46.6, 4.7, 0.5),
  new RecordItem(7, '蓝莓', $r('app.media.blueberry'), FoodCateGoryEnum.FRUIT, '盒', 71, 24.0, 3.0, 0.58),
  new RecordItem(8, '草莓', $r('app.media.strawberry'), FoodCateGoryEnum.FRUIT, '颗', 14, 46.6, 4.7, 0.5),
  new RecordItem(9, '火龙果', $r('app.media.pitaya'), FoodCateGoryEnum.FRUIT, '个', 100, 24.0, 3.0, 0.58),
  new RecordItem(10, '奇异果', $r('app.media.kiwi'), FoodCateGoryEnum.FRUIT, '个', 12, 46.6, 4.7, 0.5),
  new RecordItem(11, '煮鸡蛋', $r('app.media.egg'), FoodCateGoryEnum.MEAT, '个', 213, 24.0, 3.0, 0.58),
  new RecordItem(12, '煮鸡胸肉', $r('app.media.chicken_breast'), FoodCateGoryEnum.MEAT, '克', 131, 46.6, 4.7, 0.5),
  new RecordItem(13, '煮鸡腿肉', $r('app.media.chicken_leg'), FoodCateGoryEnum.MEAT, '克', 313, 24.0, 3.0, 0.58),
  new RecordItem(14, '牛肉', $r('app.media.beef'), FoodCateGoryEnum.MEAT, '克', 1, 46.6, 4.7, 0.5),
  new RecordItem(15, '鱼肉', $r('app.media.fish'), FoodCateGoryEnum.MEAT, '克', 1134, 24.0, 3.0, 0.58),
  new RecordItem(16, '牛奶', $r('app.media.milk'), FoodCateGoryEnum.MEAT, '毫升', 29, 46.6, 4.7, 0.5),
  new RecordItem(17, '酸奶', $r('app.media.yogurt'), FoodCateGoryEnum.MEAT, '毫升', 114, 24.0, 3.0, 0.58),
  new RecordItem(18, '核桃', $r('app.media.walnut'), FoodCateGoryEnum.NUT, '颗', 20, 46.6, 4.7, 0.5),
  new RecordItem(19, '花生', $r('app.media.peanut'), FoodCateGoryEnum.NUT, '克', 134, 24.0, 3.0, 0.58),
  new RecordItem(20, '腰果', $r('app.media.cashew'), FoodCateGoryEnum.NUT, '克', 219, 46.6, 4.7, 0.5),
  new RecordItem(21, '拿铁', $r('app.media.coffee'), FoodCateGoryEnum.OTHER, '毫升', 14, 24.0, 3.0, 0.6),
  new RecordItem(22, '豆浆', $r('app.media.milk'), FoodCateGoryEnum.OTHER, '毫升', 231, 42.6, 4.8, 0.6)
]
const workouts: RecordItem[] = [
  new RecordItem(0, '散步', $r('app.media.ic_walk'), WorkoutCategoryEnum.WALKING, '小时', 111),
  new RecordItem(1, '快走', $r('app.media.ic_walk'), WorkoutCategoryEnum.WALKING, '小时', 343),
  new RecordItem(2, '慢跑', $r('app.media.ic_running'), WorkoutCategoryEnum.RUNNING, '小时', 472),
  new RecordItem(3, '快跑', $r('app.media.ic_running'), WorkoutCategoryEnum.RUNNING, '小时', 652),
  new RecordItem(4, '自行车', $r('app.media.ic_ridding'), WorkoutCategoryEnum.RIDING, '小时', 497),
  new RecordItem(5, '动感单车', $r('app.media.ic_ridding'), WorkoutCategoryEnum.RIDING, '小时', 587),
  new RecordItem(6, '瑜伽', $r('app.media.ic_aerobics'), WorkoutCategoryEnum.AEROBICS, '小时', 172),
  new RecordItem(7, '健身操', $r('app.media.ic_aerobics'), WorkoutCategoryEnum.AEROBICS, '小时', 429),
  new RecordItem(8, '游泳', $r('app.media.ic_swimming'), WorkoutCategoryEnum.SWIMMING, '小时', 472),
  new RecordItem(9, '冲浪', $r('app.media.ic_swimming'), WorkoutCategoryEnum.SWIMMING, '小时', 429),
  new RecordItem(10, '篮球', $r('app.media.ic_basketball'), WorkoutCategoryEnum.BALLGAME, '小时', 473),
  new RecordItem(11, '足球', $r('app.media.ic_football'), WorkoutCategoryEnum.BALLGAME, '小时', 515),
  new RecordItem(12, '排球', $r('app.media.ic_volleyball'), WorkoutCategoryEnum.BALLGAME, '小时', 402),
  new RecordItem(13, '羽毛球', $r('app.media.ic_badminton'), WorkoutCategoryEnum.BALLGAME, '小时', 380),
  new RecordItem(14, '乒乓球', $r('app.media.ic_table_tennis'), WorkoutCategoryEnum.BALLGAME, '小时', 553),
  new RecordItem(15, '哑铃飞鸟', $r('app.media.ic_dumbbell'), WorkoutCategoryEnum.STRENGTH, '小时', 345),
  new RecordItem(16, '哑铃卧推', $r('app.media.ic_dumbbell'), WorkoutCategoryEnum.STRENGTH, '小时', 296),
  new RecordItem(17, '仰卧起坐', $r('app.media.ic_sit_up'), WorkoutCategoryEnum.STRENGTH, '小时', 543),
]


