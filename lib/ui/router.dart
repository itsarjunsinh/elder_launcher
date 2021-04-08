import 'package:flutter/material.dart';
import '../constants/edit_mode.dart';
import '../constants/route_names.dart';
import '../ui/pages/app_drawer/app_drawer.dart';
import '../ui/pages/edit_page/edit_page.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/reorder_page/reorder_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homePageRoute:
      return _getPageRoute(routeName: settings.name, viewToShow: HomePage());
    case appDrawerRoute:
      return _getPageRoute(
          routeName: settings.name, viewToShow: AppDrawerScreen());
    case editPageRoute:
      var editMode = settings.arguments as EditMode;
      return _getPageRoute(
          routeName: settings.name, viewToShow: EditPage(editMode));
    case reorderPageRoute:
      var editMode = settings.arguments as EditMode;
      return _getPageRoute(
          routeName: settings.name, viewToShow: ReorderPage(editMode));
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('Undefined Route'),
                ),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(name: routeName), builder: (_) => viewToShow);
}
