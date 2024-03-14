import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/custom_drop_down.dart';
import 'package:pile_up/core/widgets/drop_down_custom.dart';

class MatchingFilter extends StatefulWidget {
  const MatchingFilter({Key? key}) : super(key: key);

  @override
  State<MatchingFilter> createState() => _MatchingFilterState();
}

class _MatchingFilterState extends State<MatchingFilter> {
  bool isMating = false;
  bool isWalkingPartner = false;
  bool isPlayingDate = false;
  bool isMale = false;
  bool isTemperament = false;
  double ageStartValue = 0;
  double ageEndValue = 20;
  double proximityStartValue = 0;
  double proximityEndValue = 100;
  String breed = 'Golden';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        title: Text(
          'Narrow your search',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dating basics',
                  style: Theme.of(context).textTheme.titleSmall),
              SizedBox(height: 16.h),
              Text('What is you availability',
                  style: Theme.of(context).textTheme.titleSmall),
              SizedBox(height: 4.h),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: AppColors.borderColor, width: .2),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Mating'),
                        Checkbox(
                          value: isMating,
                          onChanged: (bool? value) {
                            setState(() {
                              isMating = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Walking Partner'),
                        Checkbox(
                          value: isWalkingPartner,
                          onChanged: (bool? value) {
                            setState(() {
                              isWalkingPartner = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Playing Date'),
                        Checkbox(
                          value: isPlayingDate,
                          onChanged: (bool? value) {
                            setState(() {
                              isPlayingDate = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ColumnWithTextField(
                text: 'Select a breed',
                requiredInput: false,
                dropDown: CustomDropdownButton2(
                  hint: '',
                  value: breed,
                  dropdownItems: const [
                    'Golden',
                    'PullDog',
                    'German',
                  ],
                  onChanged: (String? value) {
                    breed = value!;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h, bottom: 4.h),
                child: Text('Age, Proximity',
                    style: Theme.of(context).textTheme.titleSmall),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: AppColors.borderColor, width: .2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Age',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('Between 0 and 20',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 1.h,
                        trackShape: const RoundedRectSliderTrackShape(),
                        activeTrackColor: AppColors.activeTrackSliderColor,
                        inactiveTrackColor: AppColors.inactiveTrackSliderColor,
                        rangeThumbShape: RoundRangeSliderThumbShape(
                          enabledThumbRadius: 8.0.r,
                        ),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 0.0),
                      ),
                      child: RangeSlider(
                        divisions: 20,
                        labels: RangeLabels(
                          ageStartValue.round().toString(),
                          ageEndValue.round().toString(),
                        ),
                        min: 0.0,
                        max: 20.0,
                        values: RangeValues(ageStartValue, ageEndValue),
                        onChanged: (values) {
                          setState(() {
                            ageStartValue = values.start;
                            ageEndValue = values.end;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Proximity',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('Between 0 to 100km',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 1.h,
                        trackShape: const RoundedRectSliderTrackShape(),
                        activeTrackColor: AppColors.activeTrackSliderColor,
                        inactiveTrackColor: AppColors.inactiveTrackSliderColor,
                        rangeThumbShape: RoundRangeSliderThumbShape(
                          enabledThumbRadius: 8.0.r,
                        ),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 0.0),
                      ),
                      child: RangeSlider(
                        divisions: 20,
                        labels: RangeLabels(
                          proximityStartValue.round().toString(),
                          proximityEndValue.round().toString(),
                        ),
                        min: 0.0,
                        max: 100.0,
                        values:
                            RangeValues(proximityStartValue, proximityEndValue),
                        onChanged: (values) {
                          setState(() {
                            proximityStartValue = values.start;
                            proximityEndValue = values.end;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text('Characteristics',
                  style: Theme.of(context).textTheme.titleSmall),
              SizedBox(height: 4.h),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: AppColors.borderColor, width: .2),
                ),
                child: Column(
                  children: [
                    // Gender Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Gender',
                            style: Theme.of(context).textTheme.bodyMedium),
                        IconButton(
                          focusColor: Colors.blueGrey,
                          splashRadius: 1,
                          hoverColor: AppColors.backgroundColor,
                          // isSelected: isFemale,
                          onPressed: () {
                            isMale = !isMale;
                            setState(() {});
                          },
                          icon: isMale
                              ? const Icon(Icons.female)
                              : const Icon(Icons.male),
                        ),
                      ],
                    ),
                    //Temperament Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Temperament'),
                        Checkbox(
                          value: isTemperament,
                          onChanged: (bool? value) {
                            setState(() {
                              isTemperament = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
