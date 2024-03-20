import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/drop_down_custom.dart';

class AdvancedFilter extends StatefulWidget {
  const AdvancedFilter({Key? key}) : super(key: key);

  @override
  State<AdvancedFilter> createState() => _AdvancedFilterState();
}

class _AdvancedFilterState extends State<AdvancedFilter> {
  bool isTrained = false;
  bool isAllergenic = false;
  double ageStartValue = 0;
  double ageEndValue = 20;
  double weightStartValue = 0;
  double weightEndValue = 100;
  String color = 'Black';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // SizedBox(height: 16.h),
          // Text('What is you availability',
          //     style: Theme.of(context).textTheme.titleSmall),
          SizedBox(height: 16.h),
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
                    const Text('Trained'),
                    Checkbox(
                      value: isTrained,
                      onChanged: (bool? value) {
                        setState(() {
                          isTrained = value!;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Allergenic'),
                    Checkbox(
                      value: isAllergenic,
                      onChanged: (bool? value) {
                        setState(() {
                          isAllergenic = value!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          ColumnWithTextField(
            text: 'Select a color',
            requiredInput: false,
            dropDown: CustomDropdownButton2(
              hint: '',
              value: color,
              dropdownItems: const ['Black', 'Gold', 'White', 'Brown'],
              onChanged: (String? value) {
                color = value!;
                setState(() {});
              },
            ),
          ),
          SizedBox(height: 16.h),
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
                    Text('Weight',
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
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
