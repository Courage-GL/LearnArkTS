// 饮食距离或者运动项目id 米饭 馒头 散步 跑步
export default class RecordItem {
  id: number
  name: ResourceStr
  image: ResourceStr
  categoryId: number
  unit: ResourceStr
  calorie: number
  carbon: number
  protein: number
  fat: number

  constructor(id: number, name: ResourceStr, image: ResourceStr,
              categoryId: number, unit: ResourceStr, calorie: number,
              carbon: number = 0, protein: number = 0, fat: number = 0) {
    this.id = id
    this.name = name
    this.image = image
    this.categoryId = categoryId
    this.unit = unit
    this.calorie = calorie
    this.protein = protein
    this.fat = fat
    this.carbon = carbon
  }
}