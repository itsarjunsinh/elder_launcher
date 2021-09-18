import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class ActionPanel extends StatefulWidget {
  const ActionPanel({Key? key, required this.heading, required this.body})
      : super(key: key);

  final String heading;
  final Widget body;

  @override
  State<ActionPanel> createState() => _ActionPanelState();
}

class _ActionPanelState extends State<ActionPanel> {
  bool active = true;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (_, __) {
        setState(() {
          active = (active == true) ? false : true;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (_, __) {
            return Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.heading,
                  style: TextStyles.listTitle,
                ),
              ),
            );
          },
          body: widget.body,
          canTapOnHeader: true,
          isExpanded: active,
        ),
      ],
    );
  }
}
