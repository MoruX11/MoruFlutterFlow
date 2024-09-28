import '/flutter_flow/flutter_flow_util.dart';
import 'administrar_pasillos_widget.dart' show AdministrarPasillosWidget;
import 'package:flutter/material.dart';

class AdministrarPasillosModel
    extends FlutterFlowModel<AdministrarPasillosWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
