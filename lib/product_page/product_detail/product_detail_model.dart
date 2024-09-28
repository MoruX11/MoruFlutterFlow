import '/flutter_flow/flutter_flow_util.dart';
import '/marketplace/relacionados/relacionados_widget.dart';
import 'product_detail_widget.dart' show ProductDetailWidget;
import 'package:flutter/material.dart';

class ProductDetailModel extends FlutterFlowModel<ProductDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for Relacionados component.
  late RelacionadosModel relacionadosModel;

  @override
  void initState(BuildContext context) {
    relacionadosModel = createModel(context, () => RelacionadosModel());
  }

  @override
  void dispose() {
    relacionadosModel.dispose();
  }
}
