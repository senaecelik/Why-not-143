import 'package:flutter/material.dart';
import 'package:why_not_143_team/route/route_constant.dart';
import 'package:why_not_143_team/screens/auth/cover_page.dart';
import 'package:why_not_143_team/screens/detail/detail_page.dart';
import 'package:why_not_143_team/screens/donate/donate_page.dart';
import 'package:why_not_143_team/screens/form_page.dart';
import 'package:why_not_143_team/screens/menu/drawer_page.dart';
import 'package:why_not_143_team/screens/menu/about_page.dart';
import 'package:why_not_143_team/screens/menu/feed_back_page.dart';
import 'package:why_not_143_team/screens/auth/login_page.dart';
import 'package:why_not_143_team/screens/auth/on_board_page.dart';
import 'package:why_not_143_team/screens/menu/profile_page.dart';
import 'package:why_not_143_team/screens/auth/register_page.dart';
import 'package:why_not_143_team/screens/auth/forgot_pass.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const DrawerPage());
      case RouteConstant.forgotPassRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case RouteConstant.coverScreenRoue:
        return MaterialPageRoute(builder: (_) => const CoverPage());
      case RouteConstant.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case RouteConstant.feedBackScreenRoute:
        return MaterialPageRoute(builder: (_) => const FeedBackPage());
      case RouteConstant.aboutScreenRoute:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      case RouteConstant.onBoardScreenRoute:
        return MaterialPageRoute(builder: (_) => const OnBoard());
      case RouteConstant.loginScreenRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case RouteConstant.registerScreenRoute:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case RouteConstant.formScreenRoute:
        return MaterialPageRoute(builder: (_) => const FormPage());
      case RouteConstant.donateScreenRoute:
        return MaterialPageRoute(builder: (_) => const DonatePage());

      case RouteConstant.detailScreenRoute:
        return MaterialPageRoute(builder: (_) => const DetailPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Ters giden birşeyler oldu'),
            ),
          ),
        );
    }
  }
}
