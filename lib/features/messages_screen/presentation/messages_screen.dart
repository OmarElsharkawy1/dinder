import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/drawer.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: homeAppBar(
        context,
        actionIcon: Icons.search,
        leadingKey: _scaffoldKey,
      ),
      drawer: const HomeDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Chats',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      MessageCard(
                        messengers: Messenger(
                          messengerName: 'Aya',
                          messengerText: 'When can I see you dog in public?',
                          messengerImage: AssetPath.logo,
                        ),
                      ),
                      if (i != 15)
                        const Divider(
                          color: AppColors.primaryColor,
                          // height: .05,
                          thickness: .1,
                          // indent: 16.w,
                          // endIndent: 16.w,
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.messengers});

  final Messenger messengers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        // width: context.width * .95,
        // height: AppSize.defaultSize! * 10.4,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundImage: AssetImage(messengers.messengerImage),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: messengers.messengerName,
                          color: AppColors.blackLow,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                      CustomText(
                          text: messengers.messengerText,
                          color: AppColors.blackLow,
                          maxLines: 4,
                          textAlign: TextAlign.start,
                          fontSize: 14.sp),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Messenger {
  final String messengerName;
  final String messengerText;
  final String messengerImage;

  Messenger(
      {required this.messengerName,
      required this.messengerText,
      required this.messengerImage});
}
