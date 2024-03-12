import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/media_query_values.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/custom_Icon_text.dart';
import 'package:pile_up/core/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: homeAppBar(context,
          widget: const Text(
            StringManager.appName,
            style: TextStyle(color: Colors.white),
          ), leadingOnPressed: () {
        if (scaffoldKey.currentState!.isDrawerOpen) {
          scaffoldKey.currentState!.closeDrawer();
          //close drawer, if drawer is open
        } else {
          scaffoldKey.currentState!.openDrawer();
          //open drawer, if drawer is closed
        }
      }),
      drawer: Builder(builder: (context) {
        return const HomeDrawer();
      }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            //Category Container
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                height: context.height * .15,
                decoration: BoxDecoration(
                    color: AppColors.categoryContainer,
                    borderRadius: BorderRadius.circular(15)),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomIcon(text: 'All', icon: Icons.all_inclusive),
                    CustomIcon(text: 'Dogs', icon: Icons.pets),
                    CustomIcon(text: 'Cats', icon: Icons.pets),
                    CustomIcon(text: 'Birds', icon: Icons.pets),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              decoration: BoxDecoration(
                color: AppColors.categoryContainer,
                borderRadius: BorderRadius.circular(15),
              ),
              height: context.height * .6,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          AssetPath.logo,
                          height: context.height * .5,
                          // fit: BoxFit.fill,
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              icon: const Icon(Icons.favorite_border),
                              onPressed: () {}),
                          IconButton(
                            icon: const Icon(Icons.thumb_up_alt_outlined),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.thumb_down_alt_outlined),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
