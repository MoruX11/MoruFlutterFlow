import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/product_page/product_list/product_list_widget.dart';
import 'moda_widget.dart' show ModaWidget;
import 'package:flutter/material.dart';

class ModaModel extends FlutterFlowModel<ModaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ProductsRecord> simpleSearchResults = [];
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // Models for Product_list dynamic component.
  late FlutterFlowDynamicModels<ProductListModel> productListModels1;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  // Models for Product_list dynamic component.
  late FlutterFlowDynamicModels<ProductListModel> productListModels3;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController3;
  String? get choiceChipsValue3 =>
      choiceChipsValueController3?.value?.firstOrNull;
  set choiceChipsValue3(String? val) =>
      choiceChipsValueController3?.value = val != null ? [val] : [];
  // Models for Product_list dynamic component.
  late FlutterFlowDynamicModels<ProductListModel> productListModels5;

  @override
  void initState(BuildContext context) {
    productListModels1 = FlutterFlowDynamicModels(() => ProductListModel());
    productListModels3 = FlutterFlowDynamicModels(() => ProductListModel());
    productListModels5 = FlutterFlowDynamicModels(() => ProductListModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();

    tabBarController?.dispose();
    productListModels1.dispose();
    productListModels3.dispose();
    productListModels5.dispose();
  }
}
