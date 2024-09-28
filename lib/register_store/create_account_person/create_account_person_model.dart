import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_account_person_widget.dart' show CreateAccountPersonWidget;
import 'package:flutter/material.dart';

class CreateAccountPersonModel
    extends FlutterFlowModel<CreateAccountPersonWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DocumentType widget.
  String? documentTypeValue;
  FormFieldController<String>? documentTypeValueController;
  // State field(s) for document_number widget.
  FocusNode? documentNumberFocusNode;
  TextEditingController? documentNumberTextController;
  String? Function(BuildContext, String?)?
      documentNumberTextControllerValidator;
  String? _documentNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
    }

    if (val.length < 7) {
      return 'Mínimo 6 digitos';
    }
    if (val.length > 10) {
      return 'Máximo 10 digitos';
    }

    return null;
  }

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
    }

    if (val.length < 6) {
      return 'Mínimo 6 caracteres.';
    }
    if (val.length > 50) {
      return 'Máximo 50 carácter.';
    }

    return null;
  }

  // State field(s) for phone_number widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;

  @override
  void initState(BuildContext context) {
    documentNumberTextControllerValidator =
        _documentNumberTextControllerValidator;
    nameTextControllerValidator = _nameTextControllerValidator;
  }

  @override
  void dispose() {
    documentNumberFocusNode?.dispose();
    documentNumberTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
