import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pile_up/core/resource_manager/colors.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon, required this.text})
      : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60.h,
          width: 60.h,
          child: Card(
            elevation: 3,
            color: AppColors.scaffoldBackground,
            // shadowColor: Colors.grey,
            child: Icon(icon),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          text,
          style: const TextStyle(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
