import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_data_widget.dart' show UpdateDataWidget;
import 'package:flutter/material.dart';

class UpdateDataModel extends FlutterFlowModel<UpdateDataWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in Update_Data widget.
  StoresRecord? store;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Name_person widget.
  FocusNode? namePersonFocusNode;
  TextEditingController? namePersonTextController;
  String? Function(BuildContext, String?)? namePersonTextControllerValidator;
  String? _namePersonTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Requerido.';
    }

    if (val.length < 6) {
      return 'Mínimo 6 Caracteres';
    }
    if (val.length > 50) {
      return 'Máximo 50 caracteres';
    }

    return null;
  }

  // State field(s) for phone_number_person widget.
  FocusNode? phoneNumberPersonFocusNode;
  TextEditingController? phoneNumberPersonTextController;
  String? Function(BuildContext, String?)?
      phoneNumberPersonTextControllerValidator;
  // State field(s) for nit widget.
  FocusNode? nitFocusNode;
  TextEditingController? nitTextController;
  String? Function(BuildContext, String?)? nitTextControllerValidator;
  String? _nitTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Requerido.';
    }

    if (val.length < 9) {
      return 'Mínimo 9 dígitos';
    }
    if (val.length > 10) {
      return 'Máximo 9 digitos';
    }

    return null;
  }

  // State field(s) for storename widget.
  FocusNode? storenameFocusNode;
  TextEditingController? storenameTextController;
  String? Function(BuildContext, String?)? storenameTextControllerValidator;
  String? _storenameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Requerido.';
    }

    if (val.length < 2) {
      return 'Mínimo 2 Caracteres ';
    }
    if (val.length > 50) {
      return 'Máximo 50 caracteres.';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Requerido.';
    }

    if (val.length < 10) {
      return 'Mínimo 10 caracteres';
    }
    if (val.length > 150) {
      return 'Máximo 150 caracteres';
    }

    return null;
  }

  // State field(s) for phone_number widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Requerido.';
    }

    if (val.length < 10) {
      return 'Mínimo 10 dígitos';
    }
    if (val.length > 10) {
      return 'Máximo 10 digitos';
    }

    return null;
  }

  // State field(s) for place widget.
  String? placeValue;
  FormFieldController<String>? placeValueController;
  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  String? _addressTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Requerido.';
    }

    if (val.length > 50) {
      return 'Máximo 50 caracteres.';
    }

    return null;
  }

  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  @override
  void initState(BuildContext context) {
    namePersonTextControllerValidator = _namePersonTextControllerValidator;
    nitTextControllerValidator = _nitTextControllerValidator;
    storenameTextControllerValidator = _storenameTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
    addressTextControllerValidator = _addressTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    namePersonFocusNode?.dispose();
    namePersonTextController?.dispose();

    phoneNumberPersonFocusNode?.dispose();
    phoneNumberPersonTextController?.dispose();

    nitFocusNode?.dispose();
    nitTextController?.dispose();

    storenameFocusNode?.dispose();
    storenameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();
  }
}
