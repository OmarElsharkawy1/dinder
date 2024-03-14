import 'package:flutter/material.dart';
import 'package:pile_up/features/auth/presentation/forget%20password/change_password.dart';
import 'package:pile_up/features/auth/presentation/forget%20password/forget_password.dart';
import 'package:pile_up/features/auth/presentation/forget%20password/send_otp_code.dart';
import 'package:pile_up/features/auth/presentation/login_screen.dart';
import 'package:pile_up/features/auth/presentation/signup/sign_up.dart';
import 'package:pile_up/features/chat_screen/presentation/chat_screen.dart';
import 'package:pile_up/features/matching_screen/presentation/filter.dart';
import 'package:pile_up/features/matching_screen/presentation/matching_screen.dart';
import 'package:pile_up/features/messages_screen/presentation/messages_screen.dart';
import 'package:pile_up/features/my_profile_screen/prsentation/my_profile_screen.dart';
import 'package:pile_up/main_screen.dart';

class Routes {
  static const String login = "/login";
  static const String signUp = "/signUp";
  static const String forgetPassword = "/forgetPassword";
  static const String sendOTPCode = "/sendOTPCode";
  static const String changePassword = "/changePassword";
  static const String mainScreen = "/mainScreen";
  static const String messagesScreen = "/messagesScreen";
  static const String chatScreen = "/chatScreen";
  static const String myProfileScreen = "/MyProfileScreen";
  // static const String onBoarding = "/OnBoarding";
  static const String matchingScreen = "/matchingScreen";
  static const String matchingFilterScreen = "/matchingFilterScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainScreen:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MainScreen(),
            transitionsBuilder: customAnimate);
      case Routes.matchingScreen:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MatchingScreen(),
            transitionsBuilder: customAnimate);
      case Routes.matchingFilterScreen:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MatchingFilter(),
            transitionsBuilder: customAnimate);

      case Routes.myProfileScreen:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MyProfileScreen(),
            transitionsBuilder: customAnimate);
      case Routes.chatScreen:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ChatScreen(),
            transitionsBuilder: customAnimate);
      case Routes.messagesScreen:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MessagesScreen(),
            transitionsBuilder: customAnimate);

      case Routes.login:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LoginScreen(),
            transitionsBuilder: customAnimate);
      case Routes.signUp:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SignUpScreen(),
            transitionsBuilder: customAnimate);
      case Routes.forgetPassword:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ForgetPassword(),
            transitionsBuilder: customAnimate);
      case Routes.sendOTPCode:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SendOTPCode(),
            transitionsBuilder: customAnimate);
      case Routes.changePassword:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ChangePassword(),
            transitionsBuilder: customAnimate);
      //   case Routes.onBoarding:
      //   return PageRouteBuilder(
      //       pageBuilder: (context, animation, secondaryAnimation) =>
      //           const OnBoardingScreen(),
      //       transitionsBuilder: customAnimate);
      //   case Routes.profile:
      //   return PageRouteBuilder(
      //       pageBuilder: (context, animation, secondaryAnimation) =>
      //           const ProfileScreen(),
      //       transitionsBuilder: customAnimate);
    }
    return unDefinedRoute();
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}

Widget customAnimate(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // var begin = Offset(1.0, 0.0);
  // var end = Offset.zero;
  // var curve = Curves.decelerate;
  //
  // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}
