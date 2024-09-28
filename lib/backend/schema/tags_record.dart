import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TagsRecord extends FirestoreRecord {
  TagsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  List<String>? _name;
  List<String> get name => _name ?? const [];
  bool hasName() => _name != null;

  // "category_type" field.
  String? _categoryType;
  String get categoryType => _categoryType ?? '';
  bool hasCategoryType() => _categoryType != null;

  void _initializeFields() {
    _name = getDataList(snapshotData['name']);
    _categoryType = snapshotData['category_type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tags');

  static Stream<TagsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TagsRecord.fromSnapshot(s));

  static Future<TagsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TagsRecord.fromSnapshot(s));

  static TagsRecord fromSnapshot(DocumentSnapshot snapshot) => TagsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TagsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TagsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TagsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TagsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTagsRecordData({
  String? categoryType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category_type': categoryType,
    }.withoutNulls,
  );

  return firestoreData;
}

class TagsRecordDocumentEquality implements Equality<TagsRecord> {
  const TagsRecordDocumentEquality();

  @override
  bool equals(TagsRecord? e1, TagsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.name, e2?.name) &&
        e1?.categoryType == e2?.categoryType;
  }

  @override
  int hash(TagsRecord? e) =>
      const ListEquality().hash([e?.name, e?.categoryType]);

  @override
  bool isValidKey(Object? o) => o is TagsRecord;
}
