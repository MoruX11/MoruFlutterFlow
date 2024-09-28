import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/product_page/product_list/product_list_widget.dart';
import 'groceries_widget.dart' show GroceriesWidget;
import 'package:flutter/material.dart';

class GroceriesModel extends FlutterFlowModel<GroceriesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ProductsRecord> simpleSearchResults = [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for Product_list dynamic component.
  late FlutterFlowDynamicModels<ProductListModel> productListModels1;

  @override
  void initState(BuildContext context) {
    productListModels1 = FlutterFlowDynamicModels(() => ProductListModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();

    productListModels1.dispose();
  }
}
