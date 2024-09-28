import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'verificar_numero_tienda_model.dart';
export 'verificar_numero_tienda_model.dart';

class VerificarNumeroTiendaWidget extends StatefulWidget {
  /// esta página es para verificar el número de whatsapp del negocio.
  const VerificarNumeroTiendaWidget({
    super.key,
    required this.storeName,
    required this.phone,
    required this.logo,
    required this.address,
    required this.nit,
    required this.description,
    required this.categoryType,
    required this.town,
  });

  final String? storeName;
  final int? phone;
  final String? logo;
  final String? address;
  final int? nit;
  final String? description;
  final String? categoryType;
  final String? town;

  @override
  State<VerificarNumeroTiendaWidget> createState() =>
      _VerificarNumeroTiendaWidgetState();
}

class _VerificarNumeroTiendaWidgetState
    extends State<VerificarNumeroTiendaWidget> {
  late VerificarNumeroTiendaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificarNumeroTiendaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'verificar_numero_tienda'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 25.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'VERIFICAR_NUMERO_TIENDA_Text_eb4594rj_ON');
                              logFirebaseEvent('Text_navigate_to');

                              context.pushNamed(
                                'CreateStore',
                                queryParameters: {
                                  'personid': serializeParam(
                                    currentUserReference?.id,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Text(
                              '< Atrás',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 8.0),
                  child: Text(
                    'Ingresa código de verificación',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineLargeFamily,
                          fontSize: 25.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).headlineLargeFamily),
                        ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 12.0),
                  child: Text(
                    'Te enviamos un código de verificación, revisa tu sms e ingresa el número para continuar.',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Poppins',
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Poppins'),
                        ),
                  ),
                ),
                PinCodeTextField(
                  autoDisposeControllers: false,
                  appContext: context,
                  length: 6,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyLargeFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyLargeFamily),
                      ),
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  enableActiveFill: false,
                  autoFocus: true,
                  enablePinAutofill: false,
                  errorTextSpace: 16.0,
                  showCursor: true,
                  cursorColor: FlutterFlowTheme.of(context).primary,
                  obscureText: false,
                  hintCharacter: '●',
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    fieldHeight: 44.0,
                    fieldWidth: 44.0,
                    borderWidth: 2.0,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                    shape: PinCodeFieldShape.box,
                    activeColor: FlutterFlowTheme.of(context).primaryText,
                    inactiveColor: FlutterFlowTheme.of(context).alternate,
                    selectedColor: FlutterFlowTheme.of(context).primary,
                  ),
                  controller: _model.pinCodeController,
                  onChanged: (_) {},
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator:
                      _model.pinCodeControllerValidator.asValidator(context),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'VERIFICAR_NUMERO_TIENDA_VERIFICAR_BTN_ON');
                      logFirebaseEvent('Button_auth');
                      GoRouter.of(context).prepareAuthEvent();
                      final smsCodeVal = _model.pinCodeController!.text;
                      if (smsCodeVal.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Enter SMS verification code.'),
                          ),
                        );
                        return;
                      }
                      final phoneVerifiedUser = await authManager.verifySmsCode(
                        context: context,
                        smsCode: smsCodeVal,
                      );
                      if (phoneVerifiedUser == null) {
                        return;
                      }

                      logFirebaseEvent('Button_backend_call');

                      var storesRecordReference = StoresRecord.collection.doc();
                      await storesRecordReference.set(createStoresRecordData(
                        name: widget.storeName,
                        cellphone: widget.phone,
                        logo: widget.logo,
                        adress: widget.address,
                        nit: widget.nit,
                        owner: currentUserReference,
                        description: widget.description,
                        categoryType: widget.categoryType,
                        town: widget.town,
                      ));
                      _model.newStore = StoresRecord.getDocumentFromData(
                          createStoresRecordData(
                            name: widget.storeName,
                            cellphone: widget.phone,
                            logo: widget.logo,
                            adress: widget.address,
                            nit: widget.nit,
                            owner: currentUserReference,
                            description: widget.description,
                            categoryType: widget.categoryType,
                            town: widget.town,
                          ),
                          storesRecordReference);
                      logFirebaseEvent('Button_backend_call');

                      await HallwayRecord.collection.doc().set({
                        ...createHallwayRecordData(
                          store: _model.newStore?.reference,
                          owner: currentUserReference,
                        ),
                        ...mapToFirestore(
                          {
                            'name': ['Todo'],
                          },
                        ),
                      });
                      logFirebaseEvent('Button_backend_call');

                      await currentUserReference!
                          .update(createPersonsRecordData(
                        store: _model.newStore?.reference,
                      ));
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamedAuth(
                        'onboarding',
                        context.mounted,
                        queryParameters: {
                          'storename': serializeParam(
                            widget.storeName,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );

                      safeSetState(() {});
                    },
                    text: 'Verificar',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 15.0)),
            ),
          ),
        ),
      ),
    );
  }
}
