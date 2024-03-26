import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/core/widgets/snack_bar.dart';
import 'package:pile_up/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:pile_up/features/auth/presentation/controller/login_bloc/login_with_email_and_password_states.dart';
import 'package:pile_up/features/auth/presentation/controller/sign_in_with_platform_bloc/sign_in_with_platform_bloc.dart';
import 'package:pile_up/features/auth/presentation/controller/sign_in_with_platform_bloc/sign_in_with_platform_event.dart';
import 'package:pile_up/features/auth/presentation/controller/sign_in_with_platform_bloc/sign_in_with_platform_state.dart';

import 'controller/login_bloc/login_with_email_and_password_events.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https://www.googleapis.com/auth/contatcs.readonly'
]);

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GoogleSignInAccount? currentUser;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        currentUser = account!;
      });
      if (currentUser != null) {
        print('User is already registered');
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print("Sign in error: $error");
    }
  }

  Future<void> handleSignOut() => _googleSignIn.disconnect();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      body: BlocListener<LoginWithEmailAndPasswordBloc,
          LoginWithEmailAndPasswordState>(
        listener: (context, state) {
          if (state is LoginWithEmailAndPasswordSuccessMessageState) {
            EasyLoading.dismiss();
            state.authModelResponse.isCompleted
                ? Navigator.pushNamedAndRemoveUntil(
                    context, Routes.mainScreen, (route) => false)
                : Navigator.pushNamedAndRemoveUntil(
                    context, Routes.myProfileScreen, (route) => false);
          } else if (state is LoginWithEmailAndPasswordErrorMessageState) {
            EasyLoading.dismiss();
            errorSnackBar(context, StringManager.unexpectedError);
          } else if (state is LoginWithEmailAndPasswordLoadingState) {
            EasyLoading.show(status: 'loading...');
          }
        },
        child: BlocListener<SignInWithPlatformBloc, SignInWithPlatformState>(
          listener: (context, state) async {
            if (state is SignWithGoogleSuccessMessageState) {
              if (state.userData.apiUserData.phone == null) {
              } else {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.mainScreen,
                  (route) => false,
                );
              }
            } else if (state is SignWithGoogleErrorMessageState) {
              // print('${state.errorMessage}ssssssssss');
              errorSnackBar(context, state.errorMessage);
            } else if (state is SignWithPlatFormLoadingState) {}
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Image.asset(
                AssetPath.logo,
                height: 78.h,
                width: 101.w,
              ),
              CustomText(
                text: StringManager.welcomeBack.tr(),
                fontSize: 20.sp,
              ),
              CustomText(
                text: StringManager.loginTo.tr(),
                fontSize: 12.sp,
                color: AppColors.greyColor,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  children: [
                    ColumnWithTextField(
                      text: StringManager.email.tr(),
                      controller: emailController,
                    ),
                    ColumnWithTextField(
                      text: StringManager.password.tr(),
                      obscureText: isVisible,
                      controller: passwordController,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: Icon(
                          isVisible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                // child: TextButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, Routes.forgetPassword);
                //   },
                child: CustomText(
                  text: StringManager.forgetYourPassword.tr(),
                  color: AppColors.primaryColor,
                  fontSize: 10.sp,
                ),
              ),
              // ),
              MainButton(
                text: StringManager.signIn.tr(),
                onTap: () {
                  if (validation()) {
                    BlocProvider.of<LoginWithEmailAndPasswordBloc>(context).add(
                        LoginWithEmailAndPasswordEvent(
                            email: emailController.text,
                            password: 'Nn@\$${passwordController.text}'));
                  } else {
                    errorSnackBar(
                        context, StringManager.pleaseCompleteYourData);
                  }
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                StringManager.or.tr(),
                style: TextStyle(
                    color: AppColors.greyColor2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        BlocProvider.of<SignInWithPlatformBloc>(context)
                            .add(SignGoogleEvent());
                      },
                      child: Image.asset(AssetPath.google, scale: 2.5)),
                  SizedBox(width: 20.w),
                  Image.asset(AssetPath.facebook, scale: 2.5),
                  SizedBox(width: 20.w),
                  Image.asset(AssetPath.apple, scale: 2.5),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringManager.doNotHaveAccount.tr(),
                    style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, Routes.signUp),
                    child: Text(
                      StringManager.signUp.tr(),
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 40.h,
              // ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  bool validation() {
    if (emailController.text == '') {
      return false;
    } else if (passwordController.text == '') {
      return false;
    } else {
      return true;
    }
  }
}
