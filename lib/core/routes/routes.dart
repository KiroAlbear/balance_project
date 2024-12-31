import 'package:balance_project/features/home/presentation/pages/home_page.dart';
import 'package:balance_project/features/home/presentation/pages/topup_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static BuildContext? buildContext;

  Routes._();

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static const String mainScreen = '/';
  static const String topupScreen = '/topup';
  static const String successScreen = '/success';

  static final GoRouter goRouter = GoRouter(
    observers: [],
    initialLocation: mainScreen,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: topupScreen,
        name: topupScreen,
        builder: (context, state) => TopupPage(),
      ),
      GoRoute(path: "/", builder: (context, state) => HomePage()),
      // GoRoute(path: topupScreen, builder: (context, state) => TopupPage()),
      // GoRoute(path: successScreen, builder: (context, state) => SuccessPage()),
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

  static CustomTransitionPage<dynamic> fadeTransitionScreenWrapper(
      BuildContext context, dynamic state, Widget screen) {
    return CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 800),
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

class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(0, -1),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.ease),
                ),
              ),
              child: child,
            );
          },
        );
}

enum NavigateType { pushNamed, goNamed, pushReplacementNamed }
