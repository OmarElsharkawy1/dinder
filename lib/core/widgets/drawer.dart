import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/utils/media_query_values.dart';

import 'custom_text.dart';

class HomeDrawer1 extends StatefulWidget {
  const HomeDrawer1({super.key});

  @override
  State<HomeDrawer1> createState() => _HomeDrawer1State();
}

class _HomeDrawer1State extends State<HomeDrawer1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryBackGroundColor,
      width: AppSize.screenWidth! * .8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppSize.defaultSize! * 3,
          ),
          const Divider(
            thickness: 1,
          ),
          textButtonRow(
                  onPressed: () {},
                  text: StringManager.myWallet.tr(),
                  egp: '3000 EGP')
              .animate()
              .fadeIn() // uses `Animate.defaultDuration`
              .scale() // inherits duration from fadeIn
              .move(delay: 300.ms, duration: 600.ms),
          textButtonRow(
                  onPressed: () {}, text: StringManager.appName.tr(), egp: '17')
              .animate()
              .fadeIn() // uses `Animate.defaultDuration`
              .scale() // inherits duration from fadeIn
              .move(delay: 300.ms, duration: 600.ms),
          textButtonRow(
                  onPressed: () {},
                  text: StringManager.pilesIAm.tr(),
                  egp: '15')
              .animate()
              .fadeIn() // uses `Animate.defaultDuration`
              .scale() // inherits duration from fadeIn
              .move(delay: 300.ms, duration: 600.ms),
          const Divider(
            thickness: 1,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.login);
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppSize.defaultSize! * 4,
                  ),
                  Icon(
                    Icons.logout,
                    color: AppColors.primaryColor,
                    size: AppSize.defaultSize! * 2,
                  ),
                  SizedBox(
                    width: AppSize.defaultSize!,
                  ),
                  Text(
                    StringManager.logOut.tr(),
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.defaultSize! * 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: AppSize.screenHeight! * .05,
          ),
        ],
      ),
    );
  }

  Widget textButtonRow({
    required void Function()? onPressed,
    required String text,
    required String egp,
  }) {
    return TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            CustomText(
              text: '$egp    ',
              fontSize: AppSize.defaultSize! * 1.6,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: text,
              fontSize: AppSize.defaultSize! * 1.6,
              color: AppColors.greyColor,
            ),
          ],
        ));
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.width * .75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Omar Elsharkawy"),
            accountEmail: const Text("omarelsharkawy7@gmail.com"),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.7),
            ),
            currentAccountPictureSize: const Size.square(70.0),
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.asset(
                AssetPath.profilePic,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(AssetPath.dogImage),
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Text("Pet",
                          style: Theme.of(context).textTheme.headlineLarge),
                    ],
                  ),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
