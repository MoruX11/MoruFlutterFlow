import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const HomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const HomePageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'AuthL',
          path: '/authL',
          builder: (context, params) => const AuthLWidget(),
        ),
        FFRoute(
          name: 'CreateAccountPerson',
          path: '/createAccountPerson',
          builder: (context, params) => const CreateAccountPersonWidget(),
        ),
        FFRoute(
          name: 'CreateStore',
          path: '/createStore',
          builder: (context, params) => CreateStoreWidget(
            personid: params.getParam(
              'personid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'onboarding',
          path: '/onboarding',
          builder: (context, params) => OnboardingWidget(
            storename: params.getParam(
              'storename',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Tienda',
          path: '/tienda',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Tienda')
              : const TiendaWidget(),
        ),
        FFRoute(
          name: 'Cuenta',
          path: '/cuenta',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Cuenta')
              : const CuentaWidget(),
        ),
        FFRoute(
          name: 'Productos',
          path: '/productos',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Productos')
              : const ProductosWidget(),
        ),
        FFRoute(
          name: 'Create_Product',
          path: '/createProduct',
          requireAuth: true,
          builder: (context, params) => const CreateProductWidget(),
        ),
        FFRoute(
          name: 'Update_Data',
          path: '/updateData',
          builder: (context, params) => UpdateDataWidget(
            dataPerson: params.getParam(
              'dataPerson',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['persons'],
            ),
            dataStore: params.getParam(
              'dataStore',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['stores'],
            ),
          ),
        ),
        FFRoute(
          name: 'Restaurantes',
          path: '/restaurantes',
          builder: (context, params) => RestaurantesWidget(
            town: params.getParam(
              'town',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Groceries',
          path: '/groceries',
          builder: (context, params) => GroceriesWidget(
            town: params.getParam(
              'town',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Regalos',
          path: '/regalos',
          builder: (context, params) => RegalosWidget(
            town: params.getParam(
              'town',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Moda',
          path: '/moda',
          builder: (context, params) => ModaWidget(
            town: params.getParam(
              'town',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'search',
          path: '/search',
          builder: (context, params) => SearchWidget(
            searchFromHomePage: params.getParam(
              'searchFromHomePage',
              ParamType.String,
            ),
            townNameFromHomePage: params.getParam(
              'townNameFromHomePage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, params) => ProfileWidget(
            storeId: params.getParam(
              'storeId',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['stores'],
            ),
          ),
        ),
        FFRoute(
          name: 'Administrar_Pasillos',
          path: '/administrarPasillos',
          builder: (context, params) => const AdministrarPasillosWidget(),
        ),
        FFRoute(
          name: 'verificar_numero_person',
          path: '/verificarNumeroPerson',
          builder: (context, params) => VerificarNumeroPersonWidget(
            documentType: params.getParam(
              'documentType',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            document: params.getParam(
              'document',
              ParamType.int,
            ),
            phoneNumber: params.getParam(
              'phoneNumber',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'Edit_Product',
          path: '/editProduct',
          requireAuth: true,
          builder: (context, params) => EditProductWidget(
            productToEdit: params.getParam(
              'productToEdit',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['products'],
            ),
          ),
        ),
        FFRoute(
          name: 'Product_Detail',
          path: '/productDetail',
          builder: (context, params) => ProductDetailWidget(
            productId: params.getParam(
              'productId',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['products'],
            ),
          ),
        ),
        FFRoute(
          name: 'verificar_numero_tienda',
          path: '/verificarNumeroTienda',
          builder: (context, params) => VerificarNumeroTiendaWidget(
            storeName: params.getParam(
              'storeName',
              ParamType.String,
            ),
            phone: params.getParam(
              'phone',
              ParamType.int,
            ),
            logo: params.getParam(
              'logo',
              ParamType.String,
            ),
            address: params.getParam(
              'address',
              ParamType.String,
            ),
            nit: params.getParam(
              'nit',
              ParamType.int,
            ),
            description: params.getParam(
              'description',
              ParamType.String,
            ),
            categoryType: params.getParam(
              'categoryType',
              ParamType.String,
            ),
            town: params.getParam(
              'town',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'verificar_numero_editar_person',
          path: '/verificarNumeroEditarPerson',
          builder: (context, params) => VerificarNumeroEditarPersonWidget(
            namePerson: params.getParam(
              'namePerson',
              ParamType.String,
            ),
            phonePerson: params.getParam(
              'phonePerson',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'verificar_numero_editar_store',
          path: '/verificarNumeroEditarStore',
          builder: (context, params) => VerificarNumeroEditarStoreWidget(
            storeName: params.getParam(
              'storeName',
              ParamType.String,
            ),
            storeRef: params.getParam(
              'storeRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['stores'],
            ),
            cellphone: params.getParam(
              'cellphone',
              ParamType.int,
            ),
            nit: params.getParam(
              'nit',
              ParamType.int,
            ),
            logo: params.getParam(
              'logo',
              ParamType.String,
            ),
            description: params.getParam(
              'description',
              ParamType.String,
            ),
            address: params.getParam(
              'address',
              ParamType.String,
            ),
            town: params.getParam(
              'town',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/homePage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/FEFDF.png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
