// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Task extends _Task with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Task({
    String title = "",
    bool checked = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Task>({
        'title': "",
        'checked': false,
      });
    }
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'checked', checked);
  }

  Task._();

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  bool get checked => RealmObjectBase.get<bool>(this, 'checked') as bool;
  @override
  set checked(bool value) => RealmObjectBase.set(this, 'checked', value);

  @override
  Stream<RealmObjectChanges<Task>> get changes =>
      RealmObjectBase.getChanges<Task>(this);

  @override
  Task freeze() => RealmObjectBase.freezeObject<Task>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Task._);
    return const SchemaObject(ObjectType.realmObject, Task, 'Task', [
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('checked', RealmPropertyType.bool),
    ]);
  }
}
