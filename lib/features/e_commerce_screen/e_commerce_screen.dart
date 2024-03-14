import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/drawer.dart';

class ECommerceScreen extends StatefulWidget {
  const ECommerceScreen({Key? key}) : super(key: key);

  @override
  State<ECommerceScreen> createState() => _ECommerceScreenState();
}

class _ECommerceScreenState extends State<ECommerceScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: homeAppBar(
      //   context,
      //   actionIcon: Icons.settings,
      //   centerWidget: const Text(
      //     StringManager.appName,
      //     style: TextStyle(color: AppColors.primaryColor),
      //   ),
      //   leadingKey: _scaffoldKey,
      // ),
      // drawer: const HomeDrawer(),
      body: Center(
        child: Text(
          'Coming Soon',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
