export class FruitData {
  name: string
  vote: string
  id: string

  constructor(id: string, name: string, vote: string) {
    this.id = id
    this.name = name
    this.vote = vote
  }
}