import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

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
      body: Column(
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
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.forgetPassword);
              },
              child: CustomText(
                text: StringManager.forgetYourPassword.tr(),
                color: AppColors.primaryColor,
                fontSize: 10.sp,
              ),
            ),
          ),
          MainButton(
            text: StringManager.login.tr(),
            onTap: () {
              Navigator.pushNamed(context, Routes.mainScreen);
            },
            width: AppSize.screenWidth! * .9,
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
              Image.asset(AssetPath.google, scale: 2.5),
              SizedBox(width: 20.w),
              Image.asset(AssetPath.facebook, scale: 2.5),
              SizedBox(width: 20.w),
              Image.asset(AssetPath.apple, scale: 2.5),
              SizedBox(width: 20.w),
              Image.asset(AssetPath.google, scale: 2.5),
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
    );
  }
}
