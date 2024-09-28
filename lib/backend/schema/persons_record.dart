import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PersonsRecord extends FirestoreRecord {
  PersonsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "document_type" field.
  String? _documentType;
  String get documentType => _documentType ?? '';
  bool hasDocumentType() => _documentType != null;

  // "document" field.
  int? _document;
  int get document => _document ?? 0;
  bool hasDocument() => _document != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "user_password" field.
  String? _userPassword;
  String get userPassword => _userPassword ?? '';
  bool hasUserPassword() => _userPassword != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "country_code" field.
  int? _countryCode;
  int get countryCode => _countryCode ?? 0;
  bool hasCountryCode() => _countryCode != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "user_status" field.
  int? _userStatus;
  int get userStatus => _userStatus ?? 0;
  bool hasUserStatus() => _userStatus != null;

  // "store" field.
  DocumentReference? _store;
  DocumentReference? get store => _store;
  bool hasStore() => _store != null;

  void _initializeFields() {
    _documentType = snapshotData['document_type'] as String?;
    _document = castToType<int>(snapshotData['document']);
    _displayName = snapshotData['display_name'] as String?;
    _email = snapshotData['email'] as String?;
    _userPassword = snapshotData['user_password'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _countryCode = castToType<int>(snapshotData['country_code']);
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userStatus = castToType<int>(snapshotData['user_status']);
    _store = snapshotData['store'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('persons');

  static Stream<PersonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PersonsRecord.fromSnapshot(s));

  static Future<PersonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PersonsRecord.fromSnapshot(s));

  static PersonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PersonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PersonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PersonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PersonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PersonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPersonsRecordData({
  String? documentType,
  int? document,
  String? displayName,
  String? email,
  String? userPassword,
  String? uid,
  DateTime? createdTime,
  int? countryCode,
  String? photoUrl,
  String? phoneNumber,
  int? userStatus,
  DocumentReference? store,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'document_type': documentType,
      'document': document,
      'display_name': displayName,
      'email': email,
      'user_password': userPassword,
      'uid': uid,
      'created_time': createdTime,
      'country_code': countryCode,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'user_status': userStatus,
      'store': store,
    }.withoutNulls,
  );

  return firestoreData;
}

class PersonsRecordDocumentEquality implements Equality<PersonsRecord> {
  const PersonsRecordDocumentEquality();

  @override
  bool equals(PersonsRecord? e1, PersonsRecord? e2) {
    return e1?.documentType == e2?.documentType &&
        e1?.document == e2?.document &&
        e1?.displayName == e2?.displayName &&
        e1?.email == e2?.email &&
        e1?.userPassword == e2?.userPassword &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.countryCode == e2?.countryCode &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userStatus == e2?.userStatus &&
        e1?.store == e2?.store;
  }

  @override
  int hash(PersonsRecord? e) => const ListEquality().hash([
        e?.documentType,
        e?.document,
        e?.displayName,
        e?.email,
        e?.userPassword,
        e?.uid,
        e?.createdTime,
        e?.countryCode,
        e?.photoUrl,
        e?.phoneNumber,
        e?.userStatus,
        e?.store
      ]);

  @override
  bool isValidKey(Object? o) => o is PersonsRecord;
}
