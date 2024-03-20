import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/media_query_values.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/drop_down_custom.dart';
import 'package:pile_up/core/widgets/main_button.dart';

class CreateDogScreen extends StatefulWidget {
  const CreateDogScreen({Key? key}) : super(key: key);

  @override
  State<CreateDogScreen> createState() => _CreateDogScreenState();
}

class _CreateDogScreenState extends State<CreateDogScreen> {
  String breed = 'Golden';
  String dogColor = 'Golden';
  String dogGender = 'Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringManager.appName),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
              Container(
                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.categoryContainer,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: 'Upload an image', fontSize: 18.sp),
                      Icon(
                        Icons.add_a_photo_outlined,
                        size: 50.w,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.categoryContainer,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ColumnWithTextField(
                            text: 'Name',
                            width: context.width * .4,
                          ),
                          ColumnWithTextField(
                            text: 'Age',
                            width: context.width * .4,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ColumnWithTextField(
                            text: 'Weight',
                            width: context.width * .4,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gender',
                                style: TextStyle(fontSize: 12.sp),
                              ),
                              CustomDropdownButton2(
                                dropdownItems: const ['Male', 'Female'],
                                buttonWidth: context.width * .4,
                                dropdownWidth: context.width * .4,
                                dropdownColor: AppColors.categoryContainer,
                                hint: 'Choose gender',
                                value: dogGender,
                                onChanged: (String? value) {
                                  dogGender = value!;
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Breed',
                                style: TextStyle(fontSize: 12.sp),
                              ),
                              CustomDropdownButton2(
                                dropdownItems: const [
                                  'Golden',
                                  'Bulldog',
                                  'Labrador',
                                  'German',
                                ],
                                buttonWidth: context.width * .4,
                                dropdownWidth: context.width * .4,
                                dropdownColor: AppColors.categoryContainer,
                                hint: 'Choose Breed',
                                value: breed,
                                onChanged: (String? value) {
                                  breed = value!;
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Color',
                                style: TextStyle(fontSize: 12.sp),
                              ),
                              CustomDropdownButton2(
                                dropdownItems: const [
                                  'Black',
                                  'White',
                                  'Grey',
                                  'Golden',
                                ],
                                buttonWidth: context.width * .4,
                                dropdownWidth: context.width * .4,
                                dropdownColor: AppColors.categoryContainer,
                                hint: 'Choose a color',
                                value: dogColor,
                                onChanged: (String? value) {
                                  dogColor = value!;
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      ColumnWithTextField(text: 'MicroChip ID'),
                      ColumnWithTextField(text: 'Registration Number'),
                      ColumnWithTextField(text: 'Description'),
                      SizedBox(height: 8.h),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.categoryContainer,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: 'Upload Medical Record', fontSize: 18.sp),
                      Icon(
                        Icons.add_a_photo_outlined,
                        size: 50.w,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: MainButton(
                  text: 'Create',
                  onTap: () => Navigator.pushNamed(context, Routes.mainScreen),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
