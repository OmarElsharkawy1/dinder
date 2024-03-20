import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/service/service_locator.dart';
import 'package:pile_up/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:pile_up/features/auth/presentation/controller/sign_in_with_platform_bloc/sign_in_with_platform_bloc.dart';
import 'package:pile_up/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_bloc.dart';
import 'package:pile_up/features/matching_screen/presentation/controller/get_dogs_bloc.dart';
import 'package:pile_up/features/my_profile_screen/presentation/controller/get_my_profile_bloc.dart';

import 'core/resource_manager/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServerLocator().init();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.of(context).size.width >= 700
          ? const Size(1440, 768)
          : const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<SignUpWithEmailAndPasswordBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<LoginWithEmailAndPasswordBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<SignInWithPlatformBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<GetDogsBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<GetMyProfileBloc>(),
            ),
          ],
          child: MaterialApp(
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.login,
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
          ),
        );
      },
    );
  }
}
