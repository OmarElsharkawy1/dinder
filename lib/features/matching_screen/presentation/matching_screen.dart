import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/drawer.dart';
import 'package:pile_up/features/matching_screen/presentation/widgets/pet_card.dart';

class MatchingScreen extends StatefulWidget {
  const MatchingScreen({Key? key}) : super(key: key);

  @override
  State<MatchingScreen> createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<MatchingScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            const Draggable(
              feedback: PetCard(),
              // the shown card behind the card you swipe
              childWhenDragging: PetCard(),
              child: PetCard(),
            ),
          ],
        ),
      ),
    );
  }
}
