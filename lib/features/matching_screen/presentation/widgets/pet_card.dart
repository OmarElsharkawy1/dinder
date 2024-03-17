import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/media_query_values.dart';
import 'package:pile_up/features/matching_screen/domain/model/dog_model.dart';
import 'package:pile_up/features/my_pet_details/presentation/my_pet_details_screen.dart';

class PetCard extends StatelessWidget {
  const PetCard({required this.dog, Key? key}) : super(key: key);

  final DogModel dog;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const MyPetDetailsScreen(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.fade,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.categoryContainer,
          borderRadius: BorderRadius.circular(15),
        ),
        // height of appbar 50, navigation bar 50, 8 padding
        height: context.height - 120.h,
        width: context.width * .96,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.r),
                    topLeft: Radius.circular(15.r),
                  ),
                  child: Image.asset(
                    AssetPath.dogImage,
                    height: context.height * .55,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Toby',
                                style: Theme.of(context).textTheme.titleMedium),
                            IconButton(
                              onPressed: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const MyPetDetailsScreen(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.fade,
                                );
                              },
                              icon: const Icon(Icons.arrow_circle_up),
                            )
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.male),
                            Text(dog.gender),
                            Spacer(),
                            Icon(Icons.cake_outlined),
                            Text(dog.age.toString()),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.difference),
                            Text('Golden Retriever'),
                            Spacer(),
                            Icon(Icons.monitor_weight_outlined),
                            Text(dog.weight.toString()),
                          ],
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_down_alt_outlined),
                          color: AppColors.primaryColor,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.thumb_up_alt_outlined),
                          color: AppColors.primaryColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
