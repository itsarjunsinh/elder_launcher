import 'package:elder_launcher/constants/edit_mode.dart';
import 'package:elder_launcher/constants/route_names.dart';
import 'package:elder_launcher/ui/pages/app_drawer/app_drawer.dart';
import 'package:elder_launcher/ui/pages/edit_page/edit_page.dart';
import 'package:elder_launcher/ui/pages/home_page/home_page.dart';
import 'package:elder_launcher/ui/pages/reorder_page/reorder_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return _getPageRoute(routeName: settings.name, viewToShow: HomePage());
    case AppDrawerRoute:
      return _getPageRoute(
          routeName: settings.name, viewToShow: AppDrawerScreen());
    case EditPageRoute:
      var editMode = settings.arguments as EditMode;
      return _getPageRoute(
          routeName: settings.name, viewToShow: EditPage(editMode));
    case ReorderPageRoute:
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
