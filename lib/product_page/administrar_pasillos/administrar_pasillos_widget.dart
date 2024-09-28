import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info/delete_product_hall/delete_product_hall_widget.dart';
import '/info/updatename_hall/updatename_hall_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'administrar_pasillos_model.dart';
export 'administrar_pasillos_model.dart';

class AdministrarPasillosWidget extends StatefulWidget {
  /// En esta página se muestra el listado de los distintos pasillos que el
  /// usuario tenga creado.
  const AdministrarPasillosWidget({super.key});

  @override
  State<AdministrarPasillosWidget> createState() =>
      _AdministrarPasillosWidgetState();
}

class _AdministrarPasillosWidgetState extends State<AdministrarPasillosWidget> {
  late AdministrarPasillosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdministrarPasillosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Administrar_Pasillos'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'ADMINISTRAR_PASILLOS_Icon_i8e58b3z_ON_TA');
                          logFirebaseEvent('Icon_navigate_back');
                          context.safePop();
                        },
                        child: Icon(
                          Icons.chevron_left_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 32.0,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Text(
                          'Gestionar Pasillos',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineLargeFamily,
                                fontSize: 25.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineLargeFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 350.0,
                          height: 60.0,
                          constraints: const BoxConstraints(
                            minWidth: 350.0,
                            maxWidth: 700.0,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F4F5),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: true,
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Busca productos..',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  suffixIcon: const Icon(
                                    Icons.search_rounded,
                                    size: 24.0,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                textAlign: TextAlign.start,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primary,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 15.0, 24.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => StreamBuilder<List<HallwayRecord>>(
                    stream: queryHallwayRecord(
                      queryBuilder: (hallwayRecord) => hallwayRecord.where(
                        'store',
                        isEqualTo: currentUserDocument?.store,
                      ),
                      singleRecord: true,
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
                      List<HallwayRecord> listViewHallwayRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final listViewHallwayRecord =
                          listViewHallwayRecordList.isNotEmpty
                              ? listViewHallwayRecordList.first
                              : null;

                      return ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Builder(
                            builder: (context) {
                              final pasillosName =
                                  listViewHallwayRecord?.name.toList() ?? [];

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: pasillosName.length,
                                itemBuilder: (context, pasillosNameIndex) {
                                  final pasillosNameItem =
                                      pasillosName[pasillosNameIndex];
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (pasillosNameItem != 'Todo')
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            pasillosNameItem,
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily),
                                                ),
                                          ),
                                        ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (pasillosNameItem != 'Todo')
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              hoverIconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              icon: Icon(
                                                Icons.edit_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'ADMINISTRAR_PASILLOS_edit_outlined_ICN_O');
                                                logFirebaseEvent(
                                                    'IconButton_bottom_sheet');
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
                                                        child: SizedBox(
                                                          height: 500.0,
                                                          child:
                                                              UpdatenameHallWidget(
                                                            hallwayNameToEdit:
                                                                pasillosNameItem,
                                                            store:
                                                                currentUserDocument!
                                                                    .store!,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                            ),

                                          // Eliminar del pasillo, no eliminar producto.
                                          if (pasillosNameItem != 'Todo')
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Builder(
                                                builder: (context) =>
                                                    FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ADMINISTRAR_PASILLOS_delete_outline_roun');
                                                    logFirebaseEvent(
                                                        'IconButton_alert_dialog');
                                                    await showDialog(
                                                      barrierColor:
                                                          const Color(0x4A14181B),
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus(),
                                                            child:
                                                                DeleteProductHallWidget(
                                                              hallName:
                                                                  pasillosNameItem,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
