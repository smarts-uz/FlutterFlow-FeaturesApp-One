import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CitiesRecord extends FirestoreRecord {
  CitiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "LatD" field.
  int? _latD;
  int get latD => _latD ?? 0;
  bool hasLatD() => _latD != null;

  // "LatM" field.
  int? _latM;
  int get latM => _latM ?? 0;
  bool hasLatM() => _latM != null;

  // "LatS" field.
  int? _latS;
  int get latS => _latS ?? 0;
  bool hasLatS() => _latS != null;

  // "NS" field.
  String? _ns;
  String get ns => _ns ?? '';
  bool hasNs() => _ns != null;

  // "LonD" field.
  int? _lonD;
  int get lonD => _lonD ?? 0;
  bool hasLonD() => _lonD != null;

  // "LonM" field.
  int? _lonM;
  int get lonM => _lonM ?? 0;
  bool hasLonM() => _lonM != null;

  // "LonS" field.
  int? _lonS;
  int get lonS => _lonS ?? 0;
  bool hasLonS() => _lonS != null;

  // "EW" field.
  String? _ew;
  String get ew => _ew ?? '';
  bool hasEw() => _ew != null;

  // "City" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "State" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  void _initializeFields() {
    _latD = castToType<int>(snapshotData['LatD']);
    _latM = castToType<int>(snapshotData['LatM']);
    _latS = castToType<int>(snapshotData['LatS']);
    _ns = snapshotData['NS'] as String?;
    _lonD = castToType<int>(snapshotData['LonD']);
    _lonM = castToType<int>(snapshotData['LonM']);
    _lonS = castToType<int>(snapshotData['LonS']);
    _ew = snapshotData['EW'] as String?;
    _city = snapshotData['City'] as String?;
    _state = snapshotData['State'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cities');

  static Stream<CitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CitiesRecord.fromSnapshot(s));

  static Future<CitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CitiesRecord.fromSnapshot(s));

  static CitiesRecord fromSnapshot(DocumentSnapshot snapshot) => CitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCitiesRecordData({
  int? latD,
  int? latM,
  int? latS,
  String? ns,
  int? lonD,
  int? lonM,
  int? lonS,
  String? ew,
  String? city,
  String? state,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'LatD': latD,
      'LatM': latM,
      'LatS': latS,
      'NS': ns,
      'LonD': lonD,
      'LonM': lonM,
      'LonS': lonS,
      'EW': ew,
      'City': city,
      'State': state,
    }.withoutNulls,
  );

  return firestoreData;
}

class CitiesRecordDocumentEquality implements Equality<CitiesRecord> {
  const CitiesRecordDocumentEquality();

  @override
  bool equals(CitiesRecord? e1, CitiesRecord? e2) {
    return e1?.latD == e2?.latD &&
        e1?.latM == e2?.latM &&
        e1?.latS == e2?.latS &&
        e1?.ns == e2?.ns &&
        e1?.lonD == e2?.lonD &&
        e1?.lonM == e2?.lonM &&
        e1?.lonS == e2?.lonS &&
        e1?.ew == e2?.ew &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state;
  }

  @override
  int hash(CitiesRecord? e) => const ListEquality().hash([
        e?.latD,
        e?.latM,
        e?.latS,
        e?.ns,
        e?.lonD,
        e?.lonM,
        e?.lonS,
        e?.ew,
        e?.city,
        e?.state
      ]);

  @override
  bool isValidKey(Object? o) => o is CitiesRecord;
}
