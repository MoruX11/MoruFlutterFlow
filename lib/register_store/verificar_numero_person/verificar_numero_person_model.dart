import '/flutter_flow/flutter_flow_util.dart';
import 'verificar_numero_person_widget.dart' show VerificarNumeroPersonWidget;
import 'package:flutter/material.dart';

class VerificarNumeroPersonModel
    extends FlutterFlowModel<VerificarNumeroPersonWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
