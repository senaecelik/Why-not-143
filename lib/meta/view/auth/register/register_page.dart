import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/empty_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/helper/route/route_constant.dart';
import 'package:why_not_143_team/meta/view/auth/register/register_form.dart';
import 'package:why_not_143_team/meta/view/auth/register/register_page_view_model.dart';

import '../../../../core/services/firebase/firebase_auth_method.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
        viewModelBuilder: () => RegisterViewModel(),
        builder: (context, model, child) => WillPopScope(
              onWillPop: _onWillPop,
              child: Scaffold(
                  appBar: appBar(),
                  body: SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const UserRegisterForm(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              StringConstant.instance.registerSignIn,
                              style: TextStyleConstant.instance.textSmallMedium
                                  .copyWith(
                                      color: ColorConstant.instance.primary700),
                            ),
                            EmptyBox.instance.emptyBoxMedium,
                            Padding(
                              padding: PaddingConstant.instance.textPadding,
                              child: InkWell(
                                onTap: () {
                                  context
                                      .read<FirebaseAuthMethods>()
                                      .anonymously(context)
                                      .then((value) =>
                                          Navigator.pushReplacementNamed(
                                              context,
                                              RouteConstant.loginScreenRoute));
                                },
                                child: Text(StringConstant.instance.loginSignIn,
                                    style: TextStyleConstant
                                        .instance.textSmallMedium
                                        .copyWith(
                                      color: ColorConstant.instance.primary700,
                                      decoration: TextDecoration.underline,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))),
            ));
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        StringConstant.instance.registerSignUp,
        style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
      ),
    );
  }
}
