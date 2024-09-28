import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/product_page/product_list/product_list_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'search_model.dart';
export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    required this.searchFromHomePage,
    required this.townNameFromHomePage,
  });

  final String? searchFromHomePage;
  final String? townNameFromHomePage;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late SearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'search'});
    _model.textController ??=
        TextEditingController(text: widget.searchFromHomePage);
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
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
                          logFirebaseEvent('SEARCH_PAGE_Icon_cbdr4qhp_ON_TAP');
                          logFirebaseEvent('Icon_navigate_back');
                          context.safePop();
                        },
                        child: Icon(
                          Icons.chevron_left_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 35.0,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: StreamBuilder<List<ProductsRecord>>(
                            stream: queryProductsRecord(),
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

                              return Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Container(
                                  width: 315.0,
                                  height: 50.0,
                                  constraints: const BoxConstraints(
                                    minHeight: 52.0,
                                    maxWidth: 600.0,
                                    maxHeight: 62.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 3.0, 8.0, 5.0),
                                    child: Autocomplete<String>(
                                      initialValue: TextEditingValue(
                                          text: widget.searchFromHomePage!),
                                      optionsBuilder: (textEditingValue) {
                                        if (textEditingValue.text == '') {
                                          return const Iterable<String>.empty();
                                        }
                                        return functions
                                            .filterProducts(
                                                containerProductsRecordList
                                                    .toList(),
                                                widget.townNameFromHomePage!,
                                                null,
                                                null)!
                                            .map((e) => e.name)
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
                                          textController:
                                              _model.textController!,
                                          options: options.toList(),
                                          onSelected: onSelected,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
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
                                        safeSetState(() =>
                                            _model.textFieldSelectedOption =
                                                selection);
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
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController',
                                            const Duration(milliseconds: 2000),
                                            () async {
                                              logFirebaseEvent(
                                                  'SEARCH_TextField_jl8q16vv_ON_TEXTFIELD_C');
                                              logFirebaseEvent(
                                                  'TextField_simple_search');
                                              safeSetState(() {
                                                _model.simpleSearchResults =
                                                    TextSearch(
                                                  functions
                                                      .filterProducts(
                                                          containerProductsRecordList
                                                              .toList(),
                                                          widget
                                                              .townNameFromHomePage!,
                                                          null,
                                                          null)!
                                                      .map(
                                                        (record) =>
                                                            TextSearchItem
                                                                .fromTerms(
                                                                    record, [
                                                          record.name,
                                                          record.description,
                                                          record.caption
                                                        ]),
                                                      )
                                                      .toList(),
                                                )
                                                        .search(_model
                                                            .textController
                                                            .text)
                                                        .map((r) => r.object)
                                                        .toList();
                                              });
                                              logFirebaseEvent(
                                                  'TextField_update_app_state');
                                              FFAppState().searchInHomePage =
                                                  true;
                                              safeSetState(() {});
                                              if (_model.textController.text ==
                                                      '') {
                                                logFirebaseEvent(
                                                    'TextField_update_app_state');
                                                FFAppState().searchInHomePage =
                                                    false;
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'TextField_update_app_state');
                                                FFAppState().searchInHomePage =
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
                                            hintText: 'Qué estás buscando...',
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontStyle: FontStyle.italic,
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
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            contentPadding: const EdgeInsets.all(5.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          textAlign: TextAlign.start,
                                          cursorColor: const Color(0xBD777777),
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        if (FFAppState().searchInHomePage == false)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                270.0, 14.0, 0.0, 0.0),
                            child: Icon(
                              Icons.search_sharp,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        if (FFAppState().searchInHomePage == true)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                270.0, 14.0, 0.0, 0.0),
                            child: Icon(
                              Icons.close,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                child: FlutterFlowAdBanner(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 50.0,
                  showsTestAd: false,
                  androidAdUnitID: 'ca-app-pub-8109838187000513/2726410386',
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
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
                                    'Keyoee_${productsSearchIndex}_of_${productsSearch.length}'),
                                image: productsSearchItem.gallery.first,
                                priceSale:
                                    productsSearchItem.salePrice.toDouble(),
                                price: productsSearchItem.price.toDouble(),
                                productName: productsSearchItem.name,
                                productCaption: productsSearchItem.caption,
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
  }
}
