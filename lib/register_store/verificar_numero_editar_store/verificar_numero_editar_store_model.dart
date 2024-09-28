import '/flutter_flow/flutter_flow_util.dart';
import 'verificar_numero_editar_store_widget.dart'
    show VerificarNumeroEditarStoreWidget;
import 'package:flutter/material.dart';

class VerificarNumeroEditarStoreModel
    extends FlutterFlowModel<VerificarNumeroEditarStoreWidget> {
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
