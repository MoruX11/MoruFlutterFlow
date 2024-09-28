import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info/updatename_hall/updatename_hall_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hall_list_model.dart';
export 'hall_list_model.dart';

class HallListWidget extends StatefulWidget {
  /// Este es un contenedor que aparece en la página de gestión de pasillos.
  /// Cuando el usario presiona aparece lo dirge a otra pagina donde se
  /// encuentra la información del pasillo en cuestión.
  ///
  /// Esta información puede ser editada.
  const HallListWidget({super.key});

  @override
  State<HallListWidget> createState() => _HallListWidgetState();
}

class _HallListWidgetState extends State<HallListWidget> {
  late HallListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HallListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      height: 55.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Align(
        alignment: const AlignmentDirectional(-1.0, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  '',
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleMediumFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleMediumFamily),
                      ),
                ),
              ),

              // Eliminar del pasillo, no eliminar producto.
              Align(
                alignment: const AlignmentDirectional(1.0, 0.0),
                child: Builder(
                  builder: (context) => Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(145.0, 0.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: FlutterFlowTheme.of(context).error,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'HALL_LIST_delete_outline_rounded_ICN_ON_');
                        logFirebaseEvent('IconButton_alert_dialog');
                        await showDialog(
                          barrierColor: const Color(0x4A14181B),
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: UpdatenameHallWidget(
                                hallwayNameToEdit: '',
                                store: currentUserDocument!.store!,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                hoverIconColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.edit_outlined,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('HALL_LIST_COMP_edit_outlined_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: SizedBox(
                          height: 500.0,
                          child: UpdatenameHallWidget(
                            hallwayNameToEdit: '',
                            store: currentUserDocument!.store!,
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
