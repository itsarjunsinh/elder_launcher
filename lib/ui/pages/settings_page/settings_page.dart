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
