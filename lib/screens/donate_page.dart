import 'package:flutter/material.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Donate",
        style: TextStyle(fontSize: 60),
      )),
    );
  }
}
