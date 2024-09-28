import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/product_page/product_list/product_list_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'section_recomm_model.dart';
export 'section_recomm_model.dart';

class SectionRecommWidget extends StatefulWidget {
  /// Esta es la estructura que se presenta en el perfil del vendedor. Muestra
  /// los pasillos creados por el y los productos que pertenecen a esos
  /// pasillos.
  const SectionRecommWidget({
    super.key,
    required this.categoryName,
    required this.town,
  });

  final String? categoryName;
  final String? town;

  @override
  State<SectionRecommWidget> createState() => _SectionRecommWidgetState();
}

class _SectionRecommWidgetState extends State<SectionRecommWidget> {
  late SectionRecommModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SectionRecommModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: StreamBuilder<List<ProductsRecord>>(
        stream: queryProductsRecord(
          queryBuilder: (productsRecord) => productsRecord.where(
            'category',
            isEqualTo: widget.categoryName,
          ),
          limit: 12,
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

          return ClipRRect(
            child: Container(
              height: 340.0,
              decoration: const BoxDecoration(),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Stack(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        () {
                                          if (widget.categoryName ==
                                              'Restaurantes') {
                                            return 'Gastronomía';
                                          } else if (widget.categoryName ==
                                              'Comestibles') {
                                            return 'Snacks y esenciales de la despensa ';
                                          } else if (widget.categoryName ==
                                              'Regalos') {
                                            return 'Detalles para sorprender';
                                          } else if (widget.categoryName ==
                                              'Moda') {
                                            return 'Prendas para brillar';
                                          } else {
                                            return 'Error';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1.0, -1.0),
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
                                          'SECTION_RECOMM_COMP_Icon_deko1x7j_ON_TAP');
                                      if (widget.categoryName ==
                                          'Restaurantes') {
                                        logFirebaseEvent('Icon_navigate_to');

                                        context.pushNamed(
                                          'Restaurantes',
                                          queryParameters: {
                                            'town': serializeParam(
                                              widget.town,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        if (widget.categoryName ==
                                            'Comestibles') {
                                          logFirebaseEvent('Icon_navigate_to');

                                          context.pushNamed(
                                            'Groceries',
                                            queryParameters: {
                                              'town': serializeParam(
                                                widget.town,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          if (widget.categoryName ==
                                              'Regalos') {
                                            logFirebaseEvent(
                                                'Icon_navigate_to');

                                            context.pushNamed(
                                              'Regalos',
                                              queryParameters: {
                                                'town': serializeParam(
                                                  widget.town,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            logFirebaseEvent(
                                                'Icon_navigate_to');

                                            context.pushNamed(
                                              'Moda',
                                              queryParameters: {
                                                'town': serializeParam(
                                                  widget.town,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        }
                                      }
                                    },
                                    child: const Icon(
                                      Icons.open_in_new,
                                      color: Color(0xFF595858),
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 35.0, 5.0, 5.0),
                        child: Builder(
                          builder: (context) {
                            final products = functions
                                    .filterProducts(
                                        containerProductsRecordList.toList(),
                                        widget.town!,
                                        null,
                                        null)
                                    ?.toList() ??
                                [];

                            return ListView.separated(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: products.length,
                              separatorBuilder: (_, __) => const SizedBox(width: 5.0),
                              itemBuilder: (context, productsIndex) {
                                final productsItem = products[productsIndex];
                                return Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SECTION_RECOMM_Container_a5b5objk_ON_TAP');
                                      logFirebaseEvent(
                                          'Product_list_google_analytics_event');
                                      logFirebaseEvent(
                                        'productosDestacados',
                                        parameters: {
                                          'porductoDestacados':
                                              productsItem.reference,
                                        },
                                      );
                                    },
                                    child: ProductListWidget(
                                      key: Key(
                                          'Keya5b_${productsIndex}_of_${products.length}'),
                                      image: productsItem.gallery.first,
                                      priceSale:
                                          productsItem.salePrice.toDouble(),
                                      price: productsItem.price.toDouble(),
                                      productName: productsItem.name,
                                      productCaption: productsItem.caption,
                                      productId: productsItem.reference,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
