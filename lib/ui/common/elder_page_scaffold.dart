import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../theme.dart';
import 'buttons.dart';

class ElderPageScaffold extends StatelessWidget {
  /// Creates a Scaffold with a styled title and large back button.
  const ElderPageScaffold(
      {required this.title,
      required this.body,
      this.floatingActionButton,
      Key? key})
      : super(key: key);

  final Widget body;
  final String title;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    void backToHome() {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyles.headerDate,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          Flexible(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
              ),
              child: Container(
                color: Theme.of(context).backgroundColor,
                child: body,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PrimaryButton(S.of(context).btnBackToHome, backToHome),
          ),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
