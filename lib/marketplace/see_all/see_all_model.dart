import '/flutter_flow/flutter_flow_util.dart';
import '/product_page/product_list/product_list_widget.dart';
import 'see_all_widget.dart' show SeeAllWidget;
import 'package:flutter/material.dart';

class SeeAllModel extends FlutterFlowModel<SeeAllWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for Product_list dynamic component.
  late FlutterFlowDynamicModels<ProductListModel> productListModels;

  @override
  void initState(BuildContext context) {
    productListModels = FlutterFlowDynamicModels(() => ProductListModel());
  }

  @override
  void dispose() {
    productListModels.dispose();
  }
}
