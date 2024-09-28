import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'updatename_hall_model.dart';
export 'updatename_hall_model.dart';

class UpdatenameHallWidget extends StatefulWidget {
  const UpdatenameHallWidget({
    super.key,
    required this.hallwayNameToEdit,
    required this.store,
  });

  final String? hallwayNameToEdit;
  final DocumentReference? store;

  @override
  State<UpdatenameHallWidget> createState() => _UpdatenameHallWidgetState();
}

class _UpdatenameHallWidgetState extends State<UpdatenameHallWidget> {
  late UpdatenameHallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdatenameHallModel());

    _model.productNameTextController ??=
        TextEditingController(text: widget.hallwayNameToEdit);
    _model.productNameFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: AuthUserStreamWidget(
        builder: (context) => StreamBuilder<List<ProductsRecord>>(
          stream: queryProductsRecord(
            queryBuilder: (productsRecord) => productsRecord
                .where(
                  'hallway',
                  arrayContains: widget.hallwayNameToEdit,
                )
                .where(
                  'store',
                  isEqualTo: currentUserDocument?.store,
                ),
          ),
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
            List<ProductsRecord> containerProductsRecordList = snapshot.data!;

            return Container(
              width: MediaQuery.sizeOf(context).width * 0.95,
              height: 200.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cambiar nombre de pasillo.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.productNameTextController,
                        focusNode: _model.productNameFocusNode,
                        autofocus: true,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Roboto'),
                              ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          errorStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).error,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 20.0, 16.0, 20.0),
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .headlineMediumFamily,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .headlineMediumFamily),
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator: _model.productNameTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'UPDATENAME_HALL_ACTUALIZAR_BTN_ON_TAP');
                              logFirebaseEvent('Button_firestore_query');
                              _model.hallways = await queryHallwayRecordOnce(
                                queryBuilder: (hallwayRecord) =>
                                    hallwayRecord.where(
                                  'store',
                                  isEqualTo: currentUserDocument?.store,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              logFirebaseEvent('Button_backend_call');

                              await _model.hallways!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'name': FieldValue.arrayRemove(
                                        [widget.hallwayNameToEdit]),
                                  },
                                ),
                              });
                              logFirebaseEvent('Button_backend_call');

                              await _model.hallways!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'name': FieldValue.arrayUnion([
                                      _model.productNameTextController.text
                                    ]),
                                  },
                                ),
                              });
                              logFirebaseEvent('Button_custom_action');
                              await actions.updateHallway(
                                containerProductsRecordList.toList(),
                                widget.hallwayNameToEdit!,
                                _model.productNameTextController.text,
                              );
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed('Administrar_Pasillos');

                              safeSetState(() {});
                            },
                            text: 'Actualizar',
                            options: FFButtonOptions(
                              height: 25.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(5.0),
                              hoverColor: FlutterFlowTheme.of(context).tertiary,
                              hoverTextColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(const SizedBox(height: 5.0)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
