import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'product_list_model.dart';
export 'product_list_model.dart';

class ProductListWidget extends StatefulWidget {
  /// Tarjeta de presentación del producto.
  const ProductListWidget({
    super.key,
    required this.image,
    this.priceSale,
    required this.price,
    required this.productName,
    required this.productCaption,
    required this.productId,
  });

  final String? image;
  final double? priceSale;
  final double? price;
  final String? productName;
  final String? productCaption;
  final DocumentReference? productId;

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  late ProductListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('PRODUCT_LIST_Container_awzx8dxw_ON_TAP');
        logFirebaseEvent('Container_navigate_to');

        context.pushNamed(
          'Product_Detail',
          queryParameters: {
            'productId': serializeParam(
              widget.productId,
              ParamType.DocumentReference,
            ),
          }.withoutNulls,
        );
      },
      child: Container(
        width: 160.0,
        height: 300.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                widget.image!,
                width: 200.0,
                height: 170.0,
                fit: BoxFit.cover,
                alignment: const Alignment(0.0, 0.0),
                cacheWidth: 1024,
                cacheHeight: 1024,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(2.0, 10.0, 2.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.priceSale! > 0.0)
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.price?.toString(),
                            '10',
                          ),
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Roboto Flex',
                                color: const Color(0xFF636363),
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.lineThrough,
                                useGoogleFonts: GoogleFonts.asMap()
                                    .containsKey('Roboto Flex'),
                              ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(2.0, 5.0, 2.0, 1.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      valueOrDefault<String>(
                        widget.priceSale! > 0.0
                            ? widget.priceSale?.toString()
                            : widget.price?.toString(),
                        '10',
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context)
                          .headlineLarge
                          .override(
                            fontFamily: 'Roboto Flex',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Roboto Flex'),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      valueOrDefault<String>(
                        widget.productName,
                        'name',
                      ).maybeHandleOverflow(maxChars: 38),
                      maxLines: 2,
                      minFontSize: 14.0,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 1.0),
                      child: AutoSizeText(
                        valueOrDefault<String>(
                          widget.productCaption,
                          'caption',
                        ),
                        maxLines: 1,
                        minFontSize: 12.0,
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
