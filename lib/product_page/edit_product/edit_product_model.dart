import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_product_widget.dart' show EditProductWidget;
import 'package:flutter/material.dart';

class EditProductModel extends FlutterFlowModel<EditProductWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> listofProductImage = [];
  void addToListofProductImage(FFUploadedFile item) =>
      listofProductImage.add(item);
  void removeFromListofProductImage(FFUploadedFile item) =>
      listofProductImage.remove(item);
  void removeAtIndexFromListofProductImage(int index) =>
      listofProductImage.removeAt(index);
  void insertAtIndexInListofProductImage(int index, FFUploadedFile item) =>
      listofProductImage.insert(index, item);
  void updateListofProductImageAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      listofProductImage[index] = updateFn(listofProductImage[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in Edit_Product widget.
  ProductsRecord? product;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for productName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameTextController;
  String? Function(BuildContext, String?)? productNameTextControllerValidator;
  String? _productNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
    }

    if (val.length < 3) {
      return 'Mínimo 3 caracteres.';
    }
    if (val.length > 20) {
      return 'Máximo 15 caracteres.';
    }

    return null;
  }

  // State field(s) for Caption widget.
  FocusNode? captionFocusNode;
  TextEditingController? captionTextController;
  String? Function(BuildContext, String?)? captionTextControllerValidator;
  String? _captionTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
    }

    if (val.length > 20) {
      return 'Máximo 15 caracteres.';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  List<String>? get choiceChipsValues1 => choiceChipsValueController1?.value;
  set choiceChipsValues1(List<String>? val) =>
      choiceChipsValueController1?.value = val;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  // State field(s) for Gender widget.
  FormFieldController<List<String>>? genderValueController;
  String? get genderValue => genderValueController?.value?.firstOrNull;
  set genderValue(String? val) =>
      genderValueController?.value = val != null ? [val] : [];
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  String? _priceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
    }

    return null;
  }

  // State field(s) for salesPrice widget.
  FocusNode? salesPriceFocusNode;
  TextEditingController? salesPriceTextController;
  String? Function(BuildContext, String?)? salesPriceTextControllerValidator;

  @override
  void initState(BuildContext context) {
    productNameTextControllerValidator = _productNameTextControllerValidator;
    captionTextControllerValidator = _captionTextControllerValidator;
    priceTextControllerValidator = _priceTextControllerValidator;
  }

  @override
  void dispose() {
    productNameFocusNode?.dispose();
    productNameTextController?.dispose();

    captionFocusNode?.dispose();
    captionTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    salesPriceFocusNode?.dispose();
    salesPriceTextController?.dispose();
  }
}
