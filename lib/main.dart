import 'package:elder_launcher/data_sources/app_repository.dart';
import 'package:elder_launcher/data_sources/contact_repository.dart';
import 'package:elder_launcher/models/app_model.dart';
import 'package:elder_launcher/models/contact_model.dart';
import 'package:elder_launcher/models/date_time_model.dart';
import 'package:elder_launcher/generated/l10n.dart';
import 'package:elder_launcher/ui/pages/home_page/home_page.dart';
import 'package:elder_launcher/ui/router.dart';
import 'package:elder_launcher/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => {runApp(MyApp())};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppModel>(
              create: (_) => AppModel(dataRepository: AppRepository())),
          ChangeNotifierProvider<ContactModel>(
              create: (_) => ContactModel(dataRepository: ContactRepository()))
        ],
        child: MaterialApp(
            title: 'Elder Launcher',
            home: DefaultTabController(length: 2, child: HomePage()),
            onGenerateRoute: generateRoute,
            localizationsDelegates: [
              S.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: lightTheme));
  }
}
