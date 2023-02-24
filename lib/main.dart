import 'package:device_preview/device_preview.dart';
import 'package:empleado_development/Views/LoginScreen/login_screen1.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Controller/Cubits/Theme/theme_cubit.dart';
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
    return MultiBlocProvider(
      providers: mainCubitProvidersList,
      child:
           ScreenUtilInit(
            //scaleByHeight: true,
            designSize: const Size(414, 719),
            minTextAdapt: true,
            //  splitScreenMode: true,
            useInheritedMediaQuery: true,
            builder: (BuildContext context, child) {
              return MaterialApp(

                //useInheritedMediaQuery: true,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(useMaterial3: true),
                //theme: ThemeData(useMaterial3: true),
                // home: const LoginScreen(),
                home: const LoginScreen1(),
              );
            },
          )

    );
  }
}

