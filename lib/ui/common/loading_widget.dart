import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}
