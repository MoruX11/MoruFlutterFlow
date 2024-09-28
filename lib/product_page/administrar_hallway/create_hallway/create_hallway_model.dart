import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_hallway_widget.dart' show CreateHallwayWidget;
import 'package:flutter/material.dart';

class CreateHallwayModel extends FlutterFlowModel<CreateHallwayWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  HallwayRecord? hall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
