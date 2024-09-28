import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/product_page/product_list/product_list_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'moda_model.dart';
export 'moda_model.dart';

class ModaWidget extends StatefulWidget {
  /// Visualización de todos los productos correspondiente a las categoría.
  ///
  /// - Sus etiquetas y busqueda
  const ModaWidget({
    super.key,
    required this.town,
  });

  final String? town;

  @override
  State<ModaWidget> createState() => _ModaWidgetState();
}

class _ModaWidgetState extends State<ModaWidget> with TickerProviderStateMixin {
  late ModaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Moda'});
    _model.textController ??= TextEditingController();

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ProductsRecord>>(
      stream: queryProductsRecord(
        queryBuilder: (productsRecord) => productsRecord.where(
          'category',
          isEqualTo: 'Moda',
        ),
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
        List<ProductsRecord> modaProductsRecordList = snapshot.data!;

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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'MODA_PAGE_Icon_zi0v6lt0_ON_TAP');
                              logFirebaseEvent('Icon_navigate_back');
                              context.safePop();
                            },
                            child: Icon(
                              Icons.chevron_left_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 38.0,
                            ),
                          ),
                        ),
                        Text(
                          'Moda',
                          textAlign: TextAlign.end,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.93,
                        height: 52.0,
                        constraints: const BoxConstraints(
                          minHeight: 52.0,
                          maxWidth: 600.0,
                          maxHeight: 62.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  18.0, 2.0, 45.0, 0.0),
                              child: Autocomplete<String>(
                                initialValue: const TextEditingValue(),
                                optionsBuilder: (textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    return const Iterable<String>.empty();
                                  }
                                  return functions
                                      .filterProducts(
                                          modaProductsRecordList.toList(),
                                          widget.town!,
                                          null, () {
                                        if (_model.tabBarCurrentIndex == 0) {
                                          return 'Femenino';
                                        } else if (_model.tabBarCurrentIndex ==
                                            1) {
                                          return 'Masculino';
                                        } else {
                                          return 'Unisex';
                                        }
                                      }())!
                                      .map((e) => valueOrDefault<String>(
                                            e.name,
                                            'name',
                                          ))
                                      .toList()
                                      .where((option) {
                                        final lowercaseOption =
                                            option.toLowerCase();
                                        return lowercaseOption.contains(
                                            textEditingValue.text
                                                .toLowerCase());
                                      });
                                },
                                optionsViewBuilder:
                                    (context, onSelected, options) {
                                  return AutocompleteOptionsList(
                                    textFieldKey: _model.textFieldKey,
                                    textController: _model.textController!,
                                    options: options.toList(),
                                    onSelected: onSelected,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    textHighlightStyle: const TextStyle(),
                                    elevation: 4.0,
                                    optionBackgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    optionHighlightColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    maxHeight: 200.0,
                                  );
                                },
                                onSelected: (String selection) {
                                  safeSetState(() => _model
                                      .textFieldSelectedOption = selection);
                                  FocusScope.of(context).unfocus();
                                },
                                fieldViewBuilder: (
                                  context,
                                  textEditingController,
                                  focusNode,
                                  onEditingComplete,
                                ) {
                                  _model.textFieldFocusNode = focusNode;

                                  _model.textController = textEditingController;
                                  return TextFormField(
                                    key: _model.textFieldKey,
                                    controller: textEditingController,
                                    focusNode: focusNode,
                                    onEditingComplete: onEditingComplete,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      const Duration(milliseconds: 2000),
                                      () async {
                                        logFirebaseEvent(
                                            'MODA_TextField_bmneaojx_ON_TEXTFIELD_CHA');
                                        logFirebaseEvent(
                                            'TextField_simple_search');
                                        safeSetState(() {
                                          _model
                                              .simpleSearchResults = TextSearch(
                                            functions
                                                .filterProducts(
                                                    modaProductsRecordList
                                                        .toList(),
                                                    widget.town!,
                                                    null, () {
                                                  if (_model
                                                          .tabBarCurrentIndex ==
                                                      0) {
                                                    return 'Femenino';
                                                  } else if (_model
                                                          .tabBarCurrentIndex ==
                                                      1) {
                                                    return 'Masculino';
                                                  } else {
                                                    return 'Unisex';
                                                  }
                                                }())!
                                                .map(
                                                  (record) =>
                                                      TextSearchItem.fromTerms(
                                                          record, [
                                                    record.name,
                                                    record.description,
                                                    record.caption
                                                  ]),
                                                )
                                                .toList(),
                                          )
                                              .search(
                                                  _model.textController.text)
                                              .map((r) => r.object)
                                              .toList();
                                        });
                                        logFirebaseEvent(
                                            'TextField_update_app_state');
                                        FFAppState().searchInModa = true;
                                        safeSetState(() {});
                                        if (_model.textController.text == '') {
                                          logFirebaseEvent(
                                              'TextField_update_app_state');
                                          FFAppState().searchInModa = false;
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'TextField_update_app_state');
                                          FFAppState().searchInModa = true;
                                          safeSetState(() {});
                                        }
                                      },
                                    ),
                                    autofocus: true,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      alignLabelWithHint: false,
                                      hintText:
                                          'Encuentra tu próximo outfit...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
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
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    textAlign: TextAlign.start,
                                    cursorColor: const Color(0xBD777777),
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 20.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MODA_PAGE_Icon_crm2695g_ON_TAP');
                                    logFirebaseEvent('Icon_update_app_state');
                                    FFAppState().searchInModa = false;
                                    safeSetState(() {});
                                    logFirebaseEvent(
                                        'Icon_clear_text_fields_pin_codes');
                                    safeSetState(() {
                                      _model.textController?.clear();
                                    });
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: Color(0x97777777),
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(-1.0, 0),
                          child: FlutterFlowButtonTabBar(
                            useToggleButtonStyle: false,
                            isScrollable: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            labelColor: FlutterFlowTheme.of(context).primary,
                            unselectedLabelColor: const Color(0xFF57636C),
                            borderColor: FlutterFlowTheme.of(context).primary,
                            unselectedBorderColor:
                                FlutterFlowTheme.of(context).alternate,
                            borderWidth: 1.0,
                            borderRadius: 10.0,
                            elevation: 0.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            buttonMargin: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 16.0, 0.0),
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            tabs: const [
                              Tab(
                                text: 'Femenino',
                              ),
                              Tab(
                                text: 'Masculino',
                              ),
                              Tab(
                                text: 'Unisex',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (FFAppState().searchInModa == false)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          23.0, 10.0, 10.0, 0.0),
                                      child: StreamBuilder<List<TagsRecord>>(
                                        stream: queryTagsRecord(
                                          queryBuilder: (tagsRecord) =>
                                              tagsRecord.where(
                                            'category_type',
                                            isEqualTo: 'Moda',
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
                                          List<TagsRecord> rowTagsRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final rowTagsRecord =
                                              rowTagsRecordList.isNotEmpty
                                                  ? rowTagsRecordList.first
                                                  : null;

                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: FlutterFlowChoiceChips(
                                                  options: rowTagsRecord!.name
                                                      .map((label) =>
                                                          ChipData(label))
                                                      .toList(),
                                                  onChanged: (val) =>
                                                      safeSetState(() => _model
                                                              .choiceChipsValue1 =
                                                          val?.firstOrNull),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                    iconColor:
                                                        const Color(0x00000000),
                                                    iconSize: 0.0,
                                                    elevation: 0.0,
                                                    borderWidth: 2.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              const Color(0xC914181B),
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                    iconColor:
                                                        const Color(0x00000000),
                                                    iconSize: 18.0,
                                                    elevation: 0.0,
                                                    borderColor:
                                                        const Color(0xA75D5C5C),
                                                    borderWidth: 1.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  chipSpacing: 8.0,
                                                  rowSpacing: 8.0,
                                                  multiselect: false,
                                                  initialized: _model
                                                          .choiceChipsValue1 !=
                                                      null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .choiceChipsValueController1 ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [rowTagsRecord.name.first],
                                                  ),
                                                  wrapped: false,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  if (FFAppState().searchInModa == false)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final products = functions
                                                        .filterProducts(
                                                            modaProductsRecordList
                                                                .toList(),
                                                            widget.town!,
                                                            _model
                                                                .choiceChipsValue1,
                                                            () {
                                                      if (_model
                                                              .tabBarCurrentIndex ==
                                                          0) {
                                                        return 'Femenino';
                                                      } else if (_model
                                                              .tabBarCurrentIndex ==
                                                          1) {
                                                        return 'Masculino';
                                                      } else {
                                                        return 'Unisex';
                                                      }
                                                    }())?.toList() ??
                                                    [];

                                                return Wrap(
                                                  spacing: 30.0,
                                                  runSpacing: 10.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.antiAlias,
                                                  children: List.generate(
                                                      products.length,
                                                      (productsIndex) {
                                                    final productsItem =
                                                        products[productsIndex];
                                                    return wrapWithModel(
                                                      model: _model
                                                          .productListModels1
                                                          .getModel(
                                                        productsItem
                                                            .reference.id,
                                                        productsIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: ProductListWidget(
                                                        key: Key(
                                                          'Keyo7p_${productsItem.reference.id}',
                                                        ),
                                                        image: productsItem
                                                            .gallery.first,
                                                        priceSale: productsItem
                                                            .salePrice
                                                            .toDouble(),
                                                        price: productsItem
                                                            .price
                                                            .toDouble(),
                                                        productName:
                                                            productsItem.name,
                                                        productCaption:
                                                            productsItem
                                                                .caption,
                                                        productId: productsItem
                                                            .reference,
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (FFAppState().searchInModa == true)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final productsSearch = _model
                                                    .simpleSearchResults
                                                    .toList();

                                                return Wrap(
                                                  spacing: 30.0,
                                                  runSpacing: 10.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.antiAlias,
                                                  children: List.generate(
                                                      productsSearch.length,
                                                      (productsSearchIndex) {
                                                    final productsSearchItem =
                                                        productsSearch[
                                                            productsSearchIndex];
                                                    return ProductListWidget(
                                                      key: Key(
                                                          'Keyxj2_${productsSearchIndex}_of_${productsSearch.length}'),
                                                      image: productsSearchItem
                                                          .gallery.first,
                                                      priceSale:
                                                          productsSearchItem
                                                              .salePrice
                                                              .toDouble(),
                                                      price: productsSearchItem
                                                          .price
                                                          .toDouble(),
                                                      productName:
                                                          productsSearchItem
                                                              .name,
                                                      productCaption:
                                                          productsSearchItem
                                                              .caption,
                                                      productId:
                                                          productsSearchItem
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
                              SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (FFAppState().searchInModa == false)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            25.0, 10.0, 10.0, 0.0),
                                        child: StreamBuilder<List<TagsRecord>>(
                                          stream: queryTagsRecord(
                                            queryBuilder: (tagsRecord) =>
                                                tagsRecord.where(
                                              'category_type',
                                              isEqualTo: 'Moda',
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
                                            List<TagsRecord> rowTagsRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final rowTagsRecord =
                                                rowTagsRecordList.isNotEmpty
                                                    ? rowTagsRecordList.first
                                                    : null;

                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: FlutterFlowChoiceChips(
                                                    options: rowTagsRecord!.name
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .choiceChipsValue2 =
                                                            val?.firstOrNull),
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      iconColor:
                                                          const Color(0x00000000),
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderWidth: 2.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: const Color(
                                                                    0xC914181B),
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      iconColor:
                                                          const Color(0x00000000),
                                                      iconSize: 18.0,
                                                      elevation: 0.0,
                                                      borderColor:
                                                          const Color(0xA75D5C5C),
                                                      borderWidth: 1.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: false,
                                                    initialized: _model
                                                            .choiceChipsValue2 !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .choiceChipsValueController2 ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      [
                                                        rowTagsRecord
                                                            .name.first
                                                      ],
                                                    ),
                                                    wrapped: false,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    if (FFAppState().searchInModa == false)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 20.0),
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final productsMasc = functions
                                                          .filterProducts(
                                                              modaProductsRecordList
                                                                  .toList(),
                                                              widget.town!,
                                                              _model
                                                                  .choiceChipsValue2,
                                                              () {
                                                        if (_model
                                                                .tabBarCurrentIndex ==
                                                            0) {
                                                          return 'Femenino';
                                                        } else if (_model
                                                                .tabBarCurrentIndex ==
                                                            1) {
                                                          return 'Masculino';
                                                        } else {
                                                          return 'Unisex';
                                                        }
                                                      }())?.toList() ??
                                                      [];

                                                  return Wrap(
                                                    spacing: 40.0,
                                                    runSpacing: 10.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    children: List.generate(
                                                        productsMasc.length,
                                                        (productsMascIndex) {
                                                      final productsMascItem =
                                                          productsMasc[
                                                              productsMascIndex];
                                                      return wrapWithModel(
                                                        model: _model
                                                            .productListModels3
                                                            .getModel(
                                                          productsMascItem
                                                              .reference.id,
                                                          productsMascIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            ProductListWidget(
                                                          key: Key(
                                                            'Key3f6_${productsMascItem.reference.id}',
                                                          ),
                                                          image:
                                                              productsMascItem
                                                                  .gallery
                                                                  .first,
                                                          priceSale:
                                                              productsMascItem
                                                                  .salePrice
                                                                  .toDouble(),
                                                          price:
                                                              productsMascItem
                                                                  .price
                                                                  .toDouble(),
                                                          productName:
                                                              productsMascItem
                                                                  .name,
                                                          productCaption:
                                                              productsMascItem
                                                                  .caption,
                                                          productId:
                                                              productsMascItem
                                                                  .reference,
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (FFAppState().searchInModa == true)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final productsSearch = _model
                                                      .simpleSearchResults
                                                      .toList();

                                                  return Wrap(
                                                    spacing: 40.0,
                                                    runSpacing: 10.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    children: List.generate(
                                                        productsSearch.length,
                                                        (productsSearchIndex) {
                                                      final productsSearchItem =
                                                          productsSearch[
                                                              productsSearchIndex];
                                                      return ProductListWidget(
                                                        key: Key(
                                                            'Keyrfr_${productsSearchIndex}_of_${productsSearch.length}'),
                                                        image:
                                                            productsSearchItem
                                                                .gallery.first,
                                                        priceSale:
                                                            productsSearchItem
                                                                .salePrice
                                                                .toDouble(),
                                                        price:
                                                            productsSearchItem
                                                                .price
                                                                .toDouble(),
                                                        productName:
                                                            productsSearchItem
                                                                .name,
                                                        productCaption:
                                                            productsSearchItem
                                                                .caption,
                                                        productId:
                                                            productsSearchItem
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
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (FFAppState().searchInModa == false)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          25.0, 10.0, 10.0, 0.0),
                                      child: StreamBuilder<List<TagsRecord>>(
                                        stream: queryTagsRecord(
                                          queryBuilder: (tagsRecord) =>
                                              tagsRecord.where(
                                            'category_type',
                                            isEqualTo: 'Moda',
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
                                          List<TagsRecord> rowTagsRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final rowTagsRecord =
                                              rowTagsRecordList.isNotEmpty
                                                  ? rowTagsRecordList.first
                                                  : null;

                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: FlutterFlowChoiceChips(
                                                  options: rowTagsRecord!.name
                                                      .map((label) =>
                                                          ChipData(label))
                                                      .toList(),
                                                  onChanged: (val) =>
                                                      safeSetState(() => _model
                                                              .choiceChipsValue3 =
                                                          val?.firstOrNull),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                    iconColor:
                                                        const Color(0x00000000),
                                                    iconSize: 0.0,
                                                    elevation: 0.0,
                                                    borderWidth: 2.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              const Color(0xC914181B),
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                    iconColor:
                                                        const Color(0x00000000),
                                                    iconSize: 18.0,
                                                    elevation: 0.0,
                                                    borderColor:
                                                        const Color(0xA75D5C5C),
                                                    borderWidth: 1.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  chipSpacing: 8.0,
                                                  rowSpacing: 8.0,
                                                  multiselect: false,
                                                  initialized: _model
                                                          .choiceChipsValue3 !=
                                                      null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .choiceChipsValueController3 ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [rowTagsRecord.name.first],
                                                  ),
                                                  wrapped: false,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 5.0),
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final productsUnisex = functions
                                                      .filterProducts(
                                                          modaProductsRecordList
                                                              .toList(),
                                                          widget.town!,
                                                          _model
                                                              .choiceChipsValue3,
                                                          () {
                                                    if (_model
                                                            .tabBarCurrentIndex ==
                                                        0) {
                                                      return 'Femenino';
                                                    } else if (_model
                                                            .tabBarCurrentIndex ==
                                                        1) {
                                                      return 'Masculino';
                                                    } else {
                                                      return 'Unisex';
                                                    }
                                                  }())?.toList() ??
                                                  [];

                                              return Wrap(
                                                spacing: 40.0,
                                                runSpacing: 10.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.antiAlias,
                                                children: List.generate(
                                                    productsUnisex.length,
                                                    (productsUnisexIndex) {
                                                  final productsUnisexItem =
                                                      productsUnisex[
                                                          productsUnisexIndex];
                                                  return wrapWithModel(
                                                    model: _model
                                                        .productListModels5
                                                        .getModel(
                                                      productsUnisexItem
                                                          .reference.id,
                                                      productsUnisexIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: ProductListWidget(
                                                      key: Key(
                                                        'Keysrf_${productsUnisexItem.reference.id}',
                                                      ),
                                                      image: productsUnisexItem
                                                          .gallery.first,
                                                      priceSale:
                                                          productsUnisexItem
                                                              .salePrice
                                                              .toDouble(),
                                                      price: productsUnisexItem
                                                          .price
                                                          .toDouble(),
                                                      productName:
                                                          productsUnisexItem
                                                              .name,
                                                      productCaption:
                                                          productsUnisexItem
                                                              .caption,
                                                      productId:
                                                          productsUnisexItem
                                                              .reference,
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (FFAppState().searchInModa == true)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final productsSearch = _model
                                                    .simpleSearchResults
                                                    .toList();

                                                return Wrap(
                                                  spacing: 30.0,
                                                  runSpacing: 10.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.antiAlias,
                                                  children: List.generate(
                                                      productsSearch.length,
                                                      (productsSearchIndex) {
                                                    final productsSearchItem =
                                                        productsSearch[
                                                            productsSearchIndex];
                                                    return ProductListWidget(
                                                      key: Key(
                                                          'Keyvdk_${productsSearchIndex}_of_${productsSearch.length}'),
                                                      image: productsSearchItem
                                                          .gallery.first,
                                                      priceSale:
                                                          productsSearchItem
                                                              .salePrice
                                                              .toDouble(),
                                                      price: productsSearchItem
                                                          .price
                                                          .toDouble(),
                                                      productName:
                                                          productsSearchItem
                                                              .name,
                                                      productCaption:
                                                          productsSearchItem
                                                              .caption,
                                                      productId:
                                                          productsSearchItem
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
                            ],
                          ),
                        ),
                      ],
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
