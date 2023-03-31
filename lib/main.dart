import 'dart:io';
import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:easy_downloader/easy_downloader.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:empleado_development/Model/LoginModel/login_controller.dart';
import 'package:empleado_development/Views/DashboardsScreen/DashBoardScreen.dart';
import 'package:empleado_development/Views/LoginScreen/login_screen1.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Controller/Cubits/Attendance/attendance_data_cubit.dart';
import 'Controller/Cubits/DashboardCubits/dashboard_data_cubit.dart';
import 'Controller/Cubits/Theme/theme_cubit.dart';
import 'Controller/Cubits/redirect_status_cubit.dart';
import 'Controller/UtilsData/app_preferences.dart';
import 'Views/SplashScreen/splash_screen.dart';
import 'Views/Utils/Data/app_provider.dart';
import 'package:device_info_plus/device_info_plus.dart';


void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}
class TestClass {
  static void callback(String id, DownloadTaskStatus status, int progress) {
    // if( status==DownloadTaskStatus.complete){
    //   FlutterDownloader.open(taskId: id);
    // }


  }
}
// Future<void> openFile(String filePath) async {
//   await Future.delayed(const Duration(seconds: 1));
//   await OpenFile.open(filePath);
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //

  await FlutterDownloader.initialize(
      debug: false,
      ignoreSsl: false // optional: set false to disable printing logs to console
  );
  await FlutterDownloader.registerCallback(TestClass.callback);
  await EasyDownloader.init(startQueue: true, maxConcurrentTasks: 4);
  await SharedPrefs.init();
  _enablePlatformOverrideForDesktop();

  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(), // Wrap your app
  ),);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  // This widget is the root of your application.
  @override
  void initState() {
    initPlatformState();
    // TODO: implement initState
    super.initState();
  }
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
               home: const SplashScreen(),
              // BlocBuilder<RedirectStatusCubit, RedirectStatusState>(
              //   builder: (context, state) {
              //     if(state is RedirectStatusLoaded)
              //       {
              //         if(loginRedirectCheck=="ok") {
              //           context.read<DashboardDataCubit>().loadDashboardData(SharedPrefs.generalGetEmpId(), DateTime.now().month.toString(), DateTime.now().year.toString());
              //           context.read<AttendanceDataCubit>().loadAttendanceData(SharedPrefs.generalGetEmpId(), DateTime.now().month.toString(), DateTime.now().year.toString());
              //           return DashBoardScreen();
              //         }
              //         else{
              //
              //           return LoginScreen1();
              //         }
              //
              //       }
              //     else
              //       {
              //         return LoginScreen1();
              //
              //       }
              //   },
              // ),
            );
          },
        )

    );
  }

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};

    try {

        if (Platform.isAndroid) {
          deviceData =
              _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        } else if (Platform.isIOS) {
          deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        }

    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;
    Repository.deviceDetailData.addAll(deviceData);
    setState(() {


    });
print(deviceData);

  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
      'displaySizeInches':
      ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
      'displayWidthPixels': build.displayMetrics.widthPx,
      'displayWidthInches': build.displayMetrics.widthInches,
      'displayHeightPixels': build.displayMetrics.heightPx,
      'displayHeightInches': build.displayMetrics.heightInches,
      'displayXDpi': build.displayMetrics.xDpi,
      'displayYDpi': build.displayMetrics.yDpi,
      'serialNumber': build.serialNumber,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}


