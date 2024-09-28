import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/info/whats_app/whats_app_widget.dart';
import '/product_page/hallway/hallway_widget.dart';
import '/product_page/menu_paginaproductos/menu_paginaproductos_widget.dart';
import '/product_page/product_list/product_list_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tienda_model.dart';
export 'tienda_model.dart';

class TiendaWidget extends StatefulWidget {
  /// Este es el perfil del usuario vendedor, es lo que ven los usarios
  /// compradores en el marketplace.
  const TiendaWidget({super.key});

  @override
  State<TiendaWidget> createState() => _TiendaWidgetState();
}

class _TiendaWidgetState extends State<TiendaWidget> {
  late TiendaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TiendaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Tienda'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TIENDA_PAGE_Tienda_ON_INIT_STATE');
      if (!(currentUserDocument?.store != null)) {
        logFirebaseEvent('Tienda_navigate_to');

        context.pushNamed(
          'CreateStore',
          queryParameters: {
            'personid': serializeParam(
              currentUserReference?.id,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<StoresRecord>>(
      stream: queryStoresRecord(
        queryBuilder: (storesRecord) => storesRecord.where(
          'owner',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: const Center(
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: SpinKitWave(
                  color: Color(0xFF9B70E6),
                  size: 24.0,
                ),
              ),
            ),
          );
        }
        List<StoresRecord> tiendaStoresRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final tiendaStoresRecord = tiendaStoresRecordList.isNotEmpty
            ? tiendaStoresRecordList.first
            : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  AuthUserStreamWidget(
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
                        List<HallwayRecord> columnHallwayRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final columnHallwayRecord =
                            columnHallwayRecordList.isNotEmpty
                                ? columnHallwayRecordList.first
                                : null;

                        return SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: ClipOval(
                                        child: Container(
                                          width: 80.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                FlutterFlowTheme.of(context)
                                                    .secondary
                                              ],
                                              stops: const [0.0, 1.0],
                                              begin: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: const AlignmentDirectional(0, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.network(
                                                currentUserPhoto,
                                                width: 512.0,
                                                height: 512.0,
                                                fit: BoxFit.cover,
                                                cacheWidth: 1024,
                                                cacheHeight: 1024,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 11.0, 0.0, 20.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 15.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      tiendaStoresRecord?.name,
                                                      'Negocio sin negocio',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 15.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      tiendaStoresRecord
                                                          ?.adress,
                                                      'Negocio sin categoría',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          color:
                                                              const Color(0xFF323131),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 3.0,
                                                                15.0, 0.0),
                                                    child: AutoSizeText(
                                                      valueOrDefault<String>(
                                                        tiendaStoresRecord
                                                            ?.description,
                                                        'Negocio sin descripción',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 3,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                                lineHeight: 1.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ].divide(const SizedBox(height: 3.0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'TIENDA_PAGE_WHATS_APP_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: SizedBox(
                                                    height: 550.0,
                                                    child: WhatsAppWidget(
                                                      storeNumber:
                                                          tiendaStoresRecord!
                                                              .cellphone,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        text: 'WhatsApp',
                                        icon: const FaIcon(
                                          FontAwesomeIcons.whatsapp,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily,
                                                color: const Color(0xD114181B),
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLargeFamily),
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          hoverBorderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          hoverTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          hoverElevation: 1.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 1.0),
                                child: StreamBuilder<List<HallwayRecord>>(
                                  stream: queryHallwayRecord(
                                    queryBuilder: (hallwayRecord) =>
                                        hallwayRecord.where(
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
                                    List<HallwayRecord>
                                        columnHallsHallwayRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final columnHallsHallwayRecord =
                                        columnHallsHallwayRecordList.isNotEmpty
                                            ? columnHallsHallwayRecordList.first
                                            : null;

                                    return SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 10.0),
                                              child: FlutterFlowChoiceChips(
                                                options:
                                                    columnHallsHallwayRecord!
                                                        .name
                                                        .where(
                                                            (e) => e != 'Todo')
                                                        .toList()
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                            .choiceChipsValues =
                                                        val),
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                                  iconColor: const Color(0x00000000),
                                                  iconSize: 16.0,
                                                  elevation: 1.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  borderWidth: 1.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
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
                                                            const Color(0xD2777777),
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  iconSize: 16.0,
                                                  elevation: 0.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  borderWidth: 1.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                chipSpacing: 8.0,
                                                rowSpacing: 8.0,
                                                multiselect: true,
                                                initialized:
                                                    _model.choiceChipsValues !=
                                                        null,
                                                alignment: WrapAlignment.start,
                                                controller: _model
                                                        .choiceChipsValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  [],
                                                ),
                                                wrapped: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              if ((_model.choiceChipsValues != null &&
                                      (_model.choiceChipsValues)!.isNotEmpty) ==
                                  false)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 45.0),
                                  child: Builder(
                                    builder: (context) {
                                      final hallwayName = columnHallwayRecord
                                              ?.name
                                              .where((e) => e != 'Todo')
                                              .toList()
                                              .toList() ??
                                          [];

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: hallwayName.length,
                                        itemBuilder:
                                            (context, hallwayNameIndex) {
                                          final hallwayNameItem =
                                              hallwayName[hallwayNameIndex];
                                          return Visibility(
                                            visible: hallwayNameItem != 'Todo',
                                            child: HallwayWidget(
                                              key: Key(
                                                  'Keyp0g_${hallwayNameIndex}_of_${hallwayName.length}'),
                                              hallwayName: hallwayNameItem,
                                              storeId:
                                                  tiendaStoresRecord!.reference,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              if ((_model.choiceChipsValues != null &&
                                      (_model.choiceChipsValues)!.isNotEmpty) ==
                                  true)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 45.0),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child:
                                            StreamBuilder<List<ProductsRecord>>(
                                          stream: queryProductsRecord(
                                            queryBuilder: (productsRecord) =>
                                                productsRecord
                                                    .whereArrayContainsAny(
                                                        'hallway',
                                                        _model
                                                            .choiceChipsValues)
                                                    .where(
                                                      'store',
                                                      isEqualTo:
                                                          tiendaStoresRecord
                                                              ?.reference,
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
                                            List<ProductsRecord>
                                                wrapProductsRecordList =
                                                snapshot.data!;

                                            return Wrap(
                                              spacing: 35.0,
                                              runSpacing: 10.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.antiAlias,
                                              children: List.generate(
                                                  wrapProductsRecordList.length,
                                                  (wrapIndex) {
                                                final wrapProductsRecord =
                                                    wrapProductsRecordList[
                                                        wrapIndex];
                                                return ProductListWidget(
                                                  key: Key(
                                                      'Key5ub_${wrapIndex}_of_${wrapProductsRecordList.length}'),
                                                  image: wrapProductsRecord
                                                      .gallery.first,
                                                  priceSale: wrapProductsRecord
                                                      .salePrice
                                                      .toDouble(),
                                                  price: wrapProductsRecord
                                                      .price
                                                      .toDouble(),
                                                  productName:
                                                      wrapProductsRecord.name,
                                                  productCaption:
                                                      wrapProductsRecord
                                                          .caption,
                                                  productId: wrapProductsRecord
                                                      .reference,
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderRadius: 200.0,
                              borderWidth: 2.0,
                              buttonSize: 52.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              hoverColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              hoverIconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              icon: const Icon(
                                Icons.add,
                                color: Color(0xE214181B),
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent('TIENDA_PAGE_add_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () =>
                                          FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: const SizedBox(
                                          height: 310.0,
                                          child: MenuPaginaproductosWidget(),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
