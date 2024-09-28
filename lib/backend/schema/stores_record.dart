import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoresRecord extends FirestoreRecord {
  StoresRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "places" field.
  DocumentReference? _places;
  DocumentReference? get places => _places;
  bool hasPlaces() => _places != null;

  // "cellphone" field.
  int? _cellphone;
  int get cellphone => _cellphone ?? 0;
  bool hasCellphone() => _cellphone != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  bool hasAdress() => _adress != null;

  // "nit" field.
  int? _nit;
  int get nit => _nit ?? 0;
  bool hasNit() => _nit != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "town" field.
  String? _town;
  String get town => _town ?? '';
  bool hasTown() => _town != null;

  // "lat_long" field.
  LatLng? _latLong;
  LatLng? get latLong => _latLong;
  bool hasLatLong() => _latLong != null;

  // "category_type" field.
  String? _categoryType;
  String get categoryType => _categoryType ?? '';
  bool hasCategoryType() => _categoryType != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _places = snapshotData['places'] as DocumentReference?;
    _cellphone = castToType<int>(snapshotData['cellphone']);
    _logo = snapshotData['logo'] as String?;
    _adress = snapshotData['adress'] as String?;
    _nit = castToType<int>(snapshotData['nit']);
    _owner = snapshotData['owner'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _town = snapshotData['town'] as String?;
    _latLong = snapshotData['lat_long'] as LatLng?;
    _categoryType = snapshotData['category_type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stores');

  static Stream<StoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoresRecord.fromSnapshot(s));

  static Future<StoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoresRecord.fromSnapshot(s));

  static StoresRecord fromSnapshot(DocumentSnapshot snapshot) => StoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoresRecordData({
  String? name,
  DocumentReference? places,
  int? cellphone,
  String? logo,
  String? adress,
  int? nit,
  DocumentReference? owner,
  String? description,
  String? town,
  LatLng? latLong,
  String? categoryType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'places': places,
      'cellphone': cellphone,
      'logo': logo,
      'adress': adress,
      'nit': nit,
      'owner': owner,
      'description': description,
      'town': town,
      'lat_long': latLong,
      'category_type': categoryType,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoresRecordDocumentEquality implements Equality<StoresRecord> {
  const StoresRecordDocumentEquality();

  @override
  bool equals(StoresRecord? e1, StoresRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.places == e2?.places &&
        e1?.cellphone == e2?.cellphone &&
        e1?.logo == e2?.logo &&
        e1?.adress == e2?.adress &&
        e1?.nit == e2?.nit &&
        e1?.owner == e2?.owner &&
        e1?.description == e2?.description &&
        e1?.town == e2?.town &&
        e1?.latLong == e2?.latLong &&
        e1?.categoryType == e2?.categoryType;
  }

  @override
  int hash(StoresRecord? e) => const ListEquality().hash([
        e?.name,
        e?.places,
        e?.cellphone,
        e?.logo,
        e?.adress,
        e?.nit,
        e?.owner,
        e?.description,
        e?.town,
        e?.latLong,
        e?.categoryType
      ]);

  @override
  bool isValidKey(Object? o) => o is StoresRecord;
}
