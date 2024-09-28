import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'delete_product_model.dart';
export 'delete_product_model.dart';

class DeleteProductWidget extends StatefulWidget {
  const DeleteProductWidget({
    super.key,
    required this.productReference,
  });

  final DocumentReference? productReference;

  @override
  State<DeleteProductWidget> createState() => _DeleteProductWidgetState();
}

class _DeleteProductWidgetState extends State<DeleteProductWidget> {
  late DeleteProductModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteProductModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295.0,
      height: 170.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SvgPicture.asset(
                'assets/images/solar_danger-broken_(1).svg',
                width: 50.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Text(
                '¿Estas seguro que deseas eliminar este producto?',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('DELETE_PRODUCT_COMP_NO_BTN_ON_TAP');
                        logFirebaseEvent('Button_close_dialog_drawer_etc');
                        Navigator.pop(context);
                      },
                      text: 'No',
                      options: FFButtonOptions(
                        height: 25.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(5.0),
                        hoverColor: FlutterFlowTheme.of(context).secondaryText,
                        hoverTextColor:
                            FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('DELETE_PRODUCT_COMP_SI_BTN_ON_TAP');
                        logFirebaseEvent('Button_backend_call');
                        await widget.productReference!.delete();
                        logFirebaseEvent('Button_bottom_sheet');
                        Navigator.pop(context);
                      },
                      text: 'Si',
                      options: FFButtonOptions(
                        height: 25.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(5.0),
                        hoverColor: FlutterFlowTheme.of(context).tertiary,
                        hoverTextColor:
                            FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
