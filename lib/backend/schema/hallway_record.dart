import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HallwayRecord extends FirestoreRecord {
  HallwayRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "store" field.
  DocumentReference? _store;
  DocumentReference? get store => _store;
  bool hasStore() => _store != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "name" field.
  List<String>? _name;
  List<String> get name => _name ?? const [];
  bool hasName() => _name != null;

  void _initializeFields() {
    _store = snapshotData['store'] as DocumentReference?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _name = getDataList(snapshotData['name']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hallway');

  static Stream<HallwayRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HallwayRecord.fromSnapshot(s));

  static Future<HallwayRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HallwayRecord.fromSnapshot(s));

  static HallwayRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HallwayRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HallwayRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HallwayRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HallwayRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HallwayRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHallwayRecordData({
  DocumentReference? store,
  DocumentReference? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'store': store,
      'owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}

class HallwayRecordDocumentEquality implements Equality<HallwayRecord> {
  const HallwayRecordDocumentEquality();

  @override
  bool equals(HallwayRecord? e1, HallwayRecord? e2) {
    const listEquality = ListEquality();
    return e1?.store == e2?.store &&
        e1?.owner == e2?.owner &&
        listEquality.equals(e1?.name, e2?.name);
  }

  @override
  int hash(HallwayRecord? e) =>
      const ListEquality().hash([e?.store, e?.owner, e?.name]);

  @override
  bool isValidKey(Object? o) => o is HallwayRecord;
}
