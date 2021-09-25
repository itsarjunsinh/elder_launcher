import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'models/app_model.dart';
import 'models/contact_model.dart';
import 'ui/pages/home_page/home_page.dart';
import 'ui/router.dart';
import 'ui/theme.dart';

void main() => {runApp(MyApp())};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppModel>(create: (_) => AppModel()),
          ChangeNotifierProvider<ContactModel>(create: (_) => ContactModel())
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
          theme: tealTheme,
          darkTheme: darkTheme,
        ));
  }
}
