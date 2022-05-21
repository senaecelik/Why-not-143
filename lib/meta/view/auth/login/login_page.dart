import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:why_not_143_team/meta/helper/constant/asset_path.dart';
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
                    forgotPassTextButton(context),
                    dontHaveAccYet(context),
                    loginTextOr(),
                    googleButton(context),
                  ],
                ),
              ),
            ));
  }
}

Widget forgotPassTextButton(BuildContext context) {
  return Align(
    alignment: Alignment.centerRight,
    child: Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteConstant.forgotPassRoute);
        },
        child: Text(StringConstant.instance.formForgotPass,
            style: TextStyleConstant.instance.verySmallMedium
                .copyWith(color: ColorConstant.instance.primary700)),
      ),
    ),
  );
}

Widget dontHaveAccYet(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
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
        padding: PaddingConstant.instance.loginPadding,
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
    padding: PaddingConstant.instance.loginPadding,
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
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            primary: ColorConstant.instance.white,
            onPrimary: ColorConstant.instance.yankeBlue,
            side:
                BorderSide(width: 1.0, color: ColorConstant.instance.yankeBlue),
          ),
        ),
      ),
    ),
  );
}

AppBar appBar(BuildContext context) {
  return AppBar(
    leadingWidth: 80,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text(
      StringConstant.instance.loginSignIn,
      style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
    ),
  );
}
