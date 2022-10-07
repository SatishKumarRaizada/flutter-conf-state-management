import 'package:flutter/material.dart';
import 'package:my_shopping/config/model/container.dart';
import 'package:my_shopping/screens/cart/cart.dart';
import 'package:my_shopping/screens/home/home.dart';
import 'package:my_shopping/screens/item_detail/item_detail.dart';
import 'route_transition.dart';

class AppRoute {
  static const appDecider = '/';
  static const itemDetail = '/itemDetailPage';
  static const cartDetail = '/cartDetail';

  Route<String> onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case appDecider:
        return PageTransitionBuilder(
          widget: const HomeScreen(),
          transitionType: TransitionType.rightToLeftTransition,
        );

      case itemDetail:
        var detail = args as ItemListModel;
        return PageTransitionBuilder(
          widget: ItemDetailScreen(
            itemDetail: detail,
          ),
          transitionType: TransitionType.botttomToTop,
        );

      case cartDetail:
        return PageTransitionBuilder(
          widget: const ItemCartScreen(),
          transitionType: TransitionType.botttomToTop,
        );

      default:
        return PageTransitionBuilder(
          transitionType: TransitionType.rightToLeftTransition,
          widget: Container(),
        );
    }
  }
}
