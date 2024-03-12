import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';

class PersonalDogCard extends StatelessWidget {
  const PersonalDogCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 270.h,
        decoration: BoxDecoration(
          color: AppColors.categoryContainer,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
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
              child: SizedBox(
                height: 100.h,
                child: Column(
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
