import 'package:flutter/material.dart';
import '../../components/text/not_found_navigation.dart';
import '../../constants/navigation/navigation_constant.dart';
import '../../../view/home/page/home_page.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> onGenerateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(
            args.arguments as HomePage, NavigationConstants.HOME_PAGE);

      case NavigationConstants.DETAILS_PAGE:
        return normalNavigate(
            args.arguments as DetailsPage, NavigationConstants.DETAILS_PAGE);

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigation(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget, settings: RouteSettings(name: pageName));
  }
}
