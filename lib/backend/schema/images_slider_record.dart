import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImagesSliderRecord extends FirestoreRecord {
  ImagesSliderRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "industry" field.
  String? _industry;
  String get industry => _industry ?? '';
  bool hasIndustry() => _industry != null;

  // "imagesList" field.
  List<String>? _imagesList;
  List<String> get imagesList => _imagesList ?? const [];
  bool hasImagesList() => _imagesList != null;

  // "town" field.
  String? _town;
  String get town => _town ?? '';
  bool hasTown() => _town != null;

  void _initializeFields() {
    _industry = snapshotData['industry'] as String?;
    _imagesList = getDataList(snapshotData['imagesList']);
    _town = snapshotData['town'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('imagesSlider');

  static Stream<ImagesSliderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImagesSliderRecord.fromSnapshot(s));

  static Future<ImagesSliderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImagesSliderRecord.fromSnapshot(s));

  static ImagesSliderRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ImagesSliderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImagesSliderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImagesSliderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImagesSliderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImagesSliderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImagesSliderRecordData({
  String? industry,
  String? town,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'industry': industry,
      'town': town,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImagesSliderRecordDocumentEquality
    implements Equality<ImagesSliderRecord> {
  const ImagesSliderRecordDocumentEquality();

  @override
  bool equals(ImagesSliderRecord? e1, ImagesSliderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.industry == e2?.industry &&
        listEquality.equals(e1?.imagesList, e2?.imagesList) &&
        e1?.town == e2?.town;
  }

  @override
  int hash(ImagesSliderRecord? e) =>
      const ListEquality().hash([e?.industry, e?.imagesList, e?.town]);

  @override
  bool isValidKey(Object? o) => o is ImagesSliderRecord;
}
