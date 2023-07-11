// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FruitStruct extends FFFirebaseStruct {
  FruitStruct({
    String? name,
    double? price,
    int? kgs,
    double? totalPrice,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _price = price,
        _kgs = kgs,
        _totalPrice = totalPrice,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "kgs" field.
  int? _kgs;
  int get kgs => _kgs ?? 0;
  set kgs(int? val) => _kgs = val;
  void incrementKgs(int amount) => _kgs = kgs + amount;
  bool hasKgs() => _kgs != null;

  // "total_price" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  set totalPrice(double? val) => _totalPrice = val;
  void incrementTotalPrice(double amount) => _totalPrice = totalPrice + amount;
  bool hasTotalPrice() => _totalPrice != null;

  static FruitStruct fromMap(Map<String, dynamic> data) => FruitStruct(
        name: data['name'] as String?,
        price: castToType<double>(data['price']),
        kgs: castToType<int>(data['kgs']),
        totalPrice: castToType<double>(data['total_price']),
      );

  static FruitStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? FruitStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'price': _price,
        'kgs': _kgs,
        'total_price': _totalPrice,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'kgs': serializeParam(
          _kgs,
          ParamType.int,
        ),
        'total_price': serializeParam(
          _totalPrice,
          ParamType.double,
        ),
      }.withoutNulls;

  static FruitStruct fromSerializableMap(Map<String, dynamic> data) =>
      FruitStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        kgs: deserializeParam(
          data['kgs'],
          ParamType.int,
          false,
        ),
        totalPrice: deserializeParam(
          data['total_price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'FruitStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FruitStruct &&
        name == other.name &&
        price == other.price &&
        kgs == other.kgs &&
        totalPrice == other.totalPrice;
  }

  @override
  int get hashCode => const ListEquality().hash([name, price, kgs, totalPrice]);
}

FruitStruct createFruitStruct({
  String? name,
  double? price,
  int? kgs,
  double? totalPrice,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FruitStruct(
      name: name,
      price: price,
      kgs: kgs,
      totalPrice: totalPrice,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FruitStruct? updateFruitStruct(
  FruitStruct? fruit, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fruit
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFruitStructData(
  Map<String, dynamic> firestoreData,
  FruitStruct? fruit,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fruit == null) {
    return;
  }
  if (fruit.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && fruit.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fruitData = getFruitFirestoreData(fruit, forFieldValue);
  final nestedData = fruitData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = fruit.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFruitFirestoreData(
  FruitStruct? fruit, [
  bool forFieldValue = false,
]) {
  if (fruit == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fruit.toMap());

  // Add any Firestore field values
  fruit.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFruitListFirestoreData(
  List<FruitStruct>? fruits,
) =>
    fruits?.map((e) => getFruitFirestoreData(e, true)).toList() ?? [];
