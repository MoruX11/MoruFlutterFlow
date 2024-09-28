import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'verificar_numero_tienda_widget.dart' show VerificarNumeroTiendaWidget;
import 'package:flutter/material.dart';

class VerificarNumeroTiendaModel
    extends FlutterFlowModel<VerificarNumeroTiendaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  StoresRecord? newStore;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
