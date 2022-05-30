// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:why_not_143_team/meta/model/pet_model.dart';

class MyPetsPage extends StatefulWidget {
  final Pets pet;
  const MyPetsPage({Key? key, required this.pet}) : super(key: key);

  @override
  State<MyPetsPage> createState() => _MyPetsPageState();
}

class _MyPetsPageState extends State<MyPetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child:  Text(""),
    ));
  }
}
