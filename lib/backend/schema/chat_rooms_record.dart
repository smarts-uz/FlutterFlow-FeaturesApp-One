import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRoomsRecord extends FirestoreRecord {
  ChatRoomsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "room_title" field.
  String? _roomTitle;
  String get roomTitle => _roomTitle ?? '';
  bool hasRoomTitle() => _roomTitle != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _roomTitle = snapshotData['room_title'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat_rooms');

  static Stream<ChatRoomsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRoomsRecord.fromSnapshot(s));

  static Future<ChatRoomsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRoomsRecord.fromSnapshot(s));

  static ChatRoomsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatRoomsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRoomsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRoomsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRoomsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRoomsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRoomsRecordData({
  String? roomTitle,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'room_title': roomTitle,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRoomsRecordDocumentEquality implements Equality<ChatRoomsRecord> {
  const ChatRoomsRecordDocumentEquality();

  @override
  bool equals(ChatRoomsRecord? e1, ChatRoomsRecord? e2) {
    return e1?.roomTitle == e2?.roomTitle && e1?.date == e2?.date;
  }

  @override
  int hash(ChatRoomsRecord? e) =>
      const ListEquality().hash([e?.roomTitle, e?.date]);

  @override
  bool isValidKey(Object? o) => o is ChatRoomsRecord;
}
