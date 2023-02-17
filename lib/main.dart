import 'package:device_preview/device_preview.dart';
import 'package:empleado_development/Views/LoginScreen/login_screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Views/Utils/Data/app_provider.dart';

void main() {
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => const MyApp(), // Wrap your app
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //scaleByHeight: true,
      designSize: const Size(414, 719),
      minTextAdapt: true,
    //  splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers:mainCubitProvidersList,
          child: MaterialApp(
            //useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true),
            // home: const LoginScreen(),
            home: const LoginScreen1(),
          ),
        );
      },
    );
  }
}

