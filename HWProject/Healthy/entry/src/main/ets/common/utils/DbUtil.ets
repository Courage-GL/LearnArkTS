import relationalStore from '@ohos.data.relationalStore'
import common from '@ohos.app.ability.common'
import Logger from './Logger'
import { ColumnInfo, ColumnType } from '../bean/ColumnInfo'

const DB_FILENAME = 'Healthy.db'

class DbUtil {
  rdbStore: relationalStore.RdbStore

  initDB(context: common.UIAbilityContext): Promise<void> {
    let config: relationalStore.StoreConfig = {
      name: DB_FILENAME,
      securityLevel: relationalStore.SecurityLevel.S1
    }
    return new Promise<void>((resolve, reject) => {
      relationalStore.getRdbStore(context, config)
        .then(rdbStore => {
          this.rdbStore = rdbStore
          Logger.debug('rdbStore 初始化完成')
          resolve()
        })
        .catch(reason => {
          Logger.debug('rdbStore 异常', JSON.stringify(reason))
          reject(reason)
        })
    })
  }

  createTable(createSql: string): Promise<void> {
    return new Promise((resolve, reject) => {
      this.rdbStore.executeSql(createSql)
        .then(() => {
          Logger.debug('创建表成功', createSql)
          resolve()
        })
        .catch(error => {
          Logger.debug('创建表失败' + error.message, JSON.stringify(error))
          reject(error)
        })
    })
  }

  insert(tableName: string, obj: any, columns: ColumnInfo[]) {
    return new Promise((resolve, reject) => {
      this.rdbStore.insert(tableName, this.buildValueBucket(obj, columns), (error, id) => {
        if (error) {
          Logger.debug('新增失败', JSON.stringify(error))
          reject(error)
        } else {
          Logger.debug('新增成功，ID为', id.toString())
          resolve(id)
        }
      })
    })
  }

  delete(predicate: relationalStore.RdbPredicates) {
    return new Promise((resolve, reject) => {
      this.rdbStore.delete(predicate, (error, rows) => {
        if (error) {
          Logger.debug('删除失败', JSON.stringify(error))
          reject(error)
        } else {
          Logger.debug('删除成功，删除行数', rows.toString())
          resolve(rows)
        }
      })
    })
  }

  queryForList<T>(predicate: relationalStore.RdbPredicates, columns: ColumnInfo[]): Promise<T[]> {
    return new Promise((resolve, reject) => {
      this.rdbStore.query(predicate, columns.map(info => info.columnName), (error, result) => {
        if (error) {
          Logger.debug('查询失败', JSON.stringify(error))
          reject(error)
        } else {
          Logger.debug('查询成功，查询行数', result.rowCount.toString())
          resolve(this.parseResult(result, columns))
        }
      })
    })
  }

  buildValueBucket(obj: any, columns: ColumnInfo[]): relationalStore.ValuesBucket {
    let value = {}
    columns.forEach(info => {
      let val = obj[info.name]
      if (typeof val !== 'undefined') {
        value[info.columnName] = val
      }
    })
    return value
  }

  parseResult<T>(result: relationalStore.ResultSet, columns: ColumnInfo[]): T[] {
    let arr = []
    if (result.rowCount <= 0) {
      return arr
    }
    while (result.isAtLastRow) {
      result.goToNextRow()
      let obj = {}
      columns.forEach(info => {
        let val = null
        switch (info.type) {
          case ColumnType.LONG:
            val = result.getLong(result.getColumnIndex(info.columnName))
            break;
          case ColumnType.DOUBLE:
            val = result.getDouble(result.getColumnIndex(info.columnName))
            break;
          case ColumnType.STRING:
            val = result.getString(result.getColumnIndex(info.columnName))
            break;
          case ColumnType.BLOB:
            val = result.getBlob(result.getColumnIndex(info.columnName))
            break;
          default:
            break;
        }
        obj[info.name] = val
      })
      arr.push(obj)
    }
    return arr
  }
}

let dbUtil: DbUtil = new DbUtil()

export default dbUtil as DbUtil

