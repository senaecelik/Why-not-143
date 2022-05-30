import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:why_not_143_team/meta/helper/constant/asset_path.dart';
import 'package:why_not_143_team/meta/helper/constant/button_style.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/core/services/firebase_auth_method.dart';
import 'package:why_not_143_team/meta/helper/route/route_constant.dart';
import 'package:why_not_143_team/meta/view/auth/login/login_form.dart';
import 'package:why_not_143_team/meta/view/auth/login/login_page_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: appBar(context),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const UserLoginForm(),
                    dontHaveAccYet(context),
                    loginTextOr(),
                    googleButton(context),
                  ],
                ),
              ),
            ));
  }
}

Widget dontHaveAccYet(BuildContext context) {
  return Padding(
    padding: PaddingConstant.instance.genelButtonPadding,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          StringConstant.instance.loginSignUp,
          style: TextStyleConstant.instance.textSmallMedium
              .copyWith(color: ColorConstant.instance.primary700),
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouteConstant.registerScreenRoute);
          },
          child: Text(StringConstant.instance.registerSignUp,
              style: TextStyleConstant.instance.textSmallMedium.copyWith(
                color: ColorConstant.instance.primary700,
                decoration: TextDecoration.underline,
              )),
        ),
      ],
    ),
  );
}

Row loginTextOr() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: PaddingConstant.instance.genelButtonPadding,
        child: Text(
          StringConstant.instance.loginTextOr,
          style: TextStyleConstant.instance.textSmallMedium
              .copyWith(color: ColorConstant.instance.neutral),
        ),
      ),
    ],
  );
}

Padding googleButton(BuildContext context) {
  return Padding(
    padding: PaddingConstant.instance.genelButtonPadding,
    child: SizedBox(
      child: SizedBox(
        height: 58.h,
        width: MediaQuery.of(context).size.height,
        child: ElevatedButton.icon(
          onPressed: () async {
            await context.read<FirebaseAuthMethods>().signInWithGoogle(context);
          },
          icon: Tab(
            icon: Image.asset(AssetPath.instance.loginImage),
            iconMargin: const EdgeInsets.all(30),
          ),
          label: Text(
            StringConstant.instance.loginSignInGoogle,
            style: TextStyleConstant.instance.textLargeMedium,
          ),
          style: ButtonStyleConstant.instance.whiteButtonStyle,
        ),
      ),
    ),
  );
}

AppBar appBar(BuildContext context) {
  return AppBar(
    title: Text(
      StringConstant.instance.loginSignIn,
      style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
    ),
  );
}
