import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/media_query_values.dart';

class PetCard extends StatelessWidget {
  const PetCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.categoryContainer,
        borderRadius: BorderRadius.circular(25),
      ),
      // height of appbar 50, navigation bar 50, 8 padding
      height: context.height - 120.h,
      width: context.width * .96,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Toby',
                          style: Theme.of(context).textTheme.titleMedium),
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.difference),
                          Text('Golden Retriever'),
                          Spacer(),
                          Icon(Icons.monitor_weight_outlined),
                          Text('12 kg'),
                        ],
                      ),
                      SizedBox(height: 8),
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
            )
          ],
        ),
      ),
    );
  }
}
