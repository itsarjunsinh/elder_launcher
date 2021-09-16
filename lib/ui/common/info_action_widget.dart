import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../constants/custom_functions.dart';
import '../theme.dart';

class InfoActionWidget extends StatelessWidget {
  final String message;
  final String buttonLabel;
  final IconData buttonIcon;
  final VoidFunction buttonOnClickAction;

  const InfoActionWidget(this.message, this.buttonLabel, this.buttonIcon,
      this.buttonOnClickAction);

  const InfoActionWidget.add(
      {required this.message,
      required this.buttonLabel,
      required this.buttonOnClickAction})
      : buttonIcon = Icons.add;

  const InfoActionWidget.close(
      {required this.message,
      required this.buttonLabel,
      required this.buttonOnClickAction})
      : buttonIcon = Icons.close;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                message,
                style: TextStyles.infoMessage,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                onPressed: buttonOnClickAction,
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          buttonIcon,
                          size: 35,
                        ),
                      ),
                      Flexible(
                        child: AutoSizeText(
                          buttonLabel,
                          style: TextStyles.actionButtonLabel,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
