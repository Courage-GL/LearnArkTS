// 记录项类型 全部 主食等
export default class ItemCategory {
  id: number
  name: ResourceStr

  constructor(id: number, name: ResourceStr) {
    this.id = id
    this.name = name
  }
}