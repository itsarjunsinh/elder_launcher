import 'package:elder_launcher/data_sources/app_repository.dart';
import 'package:elder_launcher/data_sources/contact_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'providers/app_provider.dart';
import 'providers/contact_provider.dart';
import 'models/settings_model.dart';
import 'ui/pages/home_page/home_page.dart';
import 'ui/router.dart';
import 'ui/theme.dart';

void main() => {runApp(const MyApp())};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(
            create: (_) => AppProvider(AppRepository())),
        ChangeNotifierProvider<ContactProvider>(
            create: (_) => ContactProvider(ContactRepository())),
        ChangeNotifierProvider<SettingsModel>(create: (_) => SettingsModel()),
      ],
      child: MaterialApp(
        title: 'Elder Launcher',
        home: const DefaultTabController(length: 2, child: HomePage()),
        onGenerateRoute: generateRoute,
        localizationsDelegates: const [
          S.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: tealTheme,
        darkTheme: darkTheme,
      ),
    );
  }
}
