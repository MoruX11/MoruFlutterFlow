import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tienda_widget.dart' show TiendaWidget;
import 'package:flutter/material.dart';

class TiendaModel extends FlutterFlowModel<TiendaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
