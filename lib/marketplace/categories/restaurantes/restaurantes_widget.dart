import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
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
import 'restaurantes_model.dart';
export 'restaurantes_model.dart';

class RestaurantesWidget extends StatefulWidget {
  /// Visualización de todos los productos correspondiente a las categoría.
  ///
  /// - Sus etiquetas y busqueda
  const RestaurantesWidget({
    super.key,
    required this.town,
  });

  final String? town;

  @override
  State<RestaurantesWidget> createState() => _RestaurantesWidgetState();
}

class _RestaurantesWidgetState extends State<RestaurantesWidget> {
  late RestaurantesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestaurantesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Restaurantes'});
    _model.textController ??= TextEditingController();
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
          isEqualTo: 'Restaurantes',
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
        List<ProductsRecord> restaurantesProductsRecordList = snapshot.data!;

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
                        const EdgeInsetsDirectional.fromSTEB(24.0, 15.0, 20.0, 0.0),
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
                                  'RESTAURANTES_PAGE_Icon_l8yksxhx_ON_TAP');
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
                          'Comida',
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: StreamBuilder<List<ProductsRecord>>(
                      stream: queryProductsRecord(
                        queryBuilder: (productsRecord) => productsRecord.where(
                          'category',
                          isEqualTo: 'Restaurantes',
                        ),
                        limit: 20,
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
                        List<ProductsRecord> containerProductsRecordList =
                            snapshot.data!;

                        return Container(
                          width: MediaQuery.sizeOf(context).width * 0.93,
                          height: 52.0,
                          constraints: const BoxConstraints(
                            minHeight: 52.0,
                            maxWidth: 600.0,
                            maxHeight: 62.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                                    return containerProductsRecordList
                                        .map((e) => e.name)
                                        .toList()
                                        .where((option) {
                                      final lowercaseOption =
                                          option.toLowerCase();
                                      return lowercaseOption.contains(
                                          textEditingValue.text.toLowerCase());
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

                                    _model.textController =
                                        textEditingController;
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
                                              'RESTAURANTES_TextField_go1pt0mp_ON_TEXTF');
                                          logFirebaseEvent(
                                              'TextField_simple_search');
                                          safeSetState(() {
                                            _model.simpleSearchResults =
                                                TextSearch(
                                              functions
                                                  .filterProducts(
                                                      containerProductsRecordList
                                                          .toList(),
                                                      widget.town!,
                                                      null,
                                                      null)!
                                                  .map(
                                                    (record) => TextSearchItem
                                                        .fromTerms(record, [
                                                      record.name,
                                                      record.description,
                                                      record.caption
                                                    ]),
                                                  )
                                                  .toList(),
                                            )
                                                    .search(_model
                                                        .textController.text)
                                                    .map((r) => r.object)
                                                    .toList();
                                          });
                                          logFirebaseEvent(
                                              'TextField_update_app_state');
                                          FFAppState().searchInRestaurant =
                                              true;
                                          safeSetState(() {});
                                          if (_model.textController.text ==
                                                  '') {
                                            logFirebaseEvent(
                                                'TextField_update_app_state');
                                            FFAppState().searchInRestaurant =
                                                false;
                                            safeSetState(() {});
                                          } else {
                                            logFirebaseEvent(
                                                'TextField_update_app_state');
                                            FFAppState().searchInRestaurant =
                                                true;
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
                                            'Qué tienes ganas de comer...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                          'RESTAURANTES_PAGE_Icon_xb0p1a5b_ON_TAP');
                                      logFirebaseEvent('Icon_update_app_state');
                                      FFAppState().searchInRestaurant = false;
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
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 0.0),
                    child: StreamBuilder<List<TagsRecord>>(
                      stream: queryTagsRecord(
                        queryBuilder: (tagsRecord) => tagsRecord.where(
                          'category_type',
                          isEqualTo: 'Restaurantes',
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
                        List<TagsRecord> rowTagsRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final rowTagsRecord = rowTagsRecordList.isNotEmpty
                            ? rowTagsRecordList.first
                            : null;

                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (FFAppState().searchInRestaurant == false)
                              Expanded(
                                child: FlutterFlowChoiceChips(
                                  options: rowTagsRecord!.name
                                      .map((label) => ChipData(label))
                                      .toList(),
                                  onChanged: (val) => safeSetState(() => _model
                                      .choiceChipsValue = val?.firstOrNull),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    iconColor: const Color(0x00000000),
                                    iconSize: 0.0,
                                    elevation: 0.0,
                                    borderWidth: 2.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: const Color(0xC914181B),
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    iconColor: const Color(0x00000000),
                                    iconSize: 18.0,
                                    elevation: 0.0,
                                    borderColor: const Color(0xA75D5C5C),
                                    borderWidth: 1.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  chipSpacing: 8.0,
                                  rowSpacing: 8.0,
                                  multiselect: false,
                                  initialized: _model.choiceChipsValue != null,
                                  alignment: WrapAlignment.start,
                                  controller:
                                      _model.choiceChipsValueController ??=
                                          FormFieldController<List<String>>(
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
                  if (FFAppState().searchInRestaurant == false)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final products = (functions
                                            .filterProducts(
                                                restaurantesProductsRecordList
                                                    .toList(),
                                                widget.town!,
                                                _model.choiceChipsValue,
                                                null)
                                            ?.toList() ??
                                        [])
                                    .take(12)
                                    .toList();

                                return Wrap(
                                  spacing: 40.0,
                                  runSpacing: 10.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.antiAlias,
                                  children: List.generate(products.length,
                                      (productsIndex) {
                                    final productsItem =
                                        products[productsIndex];
                                    return ProductListWidget(
                                      key: Key(
                                          'Key83y_${productsIndex}_of_${products.length}'),
                                      image: productsItem.gallery.first,
                                      priceSale:
                                          productsItem.salePrice.toDouble(),
                                      price: productsItem.price.toDouble(),
                                      productName: productsItem.name,
                                      productCaption: productsItem.caption,
                                      productId: productsItem.reference,
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (FFAppState().searchInRestaurant == true)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final productsSearch =
                                    _model.simpleSearchResults.toList();

                                return Wrap(
                                  spacing: 40.0,
                                  runSpacing: 10.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.antiAlias,
                                  children: List.generate(productsSearch.length,
                                      (productsSearchIndex) {
                                    final productsSearchItem =
                                        productsSearch[productsSearchIndex];
                                    return ProductListWidget(
                                      key: Key(
                                          'Key8ga_${productsSearchIndex}_of_${productsSearch.length}'),
                                      image: productsSearchItem.gallery.first,
                                      priceSale: productsSearchItem.salePrice
                                          .toDouble(),
                                      price:
                                          productsSearchItem.price.toDouble(),
                                      productName: productsSearchItem.name,
                                      productCaption:
                                          productsSearchItem.caption,
                                      productId: productsSearchItem.reference,
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
          ),
        );
      },
    );
  }
}
