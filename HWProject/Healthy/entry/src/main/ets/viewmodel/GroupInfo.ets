import ItemCategory from './ItemCategory'
import RecordItem from './RecordItem'

export default class GroupInfo<TYPE, ELEMENT> {
  type: TYPE
  items: ELEMENT[]
  calorie: number = 0

  constructor(type: TYPE, items: ELEMENT[]) {
    this.type = type
    this.items = items
  }
}