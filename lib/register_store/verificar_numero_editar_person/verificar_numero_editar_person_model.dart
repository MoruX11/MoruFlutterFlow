import '/flutter_flow/flutter_flow_util.dart';
import 'verificar_numero_editar_person_widget.dart'
    show VerificarNumeroEditarPersonWidget;
import 'package:flutter/material.dart';

class VerificarNumeroEditarPersonModel
    extends FlutterFlowModel<VerificarNumeroEditarPersonWidget> {
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
