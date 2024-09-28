import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/principal_pages_morustores/see_all_hallways/see_all_hallways_widget.dart';
import '/product_page/product_list/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hallway_model.dart';
export 'hallway_model.dart';

class HallwayWidget extends StatefulWidget {
  /// Esta es la estructura que se presenta en el perfil del vendedor. Muestra
  /// los pasillos creados por el y los productos que pertenecen a esos
  /// pasillos.
  const HallwayWidget({
    super.key,
    required this.hallwayName,
    required this.storeId,
  });

  final String? hallwayName;
  final DocumentReference? storeId;

  @override
  State<HallwayWidget> createState() => _HallwayWidgetState();
}

class _HallwayWidgetState extends State<HallwayWidget> {
  late HallwayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HallwayModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProductsRecord>>(
      stream: queryProductsRecord(
        queryBuilder: (productsRecord) => productsRecord
            .where(
              'store',
              isEqualTo: widget.storeId,
            )
            .where(
              'hallway',
              arrayContains: widget.hallwayName,
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
                                    valueOrDefault<String>(
                                      widget.hallwayName,
                                      'name hall',
                                    ),
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
                                      'HALLWAY_COMP_Icon_r6idigap_ON_TAP');
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
                                        child: SizedBox(
                                          height: 720.0,
                                          child: SeeAllHallwaysWidget(
                                            hallwayName: widget.hallwayName!,
                                            storeId: widget.storeId!,
                                          ),
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
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(5.0, 40.0, 5.0, 5.0),
                    child: Builder(
                      builder: (context) {
                        final product = containerProductsRecordList.toList();

                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: product.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 5.0),
                          itemBuilder: (context, productIndex) {
                            final productItem = product[productIndex];
                            return ProductListWidget(
                              key: Key(
                                  'Keynas_${productIndex}_of_${product.length}'),
                              image: productItem.gallery.first,
                              priceSale: productItem.salePrice.toDouble(),
                              price: productItem.price.toDouble(),
                              productName: productItem.name,
                              productCaption: productItem.caption,
                              productId: productItem.reference,
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
        );
      },
    );
  }
}
