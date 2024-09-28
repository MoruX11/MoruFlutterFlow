import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'updatename_hall_widget.dart' show UpdatenameHallWidget;
import 'package:flutter/material.dart';

class UpdatenameHallModel extends FlutterFlowModel<UpdatenameHallWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for productName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameTextController;
  String? Function(BuildContext, String?)? productNameTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  HallwayRecord? hallways;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    productNameFocusNode?.dispose();
    productNameTextController?.dispose();
  }
}
