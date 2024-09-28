import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "caption" field.
  String? _caption;
  String get caption => _caption ?? '';
  bool hasCaption() => _caption != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "sale_price" field.
  int? _salePrice;
  int get salePrice => _salePrice ?? 0;
  bool hasSalePrice() => _salePrice != null;

  // "gallery_" field.
  List<String>? _gallery;
  List<String> get gallery => _gallery ?? const [];
  bool hasGallery() => _gallery != null;

  // "store" field.
  DocumentReference? _store;
  DocumentReference? get store => _store;
  bool hasStore() => _store != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "hallway" field.
  List<String>? _hallway;
  List<String> get hallway => _hallway ?? const [];
  bool hasHallway() => _hallway != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "storeTown" field.
  String? _storeTown;
  String get storeTown => _storeTown ?? '';
  bool hasStoreTown() => _storeTown != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _caption = snapshotData['caption'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _salePrice = castToType<int>(snapshotData['sale_price']);
    _gallery = getDataList(snapshotData['gallery_']);
    _store = snapshotData['store'] as DocumentReference?;
    _imagen = snapshotData['imagen'] as String?;
    _hallway = getDataList(snapshotData['hallway']);
    _tags = getDataList(snapshotData['tags']);
    _gender = snapshotData['gender'] as String?;
    _category = snapshotData['category'] as String?;
    _storeTown = snapshotData['storeTown'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? name,
  String? description,
  String? caption,
  int? price,
  int? salePrice,
  DocumentReference? store,
  String? imagen,
  String? gender,
  String? category,
  String? storeTown,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'caption': caption,
      'price': price,
      'sale_price': salePrice,
      'store': store,
      'imagen': imagen,
      'gender': gender,
      'category': category,
      'storeTown': storeTown,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.caption == e2?.caption &&
        e1?.price == e2?.price &&
        e1?.salePrice == e2?.salePrice &&
        listEquality.equals(e1?.gallery, e2?.gallery) &&
        e1?.store == e2?.store &&
        e1?.imagen == e2?.imagen &&
        listEquality.equals(e1?.hallway, e2?.hallway) &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.gender == e2?.gender &&
        e1?.category == e2?.category &&
        e1?.storeTown == e2?.storeTown;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.caption,
        e?.price,
        e?.salePrice,
        e?.gallery,
        e?.store,
        e?.imagen,
        e?.hallway,
        e?.tags,
        e?.gender,
        e?.category,
        e?.storeTown
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
