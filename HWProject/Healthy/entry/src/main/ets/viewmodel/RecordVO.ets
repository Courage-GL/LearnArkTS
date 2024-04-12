import RecordItem from './RecordItem'

export default class RecordVO {
  id: number
  typeId: number
  calorie: number
  recordItem: RecordItem
  amount: number = 0
}