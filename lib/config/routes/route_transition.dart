import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TransitionType {
  //fadeTransition,
  leftToRightTransition,
  //scaleTransition,
  rightToLeftTransition,
  botttomToTop
}

class PageTransitionBuilder<T> extends PageRoute<T> {
  final Widget widget;
  @override
  // ignore: overridden_fields
  final bool fullscreenDialog;
  final TransitionType transitionType;
  PageTransitionBuilder({
    required this.widget,
    RouteSettings? settings,
    this.transitionType = TransitionType.rightToLeftTransition,
    this.fullscreenDialog = false,
  }) : super(settings: settings, fullscreenDialog: fullscreenDialog);

  @override
  Color? get barrierColor => null;
  @override
  String? get barrierLabel => null;
  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
  @override
  bool get maintainState => true;
  @override
  bool canTransitionFrom(TransitionRoute<dynamic> previousRoute) {
    return previousRoute is MaterialPageRoute ||
        previousRoute is CupertinoPageRoute;
  }

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) {
    return (nextRoute is MaterialPageRoute && !nextRoute.fullscreenDialog) ||
        (nextRoute is CupertinoPageRoute && !nextRoute.fullscreenDialog);
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    assert(() {
      // ignore: unnecessary_null_comparison
      if (widget == null) {
        throw FlutterError(
            'The builder for route "${settings.name}" returned null.\n'
            'Route builders must never return null.');
      }
      return true;
    }());
    if (Theme.of(context).platform == TargetPlatform.android) {
      return FadeTransition(
        opacity: animation,
        child: widget,
      );
    } else {
      return Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: widget,
      );
    }
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // ignore: prefer_typing_uninitialized_variables
    var offse;
    if (transitionType == TransitionType.leftToRightTransition) {
      offse = const Offset(-1, 0);
    } else if (transitionType == TransitionType.rightToLeftTransition) {
      offse = const Offset(1, 0);
    } else if (transitionType == TransitionType.botttomToTop) {
      offse = const Offset(0.0, 1.0);
    }
    return SlideTransition(
      position: Tween<Offset>(
        begin: offse,
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';
}
