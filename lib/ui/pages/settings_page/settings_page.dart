import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/settings_model.dart';
import '../../common/elder_page_scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElderPageScaffold(
      title: 'Settings',
      body: Consumer<SettingsModel>(
        builder: (_, settingsModel, __) => ListView(
          children: [
            const Text('Appearance Settings'),
            const Text('Active Theme:'),
            // TODO: Add theme switcher
            const CheckboxListTile(
              title: Text('Follow System Dark Mode'),
              value: true,
              onChanged: null,
            ),
            const CheckboxListTile(
              title: Text('Make Homescreen Background Colored'),
              value: false,
              onChanged: null,
            ),
            const CheckboxListTile(
              title: Text('Allow Homescreen Rotation'),
              value: true,
              onChanged: null,
            ),
          ],
        ),
      ),
    );
  }
}
