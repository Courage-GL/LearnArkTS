export default class RecordType {
  id: number
  name: ResourceStr
  icon: ResourceStr
  min: number
  max: number

  constructor(id: number, name: ResourceStr, icon: ResourceStr,
              min: number = 0, max: number = 0) {
    this.id = id
    this.name = name
    this.icon = icon
    this.min = min
    this.max = max
  }
}


