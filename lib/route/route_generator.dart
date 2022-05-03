import 'package:flutter/material.dart';
import 'package:why_not_143_team/route/route_constant.dart';
import 'package:why_not_143_team/screens/cover_page.dart';
import 'package:why_not_143_team/screens/home_page.dart';
import 'package:why_not_143_team/screens/login_page.dart';
import 'package:why_not_143_team/screens/on_board_page.dart';
import 'package:why_not_143_team/screens/register_page.dart';
import 'package:why_not_143_team/screens/forgot_pass.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.forgotPassRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());

      case RouteConstant.coverScreenRoue:
        return MaterialPageRoute(builder: (_) => const CoverPage());

      case RouteConstant.onBoardScreenRoute:
        return MaterialPageRoute(builder: (_) => const OnBoard());
      case RouteConstant.loginScreenRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case RouteConstant.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouteConstant.registerScreenRoute:
        return MaterialPageRoute(builder: (_) => const RegisterPage());

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
