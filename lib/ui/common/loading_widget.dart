import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: SizedBox(
          height: 150,
          width: 150,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
