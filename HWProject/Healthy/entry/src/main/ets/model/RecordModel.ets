import relationalStore from '@ohos.data.relationalStore'
import { ColumnInfo, ColumnType } from '../common/bean/ColumnInfo'
import RecordPO from '../common/bean/RecordPO'
import DbUtil from '../common/utils/DbUtil'

const CREATE_TABLE_SQL: string = 'CREATE TABLE IF NOT EXISTS record ( id INTEGER PRIMARY KEY AUTOINCREMENT, type_id INTEGER NOT NULL, item_id INTEGER NOT NULL, amount DOUBLE NOT NULL, create_time INTEGER NOT NULL )'
const TABLE_NAME = 'record'
const ID_COLUMN = 'id'
const CREATE_TIME_COLUMN = 'create_time'

class RecordModel {
  getCreateTableSql(): string {
    return CREATE_TABLE_SQL
  }

  insert(record: RecordPO) {
    return DbUtil.insert(TABLE_NAME, record, COLUMNS)
  }

  deleteById(id: number) {
    let predicates = new relationalStore.RdbPredicates(TABLE_NAME)
    predicates.equalTo(ID_COLUMN, id)
    return DbUtil.delete(predicates)
  }

  listByDate(date: number) {
    let predicates = new relationalStore.RdbPredicates(TABLE_NAME)
    predicates.equalTo(CREATE_TIME_COLUMN, date)
    return DbUtil.queryForList(predicates, COLUMNS)
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