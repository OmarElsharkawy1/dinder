import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/features/my_pets_screen/presentation/widgets/my_pets_card.dart';

class MyPetsScreen extends StatefulWidget {
  const MyPetsScreen({Key? key}) : super(key: key);

  @override
  State<MyPetsScreen> createState() => _MyPetsScreenState();
}

class _MyPetsScreenState extends State<MyPetsScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        surfaceTintColor: AppColors.backgroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Pets', style: Theme.of(context).textTheme.titleLarge),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
                child: ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return CircleAvatar(
                      radius: (30),
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child:
                            Image.asset(AssetPath.dogImage, fit: BoxFit.fill),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return const PersonalDogCard();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
