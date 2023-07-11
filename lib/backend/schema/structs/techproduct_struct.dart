// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TechproductStruct extends FFFirebaseStruct {
  TechproductStruct({
    String? name,
    int? countLikes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _countLikes = countLikes,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "count_likes" field.
  int? _countLikes;
  int get countLikes => _countLikes ?? 0;
  set countLikes(int? val) => _countLikes = val;
  void incrementCountLikes(int amount) => _countLikes = countLikes + amount;
  bool hasCountLikes() => _countLikes != null;

  static TechproductStruct fromMap(Map<String, dynamic> data) =>
      TechproductStruct(
        name: data['name'] as String?,
        countLikes: castToType<int>(data['count_likes']),
      );

  static TechproductStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TechproductStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'count_likes': _countLikes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'count_likes': serializeParam(
          _countLikes,
          ParamType.int,
        ),
      }.withoutNulls;

  static TechproductStruct fromSerializableMap(Map<String, dynamic> data) =>
      TechproductStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        countLikes: deserializeParam(
          data['count_likes'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TechproductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TechproductStruct &&
        name == other.name &&
        countLikes == other.countLikes;
  }

  @override
  int get hashCode => const ListEquality().hash([name, countLikes]);
}

TechproductStruct createTechproductStruct({
  String? name,
  int? countLikes,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TechproductStruct(
      name: name,
      countLikes: countLikes,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TechproductStruct? updateTechproductStruct(
  TechproductStruct? techproduct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    techproduct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTechproductStructData(
  Map<String, dynamic> firestoreData,
  TechproductStruct? techproduct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (techproduct == null) {
    return;
  }
  if (techproduct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && techproduct.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final techproductData =
      getTechproductFirestoreData(techproduct, forFieldValue);
  final nestedData =
      techproductData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = techproduct.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTechproductFirestoreData(
  TechproductStruct? techproduct, [
  bool forFieldValue = false,
]) {
  if (techproduct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(techproduct.toMap());

  // Add any Firestore field values
  techproduct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTechproductListFirestoreData(
  List<TechproductStruct>? techproducts,
) =>
    techproducts?.map((e) => getTechproductFirestoreData(e, true)).toList() ??
    [];
