import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/media_query_values.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/drawer.dart';
import 'package:pile_up/features/my_pet_details/presentation/my_pet_details_screen.dart';
import 'package:pile_up/features/my_profile_screen/prsentation/widgets/my_pets_card.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(
        context,
        actionIcon: Icons.settings,
        centerWidget: const Text(
          StringManager.appName,
          style: TextStyle(color: AppColors.primaryColor),
        ),
        leadingKey: _scaffoldKey,
      ),
      drawer: const HomeDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.categoryContainer,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: (60),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(AssetPath.profilePic,
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Name: Omar Elsharkawy',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('Age: 27',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('About me:',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.width * .89,
                          child: Text(
                            'Say whatever you want here about yourself and your pets',
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.start,
                            maxLines: 4,
                            // softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return InkWell(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const MyPetDetailsScreen(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.fade,
                          );
                        },
                        child: const MyPetCard());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
