import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'models/app_model.dart';
import 'models/contact_model.dart';
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
        ChangeNotifierProvider<AppModel>(create: (_) => AppModel()),
        ChangeNotifierProvider<ContactModel>(create: (_) => ContactModel()),
        ChangeNotifierProvider<SettingsModel>(create: (_) => SettingsModel()),
      ],
      child: Selector<SettingsModel, ThemeData>(
        selector: (_, settingsModel) => settingsModel.currentTheme,
        builder: (_, currentTheme, __) => MaterialApp(
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
      ),
    );
  }
}
