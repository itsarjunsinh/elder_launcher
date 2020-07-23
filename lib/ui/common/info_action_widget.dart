import 'package:auto_size_text/auto_size_text.dart';
import 'package:elder_launcher/constants/custom_functions.dart';
import 'package:elder_launcher/ui/theme.dart';
import 'package:flutter/material.dart';

class InfoActionWidget extends StatelessWidget {
  final String message;
  final String buttonLabel;
  final IconData buttonIcon;
  final VoidFunction buttonOnClickAction;
  const InfoActionWidget(this.message, this.buttonLabel, this.buttonIcon,
      this.buttonOnClickAction);
  const InfoActionWidget.add(
      {String message, String buttonLabel, VoidFunction buttonOnClickAction})
      : message = message,
        buttonLabel = buttonLabel,
        buttonIcon = Icons.add,
        buttonOnClickAction = buttonOnClickAction;
  const InfoActionWidget.close(
      {String message, String buttonLabel, VoidFunction buttonOnClickAction})
      : message = message,
        buttonLabel = buttonLabel,
        buttonIcon = Icons.close,
        buttonOnClickAction = buttonOnClickAction;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
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
              RaisedButton(
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
                  ),
                  onPressed: buttonOnClickAction)
            ],
          ),
        ),
      ),
    );
  }
}
