import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
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
