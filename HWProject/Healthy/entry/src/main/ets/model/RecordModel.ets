import { ColumnInfo, ColumnType } from '../common/bean/ColumnInfo'

const CREATE_TABLE_SQL: string = 'CREATE TABLE IF NOT EXISTS record ( id INTEGER PRIMARY KEY AUTOINCREMENT, type_id INTEGER NOT NULL, item_id INTEGER NOT NULL, amount DOUBLE NOT NULL, create_time INTEGER NOT NULL )'

class RecordModel {
  getCreateTableSql(): string {
    return CREATE_TABLE_SQL
  }
}

const COLUMNS: ColumnInfo[] = [
  { name: 'id', columnName: 'id', type: ColumnType.LONG },
  { name: 'typeId', columnName: 'type_id', type: ColumnType.LONG },
  { name: 'itemId', columnName: 'item_id', type: ColumnType.LONG },
  { name: 'amount', columnName: 'amount', type: ColumnType.DOUBLE },
  { name: 'createTime', columnName: 'create_time', type: ColumnType.LONG },


]

let recordModel = new RecordModel()

export default recordModel as RecordModel