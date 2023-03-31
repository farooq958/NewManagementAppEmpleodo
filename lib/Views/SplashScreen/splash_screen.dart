import 'package:empleado_development/Controller/Cubits/Attendance/attendance_data_cubit.dart';
import 'package:empleado_development/Controller/Cubits/DashboardCubits/dashboard_data_cubit.dart';
import 'package:empleado_development/Controller/Cubits/redirect_status_cubit.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:empleado_development/Controller/UtilsData/app_preferences.dart';
import 'package:empleado_development/Model/LoginModel/login_controller.dart';
import 'package:empleado_development/Views/DashboardsScreen/DashBoardScreen.dart';
import 'package:empleado_development/Views/LoginScreen/login_screen1.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/PageTransitions/slide_page_transition.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<RedirectStatusCubit>().redirectUser();
    print(Repository.deviceDetailData);
    return Scaffold(
      body: BlocListener<RedirectStatusCubit, RedirectStatusState>(
        listener: (context, state) {
          // TODO: implement listener
          if(state is RedirectStatusLoaded)
                {
                  if(loginRedirectCheck=="ok") {

                    context.read<DashboardDataCubit>().loadDashboardData(SharedPrefs.generalGetEmpId(), DateTime.now().month.toString(), DateTime.now().year.toString());
                    context.read<AttendanceDataCubit>().loadAttendanceData(SharedPrefs.generalGetEmpId(), DateTime.now().month.toString(), DateTime.now().year.toString());
                    Future.delayed(const Duration(seconds: 3));
                    Navigator.pushReplacement(context, CustomSlidePageRoute(child:DashBoardScreen())) ;
                  }
                  else{
                    //print("here");
                    Future.delayed(const Duration(seconds: 3));
                    Navigator.pushReplacement(context, CustomSlidePageRoute(child:LoginScreen1())) ;
                    sendDeviceDataToMainServer();
                  }
        }},
        child: Container(
          height: 1.sh,
          width: 1.sw,
          decoration: const BoxDecoration(

              image: DecorationImage(fit: BoxFit.cover,
                  image: AssetImage(AppImages.dashboardBackgroundImage))

          ),
          child: Stack(
            children: [
              Center(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    SizedBox(height: 100.sp,
                      child: Image.asset("assets/images/splashImage.png"),),
                    SizedBox(height: 5.sp,),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'E',
                              style: GoogleFonts.poppins(
                                  color: AppColors.blueContainerColor,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: 'MPLEADO',
                              style: GoogleFonts.poppins(
                                  color: AppColors.greyColor,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    )


                  ],
                ),
              ),

              Positioned(
                  bottom: 0,
                  child: veevoCopyRightWidget())
            ],
          ),

        ),
      ),
    );
  }

  sendDeviceDataToMainServer() async {

    await Repository().sendDeviceDetails();
  }
}
