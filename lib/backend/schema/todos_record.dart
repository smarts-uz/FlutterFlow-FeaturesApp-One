import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TodosRecord extends FirestoreRecord {
  TodosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "is_done" field.
  bool? _isDone;
  bool get isDone => _isDone ?? false;
  bool hasIsDone() => _isDone != null;

  // "tasks" field.
  List<String>? _tasks;
  List<String> get tasks => _tasks ?? const [];
  bool hasTasks() => _tasks != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _isDone = snapshotData['is_done'] as bool?;
    _tasks = getDataList(snapshotData['tasks']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('todos');

  static Stream<TodosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TodosRecord.fromSnapshot(s));

  static Future<TodosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TodosRecord.fromSnapshot(s));

  static TodosRecord fromSnapshot(DocumentSnapshot snapshot) => TodosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TodosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TodosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TodosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TodosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTodosRecordData({
  String? title,
  bool? isDone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'is_done': isDone,
    }.withoutNulls,
  );

  return firestoreData;
}

class TodosRecordDocumentEquality implements Equality<TodosRecord> {
  const TodosRecordDocumentEquality();

  @override
  bool equals(TodosRecord? e1, TodosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.isDone == e2?.isDone &&
        listEquality.equals(e1?.tasks, e2?.tasks);
  }

  @override
  int hash(TodosRecord? e) =>
      const ListEquality().hash([e?.title, e?.isDone, e?.tasks]);

  @override
  bool isValidKey(Object? o) => o is TodosRecord;
}
