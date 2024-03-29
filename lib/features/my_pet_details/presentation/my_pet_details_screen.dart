import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/media_query_values.dart';
import 'package:pile_up/features/create_dog_screen/presentation/create_dog_screen.dart';

class MyPetDetailsScreen extends StatelessWidget {
  const MyPetDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.backgroundColor,
        leading: IconButton(
          focusColor: AppColors.backgroundColor,
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          StringManager.appName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: context.width * .95,
                // height: 900.h,
                decoration: BoxDecoration(
                  color: AppColors.categoryContainer,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 150.h,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.r),
                              topLeft: Radius.circular(15.r),
                            ),
                            child: Image.asset(
                              AssetPath.dogImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              child: const Icon(Icons.edit),
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const CreateDogScreen(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.fade,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Toby',
                              style: Theme.of(context).textTheme.titleMedium),
                          SizedBox(
                            width: context.width * .95,
                            child: Text('Description about the dog',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                          SizedBox(height: 12.h),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.male),
                              Text('Male'),
                              Spacer(),
                              Icon(Icons.cake_outlined),
                              Text('4 years old'),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.difference),
                              Text('Golden Retriever',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              const Spacer(),
                              const Icon(Icons.monitor_weight_outlined),
                              const Text('12 kg'),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.color_lens_outlined),
                              Text('Gold',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              const Spacer(),
                              const Icon(Icons.close),
                              Text('Temperament',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.event_available),
                              Text('Availability',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              const Spacer(),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Mating',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text('Walking',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text('PlayDate',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.credit_card_outlined),
                              Text('Microchip ID',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              const Spacer(),
                              Text('123465798',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.credit_card_outlined),
                              Text('Registration Num',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              const Spacer(),
                              Text('123465798',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.medical_services_outlined),
                              Text('Medical Record',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              const Spacer(),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            height: context.height * .37,
                            child: Image.asset(AssetPath.medicalRecord,
                                fit: BoxFit.fitHeight),
                          ),
                        ],
                      ),
                    ),
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
