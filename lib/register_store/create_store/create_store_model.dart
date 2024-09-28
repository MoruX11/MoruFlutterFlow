import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_store_widget.dart' show CreateStoreWidget;
import 'package:flutter/material.dart';

class CreateStoreModel extends FlutterFlowModel<CreateStoreWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nit widget.
  FocusNode? nitFocusNode;
  TextEditingController? nitTextController;
  String? Function(BuildContext, String?)? nitTextControllerValidator;
  String? _nitTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
    }

    if (val.length < 9) {
      return 'Mínimo 9 dígitos';
    }
    if (val.length > 11) {
      return 'Máximo 11 dígitos';
    }

    return null;
  }

  // State field(s) for storename widget.
  FocusNode? storenameFocusNode;
  TextEditingController? storenameTextController;
  String? Function(BuildContext, String?)? storenameTextControllerValidator;
  String? _storenameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
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
  // State field(s) for place widget.
  String? placeValue;
  FormFieldController<String>? placeValueController;
  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  String? _addressTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
    }

    if (val.length > 50) {
      return 'Máximo 50 caracteres';
    }

    return null;
  }

  // State field(s) for Category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {
    nitTextControllerValidator = _nitTextControllerValidator;
    storenameTextControllerValidator = _storenameTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    addressTextControllerValidator = _addressTextControllerValidator;
  }

  @override
  void dispose() {
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
