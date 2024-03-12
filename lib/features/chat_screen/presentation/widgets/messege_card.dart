import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pile_up/core/resource_manager/colors.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.message});

  final MessengerText message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: message.isSent
          ? Align(
              alignment: Alignment.centerRight,
              child: Container(
                  padding: const EdgeInsets.all(8),
                  // width: context.width * .95,
                  // height: AppSize.defaultSize! * 10.4,
                  decoration: BoxDecoration(
                    color: AppColors.categoryContainer,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        bottomLeft: Radius.circular(12.r)),
                  ),
                  child: Text(
                    message.text,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
            )
          : Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  padding: const EdgeInsets.all(8),
                  // width: context.width * .95,
                  // height: AppSize.defaultSize! * 10.4,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.r),
                      bottomRight: Radius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    message.text,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
            ),
    );
  }
}

class MessengerText {
  final String text;
  final bool isSent;

  MessengerText({
    required this.text,
    required this.isSent,
  });
}
