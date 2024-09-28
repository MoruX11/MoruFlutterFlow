import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_l_model.dart';
export 'auth_l_model.dart';

class AuthLWidget extends StatefulWidget {
  /// Aquí el vendedor podrá ingresar a su tienda.
  const AuthLWidget({super.key});

  @override
  State<AuthLWidget> createState() => _AuthLWidgetState();
}

class _AuthLWidgetState extends State<AuthLWidget>
    with TickerProviderStateMixin {
  late AuthLModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthLModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AuthL'});
    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            color: const Color(0xFF693CB7),
            angle: 0.524,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: const AlignmentDirectional(0.0, 0.0),
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              constraints: const BoxConstraints(
                maxWidth: 1024.0,
                maxHeight: 1024.0,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).secondary
                  ],
                  stops: const [0.0, 1.0],
                  begin: const AlignmentDirectional(0.0, -1.0),
                  end: const AlignmentDirectional(0, 1.0),
                ),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.78),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'AUTH_L_INICIAR_SESIN_CON_GOOGLE_BTN_ON_T');
                              logFirebaseEvent('Button_auth');
                              GoRouter.of(context).prepareAuthEvent();
                              final user =
                                  await authManager.signInWithGoogle(context);
                              if (user == null) {
                                return;
                              }
                              if (valueOrDefault(
                                          currentUserDocument?.documentType,
                                          '') ==
                                      '') {
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamedAuth(
                                    'CreateAccountPerson', context.mounted);
                              } else {
                                logFirebaseEvent('Button_firestore_query');
                                _model.storeFounded =
                                    await queryStoresRecordOnce(
                                  queryBuilder: (storesRecord) =>
                                      storesRecord.where(
                                    'owner',
                                    isEqualTo: currentUserReference,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                if (currentUserDocument?.store != null) {
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamedAuth(
                                      'Tienda', context.mounted);

                                  logFirebaseEvent(
                                      'Button_google_analytics_event');
                                  logFirebaseEvent('Login');
                                } else {
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamedAuth(
                                    'CreateStore',
                                    context.mounted,
                                    queryParameters: {
                                      'personid': serializeParam(
                                        currentUserReference?.id,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                }
                              }

                              safeSetState(() {});
                            },
                            text: 'Iniciar Sesión con Google',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Plus Jakarta Sans'),
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                              hoverColor: FlutterFlowTheme.of(context).primary,
                              hoverBorderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                width: 1.0,
                              ),
                              hoverTextColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              hoverElevation: 5.0,
                            ),
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation']!),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.94, -0.95),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'AUTH_L_PAGE_Icon_epgu6qus_ON_TAP');
                              logFirebaseEvent('Icon_navigate_back');
                              context.safePop();
                            },
                            child: Icon(
                              Icons.chevron_left_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 50.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.79, 0.5),
                    child: AutoSizeText(
                      '¡Bienvenido de vuelta!',
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineSmallFamily,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineSmallFamily),
                              ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.62),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 60.0, 0.0),
                      child: AutoSizeText(
                        'Inicia sesión para promocionar tu negocio y conectar con nuevos clientes.',
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                  lineHeight: 1.5,
                                ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.86, 0.39),
                    child: AutoSizeText(
                      'Mōru App',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Bree Serif',
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 45.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Bree Serif'),
                          ),
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation']!),
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
