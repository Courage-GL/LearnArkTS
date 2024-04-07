import ItemCategory from '../viewmodel/ItemCategory'

enum FoodCateGoryEnum {
  STAPLE,
  FRUIT,
  MEAT,
  NUT,
  OTHER
}

let FoodCategories = [
  new ItemCategory(0, $r('app.string.staple')),
  new ItemCategory(1, $r('app.string.fruit')),
  new ItemCategory(2, $r('app.string.meat')),
  new ItemCategory(3, $r('app.string.nut')),
  new ItemCategory(4, $r('app.string.other_type'))
]


enum WorkoutCategoryEnum {
  WALKING,
  RUNNING,
  RIDING,
  AEROBICS,
  SWIMMING,
  BALLGAME,
  STRENGTH
}

let WorkoutCategories = [
  new ItemCategory(0, $r('app.string.walking_type')),
  new ItemCategory(1, $r('app.string.running')),
  new ItemCategory(2, $r('app.string.riding')),
  new ItemCategory(3, $r('app.string.aerobics')),
  new ItemCategory(4, $r('app.string.swimming')),
  new ItemCategory(5, $r('app.string.ballgame')),
  new ItemCategory(6, $r('app.string.strength'))
]

export {
  FoodCateGoryEnum,
  FoodCategories,
  WorkoutCategoryEnum,
  WorkoutCategories
}