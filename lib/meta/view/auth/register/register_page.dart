import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/helper/route/route_constant.dart';
import 'package:why_not_143_team/meta/view/auth/register/register_form.dart';
import 'package:why_not_143_team/meta/view/auth/register/register_page_view_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
        viewModelBuilder: () => RegisterViewModel(),
        builder: (context, model, child) => Scaffold(
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
                            .copyWith(color: ColorConstant.instance.primary700),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteConstant.registerScreenRoute);
                        },
                        child: Text(StringConstant.instance.loginSignIn,
                            style: TextStyleConstant.instance.textSmallMedium
                                .copyWith(
                              color: ColorConstant.instance.primary700,
                              decoration: TextDecoration.underline,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ))));
  }

  AppBar appBar() {
    return AppBar(
      leadingWidth: 80,
      title: Text(
        StringConstant.instance.registerSignUp,
        style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
      ),
    );
  }
}
