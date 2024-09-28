import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/info/nit/nit_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'create_store_model.dart';
export 'create_store_model.dart';

class CreateStoreWidget extends StatefulWidget {
  /// Creación del usuario con su información personal, email y contraseña.
  const CreateStoreWidget({
    super.key,
    String? personid,
  }) : personid = personid ?? 'No owner';

  final String personid;

  @override
  State<CreateStoreWidget> createState() => _CreateStoreWidgetState();
}

class _CreateStoreWidgetState extends State<CreateStoreWidget> {
  late CreateStoreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateStoreModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'CreateStore'});
    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.nitTextController ??= TextEditingController();
    _model.nitFocusNode ??= FocusNode();

    _model.storenameTextController ??= TextEditingController();
    _model.storenameFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

    _model.phoneNumberTextController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();

    _model.addressTextController ??= TextEditingController();
    _model.addressFocusNode ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 670.0,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CREATE_STORE_PAGE_Text_rlsb0sbk_ON_TAP');
                            logFirebaseEvent('Text_navigate_back');
                            context.safePop();
                          },
                          child: Text(
                            'Atrás',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 10.0, 12.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 8.0),
                              child: Text(
                                'Hablanos de tu negocio',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineLargeFamily,
                                      fontSize: 25.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineLargeFamily),
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 12.0),
                              child: Text(
                                'Completa los datos de tu negocio para  promocionarlo en Mōru.',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Poppins'),
                                    ),
                              ),
                            ),
                            Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 25.0, 16.0, 5.0),
                                    child: Stack(
                                      children: [
                                        TextFormField(
                                          controller: _model.nitTextController,
                                          focusNode: _model.nitFocusNode,
                                          autofocus: true,
                                          textCapitalization:
                                              TextCapitalization.none,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'NIT',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: const Color(0xFF57636C),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts:
                                                          GoogleFonts.asMap()
                                                              .containsKey(
                                                                  'Poppins'),
                                                    ),
                                            enabledBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFE0E3E7),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            errorBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFFF5963),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFFF5963),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 8.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: const Color(0xFF101213),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts:
                                                    GoogleFonts.asMap()
                                                        .containsKey('Poppins'),
                                                lineHeight: 3.0,
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .nitTextControllerValidator
                                              .asValidator(context),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 5.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'CREATE_STORE_PAGE_Icon_l6cx3xmv_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: const NitWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: const Icon(
                                                Icons.help_outline_sharp,
                                                color: Color(0x8A777777),
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 25.0, 16.0, 5.0),
                                    child: TextFormField(
                                      controller:
                                          _model.storenameTextController,
                                      focusNode: _model.storenameFocusNode,
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Nombre o Razón Social',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: const Color(0xFF57636C),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Poppins'),
                                            ),
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0E3E7),
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF5963),
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF5963),
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 16.0, 8.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: const Color(0xFF101213),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Poppins'),
                                            lineHeight: 3.0,
                                          ),
                                      validator: _model
                                          .storenameTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 25.0, 16.0, 5.0),
                                    child: TextFormField(
                                      controller:
                                          _model.descriptionTextController,
                                      focusNode: _model.descriptionFocusNode,
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            'Descripción breve de tu negocio',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: const Color(0xFF57636C),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Poppins'),
                                            ),
                                        alignLabelWithHint: false,
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0E3E7),
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF5963),
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF5963),
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 8.0, 16.0, 0.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: const Color(0xFF101213),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Poppins'),
                                            lineHeight: 1.0,
                                          ),
                                      textAlign: TextAlign.start,
                                      maxLines: null,
                                      validator: _model
                                          .descriptionTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 25.0, 16.0, 5.0),
                                    child: TextFormField(
                                      controller:
                                          _model.phoneNumberTextController,
                                      focusNode: _model.phoneNumberFocusNode,
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            '(+57) Teléfono de la tienda',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: const Color(0xFF57636C),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Poppins'),
                                            ),
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0E3E7),
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF5963),
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF5963),
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 16.0, 8.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: const Color(0xFF101213),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Poppins'),
                                            lineHeight: 3.0,
                                          ),
                                      keyboardType: TextInputType.phone,
                                      validator: _model
                                          .phoneNumberTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 25.0, 0.0, 0.0),
                                    child: StreamBuilder<List<PlacesRecord>>(
                                      stream: queryPlacesRecord(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return const Center(
                                            child: SizedBox(
                                              width: 24.0,
                                              height: 24.0,
                                              child: SpinKitWave(
                                                color: Color(0xFF9B70E6),
                                                size: 24.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<PlacesRecord>
                                            placePlacesRecordList =
                                            snapshot.data!;

                                        return FlutterFlowDropDown<String>(
                                          controller:
                                              _model.placeValueController ??=
                                                  FormFieldController<String>(
                                            _model.placeValue ??= '',
                                          ),
                                          options: List<String>.from(
                                              placePlacesRecordList
                                                  .map((e) => e.name)
                                                  .toList()
                                                  .where((e) => e != 'Urabá')
                                                  .toList()),
                                          optionLabels: placePlacesRecordList
                                              .map((e) => e.name)
                                              .toList()
                                              .where((e) => e != 'Urabá')
                                              .toList(),
                                          onChanged: (val) async {
                                            safeSetState(
                                                () => _model.placeValue = val);
                                            logFirebaseEvent(
                                                'CREATE_STORE_place_ON_FORM_WIDGET_SELECT');
                                            logFirebaseEvent(
                                                'place_update_app_state');
                                            FFAppState().selectedPlacesID =
                                                valueOrDefault<String>(
                                              _model.placeValue,
                                              'No pertenece a un municipio.',
                                            );
                                            safeSetState(() {});
                                          },
                                          width: 300.0,
                                          height: 56.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          hintText:
                                              'Selecciona el municipio...',
                                          icon: Icon(
                                            Icons.place,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor: const Color(0xF0E0E3E7),
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 25.0, 16.0, 5.0),
                                    child: TextFormField(
                                      controller: _model.addressTextController,
                                      focusNode: _model.addressFocusNode,
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Dirección del negocio',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: const Color(0xFF57636C),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Poppins'),
                                            ),
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0E3E7),
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF5963),
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF5963),
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 16.0, 8.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: const Color(0xFF101213),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Poppins'),
                                          ),
                                      validator: _model
                                          .addressTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 15.0, 0.0, 8.0),
                                    child: Text(
                                      'Tipo de negocio',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLargeFamily,
                                            fontSize: 25.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLargeFamily),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 10.0),
                                    child: Text(
                                      'Elige la categoría que mejor describe tu negocio.',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Poppins'),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 2.0, 0.0, 0.0),
                                    child:
                                        StreamBuilder<List<CategoriesRecord>>(
                                      stream: queryCategoriesRecord(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return const Center(
                                            child: SizedBox(
                                              width: 24.0,
                                              height: 24.0,
                                              child: SpinKitWave(
                                                color: Color(0xFF9B70E6),
                                                size: 24.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<CategoriesRecord>
                                            categoryCategoriesRecordList =
                                            snapshot.data!;

                                        return FlutterFlowDropDown<String>(
                                          controller:
                                              _model.categoryValueController ??=
                                                  FormFieldController<String>(
                                            _model.categoryValue ??= 'false',
                                          ),
                                          options: List<String>.from(
                                              categoryCategoriesRecordList
                                                  .map((e) => e.name)
                                                  .toList()),
                                          optionLabels:
                                              categoryCategoriesRecordList
                                                  .map((e) => e.name)
                                                  .toList(),
                                          onChanged: (val) async {
                                            safeSetState(() =>
                                                _model.categoryValue = val);
                                            logFirebaseEvent(
                                                'CREATE_STORE_Category_ON_FORM_WIDGET_SEL');
                                            logFirebaseEvent(
                                                'Category_update_app_state');
                                            FFAppState().selectedCategoryID =
                                                valueOrDefault<String>(
                                              _model.categoryValue,
                                              'No pertenece a una categoría',
                                            );
                                            safeSetState(() {});
                                          },
                                          width: 300.0,
                                          height: 56.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          hintText:
                                              'Selecciona la categoría...',
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor: const Color(0xF0E0E3E7),
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: Image.memory(
                                              _model.uploadedLocalFile1.bytes ??
                                                  Uint8List.fromList([]),
                                              width: 350.0,
                                              height: 300.0,
                                              fit: BoxFit.cover,
                                              cacheWidth: 1024,
                                              cacheHeight: 1024,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'CREATE_STORE_ESCOGER_LOGO_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_store_media_for_upload');
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    maxWidth: 1024.00,
                                                    maxHeight: 1024.00,
                                                    imageQuality: 100,
                                                    includeDimensions: true,
                                                    mediaSource: MediaSource
                                                        .photoGallery,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading1 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      showUploadMessage(
                                                        context,
                                                        'Uploading file...',
                                                        showLoading: true,
                                                      );
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .hideCurrentSnackBar();
                                                      _model.isDataUploading1 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile1 =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                      showUploadMessage(
                                                          context, 'Success!');
                                                    } else {
                                                      safeSetState(() {});
                                                      showUploadMessage(context,
                                                          'Failed to upload data');
                                                      return;
                                                    }
                                                  }
                                                },
                                                text: 'Escoger logo',
                                                icon: const Icon(
                                                  Icons.publish_sharp,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color:
                                                            const Color(0xFF676464),
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  hoverBorderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 1.0,
                                                  ),
                                                  hoverTextColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'CREATE_STORE_PAGE_SUBIR_LOGO_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_upload_media_to_firebase');
                                                  {
                                                    safeSetState(() => _model
                                                            .isDataUploading2 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];
                                                    var selectedMedia =
                                                        <SelectedFile>[];
                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      showUploadMessage(
                                                        context,
                                                        'Uploading file...',
                                                        showLoading: true,
                                                      );
                                                      selectedUploadedFiles = _model
                                                              .uploadedLocalFile1
                                                              .bytes!
                                                              .isNotEmpty
                                                          ? [
                                                              _model
                                                                  .uploadedLocalFile1
                                                            ]
                                                          : <FFUploadedFile>[];
                                                      selectedMedia =
                                                          selectedFilesFromUploadedFiles(
                                                        selectedUploadedFiles,
                                                      );
                                                      downloadUrls =
                                                          (await Future.wait(
                                                        selectedMedia.map(
                                                          (m) async =>
                                                              await uploadData(
                                                                  m.storagePath,
                                                                  m.bytes),
                                                        ),
                                                      ))
                                                              .where((u) =>
                                                                  u != null)
                                                              .map((u) => u!)
                                                              .toList();
                                                    } finally {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .hideCurrentSnackBar();
                                                      _model.isDataUploading2 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                                .length ==
                                                            selectedMedia
                                                                .length &&
                                                        downloadUrls.length ==
                                                            selectedMedia
                                                                .length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile2 =
                                                            selectedUploadedFiles
                                                                .first;
                                                        _model.uploadedFileUrl2 =
                                                            downloadUrls.first;
                                                      });
                                                      showUploadMessage(
                                                          context, 'Success!');
                                                    } else {
                                                      safeSetState(() {});
                                                      showUploadMessage(context,
                                                          'Failed to upload data');
                                                      return;
                                                    }
                                                  }

                                                  logFirebaseEvent(
                                                      'Button_backend_call');

                                                  await currentUserReference!
                                                      .update(
                                                          createPersonsRecordData(
                                                    photoUrl:
                                                        _model.uploadedFileUrl2,
                                                  ));
                                                },
                                                text: 'Subir logo',
                                                icon: const Icon(
                                                  Icons.check_outlined,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsets.all(0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color:
                                                            const Color(0xFF676464),
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  hoverBorderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 1.0,
                                                  ),
                                                  hoverTextColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (!(isWeb
                                ? MediaQuery.viewInsetsOf(context).bottom > 0
                                : _isKeyboardVisible))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 24.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'CREATE_STORE_CREAR_TIENDA_BTN_ON_TAP');
                                    logFirebaseEvent('Button_validate_form');
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.placeValue == null) {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '¿Dónde se encuentra tu negocio? Selecciona el municipio.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                        ),
                                      );
                                      return;
                                    }
                                    if (_model.categoryValue == null) {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Es necesario elegir la categoría.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .warning,
                                        ),
                                      );
                                      return;
                                    }
                                    if (_model.uploadedFileUrl2.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Sube el logo para que los clientes te identifiquen. ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                        ),
                                      );
                                      return;
                                    }
                                    logFirebaseEvent('Button_auth');
                                    final phoneNumberVal =
                                        _model.phoneNumberTextController.text;
                                    if (phoneNumberVal.isEmpty ||
                                        !phoneNumberVal.startsWith('+')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Phone Number is required and has to start with +.'),
                                        ),
                                      );
                                      return;
                                    }
                                    await authManager.beginPhoneAuth(
                                      context: context,
                                      phoneNumber: phoneNumberVal,
                                      onCodeSent: (context) async {
                                        context.goNamedAuth(
                                          'verificar_numero_tienda',
                                          context.mounted,
                                          queryParameters: {
                                            'storeName': serializeParam(
                                              _model
                                                  .storenameTextController.text,
                                              ParamType.String,
                                            ),
                                            'phone': serializeParam(
                                              int.tryParse(_model
                                                  .phoneNumberTextController
                                                  .text),
                                              ParamType.int,
                                            ),
                                            'logo': serializeParam(
                                              _model.uploadedFileUrl2,
                                              ParamType.String,
                                            ),
                                            'address': serializeParam(
                                              _model.addressTextController.text,
                                              ParamType.String,
                                            ),
                                            'nit': serializeParam(
                                              int.tryParse(_model
                                                  .nitTextController.text),
                                              ParamType.int,
                                            ),
                                            'description': serializeParam(
                                              _model.descriptionTextController
                                                  .text,
                                              ParamType.String,
                                            ),
                                            'categoryType': serializeParam(
                                              _model.categoryValue,
                                              ParamType.String,
                                            ),
                                            'town': serializeParam(
                                              _model.placeValue,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                          ignoreRedirect: true,
                                        );
                                      },
                                    );
                                  },
                                  text: 'Crear tienda',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 60.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Plus Jakarta Sans'),
                                        ),
                                    elevation: 5.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                    hoverColor:
                                        FlutterFlowTheme.of(context).primary,
                                    hoverBorderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 0.5,
                                    ),
                                    hoverTextColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
