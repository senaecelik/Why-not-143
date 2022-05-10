import 'package:flutter/material.dart';

class MyPetsPage extends StatefulWidget {
  const MyPetsPage({Key? key}) : super(key: key);

  @override
  State<MyPetsPage> createState() => _MyPetsPageState();
}

class _MyPetsPageState extends State<MyPetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "MyPets",
              style: TextStyle(
                color: Colors.black,
                fontSize: 60,
              ),
            )
          ],
        ),
      ),
    );
  }
}
