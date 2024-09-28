import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/product_page/product_list/product_list_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'see_all_model.dart';
export 'see_all_model.dart';

class SeeAllWidget extends StatefulWidget {
  /// Este compoenente me permite ver todos los productos de un recomendado,
  /// destacado o pasillo.
  ///
  /// Expandir esa sección en una lista.
  const SeeAllWidget({
    super.key,
    required this.tagName,
  });

  final String? tagName;

  @override
  State<SeeAllWidget> createState() => _SeeAllWidgetState();
}

class _SeeAllWidgetState extends State<SeeAllWidget> {
  late SeeAllModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeeAllModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 680.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.95,
            height: 680.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 1.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.tagName,
                                'tagName',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 48.0,
                                icon: Icon(
                                  Icons.close_fullscreen_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'SEE_ALL_close_fullscreen_rounded_ICN_ON_');
                                  logFirebaseEvent('IconButton_bottom_sheet');
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              StreamBuilder<List<ProductsRecord>>(
                                stream: queryProductsRecord(
                                  queryBuilder: (productsRecord) =>
                                      productsRecord.where(
                                    'tags',
                                    arrayContains: widget.tagName,
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
                                  List<ProductsRecord>
                                      containerProductsRecordList =
                                      snapshot.data!;

                                  return ClipRRect(
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final products = functions
                                                          .filterProducts(
                                                              containerProductsRecordList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .townState,
                                                              widget.tagName,
                                                              null)
                                                          ?.toList() ??
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
                                                        products.length,
                                                        (productsIndex) {
                                                      final productsItem =
                                                          products[
                                                              productsIndex];
                                                      return wrapWithModel(
                                                        model: _model
                                                            .productListModels
                                                            .getModel(
                                                          productsItem
                                                              .reference.id,
                                                          productsIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            ProductListWidget(
                                                          key: Key(
                                                            'Keyz2j_${productsItem.reference.id}',
                                                          ),
                                                          image: productsItem
                                                              .gallery.first,
                                                          priceSale:
                                                              productsItem
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
                                                          productId:
                                                              productsItem
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
                                    ),
                                  );
                                },
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
      ),
    );
  }
}
