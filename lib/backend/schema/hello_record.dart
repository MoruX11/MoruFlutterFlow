import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HelloRecord extends FirestoreRecord {
  HelloRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Hello');

  static Stream<HelloRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HelloRecord.fromSnapshot(s));

  static Future<HelloRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HelloRecord.fromSnapshot(s));

  static HelloRecord fromSnapshot(DocumentSnapshot snapshot) => HelloRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HelloRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HelloRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HelloRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HelloRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHelloRecordData({
  String? nombre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
    }.withoutNulls,
  );

  return firestoreData;
}

class HelloRecordDocumentEquality implements Equality<HelloRecord> {
  const HelloRecordDocumentEquality();

  @override
  bool equals(HelloRecord? e1, HelloRecord? e2) {
    return e1?.nombre == e2?.nombre;
  }

  @override
  int hash(HelloRecord? e) => const ListEquality().hash([e?.nombre]);

  @override
  bool isValidKey(Object? o) => o is HelloRecord;
}
