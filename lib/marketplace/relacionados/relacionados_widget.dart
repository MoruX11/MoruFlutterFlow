import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/marketplace/see_all/see_all_widget.dart';
import '/product_page/product_list/product_list_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'relacionados_model.dart';
export 'relacionados_model.dart';

class RelacionadosWidget extends StatefulWidget {
  /// Esta es la estructura que se presenta en el perfil del vendedor. Muestra
  /// los pasillos creados por el y los productos que pertenecen a esos
  /// pasillos.
  const RelacionadosWidget({
    super.key,
    required this.tagSimilar,
    this.productId,
  });

  final String? tagSimilar;
  final DocumentReference? productId;

  @override
  State<RelacionadosWidget> createState() => _RelacionadosWidgetState();
}

class _RelacionadosWidgetState extends State<RelacionadosWidget> {
  late RelacionadosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RelacionadosModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ProductsRecord>>(
      stream: queryProductsRecord(
        queryBuilder: (productsRecord) => productsRecord.where(
          'tags',
          arrayContains: widget.tagSimilar,
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

        return ClipRRect(
          child: Container(
            height: 330.0,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
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
                                    'Relacionados',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                                      'RELACIONADOS_COMP_Icon_zquvijz5_ON_TAP');
                                  logFirebaseEvent('Icon_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SeeAllWidget(
                                          tagName: widget.tagSimilar!,
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 40.0, 5.0, 5.0),
                  child: Builder(
                    builder: (context) {
                      final oneproduct = functions
                              .filterProducts(
                                  containerProductsRecordList.toList(),
                                  FFAppState().townState,
                                  null,
                                  null)
                              ?.toList() ??
                          [];

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: oneproduct.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 5.0),
                        itemBuilder: (context, oneproductIndex) {
                          final oneproductItem = oneproduct[oneproductIndex];
                          return Visibility(
                            visible:
                                widget.productId != oneproductItem.reference,
                            child: ProductListWidget(
                              key: Key(
                                  'Keygw3_${oneproductIndex}_of_${oneproduct.length}'),
                              image: oneproductItem.gallery.first,
                              priceSale: oneproductItem.salePrice.toDouble(),
                              price: oneproductItem.price.toDouble(),
                              productName: oneproductItem.name,
                              productCaption: oneproductItem.caption,
                              productId: oneproductItem.reference,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
