import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/notification_row.dart';
import 'package:pile_up/features/matching_screen/presentation/filter.dart';

AppBar appBar(BuildContext context,
    {required String text, void Function()? actionsOnPressed}) {
  return AppBar(
    backgroundColor: AppColors.backgroundColor,
    elevation: 0,
    title: CustomText(
      text: text,
      fontSize: 22.sp,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 15.w),
        child: IconButton(
          onPressed: actionsOnPressed ??
              () {
                showNotification(context);
              },
          icon: Image.asset(
            AssetPath.notification,
            width: AppSize.defaultSize! * 1.8,
            height: AppSize.defaultSize! * 2.3,
          ),
        ),
      )
    ],
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    ),
  );
}

AppBar authAppBar(BuildContext context,
    {required String text, void Function()? actionsOnPressed}) {
  return AppBar(
    backgroundColor: AppColors.scaffoldBackground,
    elevation: 0,
    title: CustomText(
      text: text,
      fontSize: AppSize.defaultSize! * 2.2,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppColors.primaryColor,
      ),
    ),
  );
}

AppBar homeAppBar(
  BuildContext context, {
  required IconData actionIcon,
  String? text,
  void Function()? actionsOnPressed,
  GlobalKey<ScaffoldState>? leadingKey,
  Widget? centerWidget,
  bool leading = true,
}) {
  return AppBar(
    backgroundColor: AppColors.backgroundColor,
    // foregroundColor: AppColors.backgroundColor,
    surfaceTintColor: AppColors.backgroundColor,
    elevation: 0,
    title: centerWidget ?? Container(),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        if (leadingKey!.currentState!.isDrawerOpen) {
          leadingKey.currentState!.closeDrawer();
          //close drawer, if drawer is open
        } else {
          leadingKey.currentState!.openDrawer();
          //open drawer, if drawer is closed
        }
      },
      icon: Image.asset(
        AssetPath.menu,
        color: AppColors.iconColor,
        width: 20.w,
        height: 20.w,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: const MatchingFilter(),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.fade,
          );
        },
        icon: Icon(
          actionIcon,
          size: 20.h,
          color: AppColors.iconColor,
        ),
      ),
    ],
  );
}

showNotification(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: AppSize.defaultSize! * 1.5,
          ),
          child: Dialog(
            alignment: Alignment.topRight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2),
            ),
            child: Container(
              height: AppSize.screenHeight! * .45,
              // width: AppSize.screenWidth! * .95,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSize.defaultSize!),
              ),
              child: const NotificationRow(),
            ),
          ),
        );
      });
}
