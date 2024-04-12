import RecordType from '../viewmodel/RecordType'

enum RecordTypeEnum {
  BREAKFAST,
  LUNCH,
  DINNER,
  EXTRA_MEAL,
  WORKOUT
}

const RecordTypes: RecordType[] = [
  new RecordType(0, $r('app.string.breakfast'), $r('app.media.ic_breakfast'), 423, 592),
  new RecordType(1, $r('app.string.lunch'), $r('app.media.ic_lunch'), 592, 761),
  new RecordType(2, $r('app.string.dinner'), $r('app.media.ic_dinner'), 423, 592),
  new RecordType(3, $r('app.string.extra_meal'), $r('app.media.ic_extra_m'), 0, 169),
  new RecordType(4, $r('app.string.workout'), $r('app.media.ic_workout'))
]

export {
  RecordTypes, RecordTypeEnum
}