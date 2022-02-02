import 'package:flutter/material.dart';
import '../../common/elder_page_scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElderPageScaffold(
      title: 'Settings',
      body: ListView(
        children: const [
          Text('Appearance Settings'),
          CheckboxListTile(
            title: Text('Allow Homescreen Rotation'),
            value: true,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}
