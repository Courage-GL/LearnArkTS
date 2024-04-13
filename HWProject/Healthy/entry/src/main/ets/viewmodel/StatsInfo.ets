export default class StatsInfo {
  intake: number = 0
  expend: number = 0
  carbon: number = 0
  protein: number = 0
  fat: number = 0

  constructor(intake: number = 0, expend: number = 0, carbon: number = 0,
              protein: number = 0, fat: number = 0) {
    this.intake = intake
    this.expend = expend
    this.carbon = carbon
    this.protein = protein
    this.fat = fat
  }
}