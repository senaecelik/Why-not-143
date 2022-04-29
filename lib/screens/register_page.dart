import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart/color_constant.dart';
import '../constant.dart/string.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: Text(
          StringConstant.instance.registerSignUp,
          style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
        ),
      ),
      body: Column(),
    );
  }
}
