import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static BuildContext? buildContext;

  Routes._();

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> navigationBarKey =
      GlobalKey<NavigatorState>();

  static const String mainScreen = '/';
  static const String topupScreen = '/topup';
  static const String successScreen = '/success';
  static const String profileScreen = '/profile';
  static const String searchScreen = '/search';
  static const String feedScreen = '/feed';
  static const String beneficirariesScreen = '/beneficiraries';

  static final GoRouter goRouter = GoRouter(
    observers: [],
    initialLocation: mainScreen,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: <RouteBase>[
      ShellRoute(
          navigatorKey: navigationBarKey,
          parentNavigatorKey: rootNavigatorKey,
          routes: [
            GoRoute(
              parentNavigatorKey: navigationBarKey,
              path: searchScreen,
              name: searchScreen,
              pageBuilder: (context, state) =>
                  _fadeTransitionScreenWrapper(context, state, SearchPage()),
            ),
            GoRoute(
              parentNavigatorKey: navigationBarKey,
              path: beneficirariesScreen,
              name: beneficirariesScreen,
              pageBuilder: (context, state) => _fadeTransitionScreenWrapper(
                  context, state, BeneficiariesPage()),
            ),
            GoRoute(
              parentNavigatorKey: navigationBarKey,
              path: mainScreen,
              name: mainScreen,
              pageBuilder: (context, state) =>
                  _fadeTransitionScreenWrapper(context, state, HomePage()),
            ),
            GoRoute(
              parentNavigatorKey: navigationBarKey,
              path: feedScreen,
              name: feedScreen,
              pageBuilder: (context, state) =>
                  _fadeTransitionScreenWrapper(context, state, FeedPage()),
            ),
            GoRoute(
              parentNavigatorKey: navigationBarKey,
              path: profileScreen,
              name: profileScreen,
              pageBuilder: (context, state) =>
                  _fadeTransitionScreenWrapper(context, state, ProfilePage()),
            ),
          ],
          builder: (context, state, child) {
            return Scaffold(
              body: child,
              bottomNavigationBar: CustomNavigationBar(
                onTap: (index) {
                  if (index == 0) {
                    Routes.navigateToScreen(
                        Routes.searchScreen, NavigateType.goNamed, context);
                    return;
                  } else if (index == 1) {
                    Routes.navigateToScreen(Routes.beneficirariesScreen,
                        NavigateType.goNamed, context);
                    return;
                  } else if (index == 2) {
                    Routes.navigateToScreen(
                        Routes.mainScreen, NavigateType.goNamed, context);
                    return;
                  } else if (index == 3) {
                    Routes.navigateToScreen(
                        Routes.feedScreen, NavigateType.goNamed, context);
                    return;
                  } else if (index == 4) {
                    Routes.navigateToScreen(
                        Routes.profileScreen, NavigateType.goNamed, context);
                    return;
                  }
                },
              ),
            );
          }),
      GoRoute(
          parentNavigatorKey: rootNavigatorKey,
          path: successScreen,
          name: successScreen,
          pageBuilder: (context, state) =>
              _fadeTransitionScreenWrapper(context, state, SuccessPage())),
      GoRoute(
          parentNavigatorKey: rootNavigatorKey,
          path: topupScreen,
          name: topupScreen,
          pageBuilder: (context, state) =>
              _fadeTransitionScreenWrapper(context, state, TopupPage())),
    ],
  );

  static void navigateToScreen(
    String screenName,
    NavigateType navigateType,
    BuildContext context, {
    Map<String, String>? queryParameters,
    Object? extra,
  }) async {
    switch (navigateType) {
      case NavigateType.pushNamed:
        GoRouter.of(context).pushNamed(screenName,
            queryParameters: queryParameters ?? {}, extra: extra);
        break;

      case NavigateType.goNamed:
        GoRouter.of(context).goNamed(screenName,
            queryParameters: queryParameters ?? {}, extra: extra);
        break;

      case NavigateType.pushReplacementNamed:
        GoRouter.of(context).pushReplacementNamed(screenName,
            queryParameters: queryParameters ?? {}, extra: extra);
        break;

      default:
        GoRouter.of(context)
            .goNamed(screenName, queryParameters: queryParameters ?? {});
        break;
    }
  }

  static void navigateToFirstScreen(context) {
    while (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }

  static CustomTransitionPage<dynamic> _fadeTransitionScreenWrapper(
      BuildContext context, dynamic state, Widget screen) {
    return CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.linear).animate(animation),
          child: child,
        );
      },
      key: state.pageKey,
      child: screen,
    );
  }
}
