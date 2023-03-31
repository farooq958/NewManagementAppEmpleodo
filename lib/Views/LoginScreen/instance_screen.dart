import 'dart:ui';

import 'package:empleado_development/Controller/Cubits/Attendance/attendance_data_cubit.dart';
import 'package:empleado_development/Controller/Cubits/DashboardCubits/dashboard_data_cubit.dart';
import 'package:empleado_development/Controller/Cubits/loginCubits/instance_cubit.dart';
import 'package:empleado_development/Controller/Cubits/loginCubits/login_user_cubit.dart';
import 'package:empleado_development/Controller/Cubits/loginCubits/login_user_final_data_cubit.dart';
import 'package:empleado_development/Controller/UtilsData/app_constants.dart';
import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:empleado_development/Controller/UtilsData/app_preferences.dart';
import 'package:empleado_development/Model/LoginModel/list_of_instance.dart';
import 'package:empleado_development/Model/LoginModel/login_controller.dart';
import 'package:empleado_development/Views/DashboardsScreen/DashBoardScreen.dart';
import 'package:empleado_development/Views/LoginScreen/login_screen2.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/LoginWidgets/login_button_widget.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:empleado_development/Views/Utils/PageTransitions/slide_page_transition.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InstanceLoginScreen extends StatelessWidget {
  const InstanceLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<LoginUserCubit, LoginUserState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    if(state is LoginUserLoaded) {
      return BlocConsumer<InstanceCubit, InstanceState>(
  listener: (context, instanceListener) {
    // TODO: implement listener
    if(instanceListener is InstanceLoaded)
      {
        context.read<LoginUserFinalDataCubit>().getFinalLoginUserData(loginUserURLStatusController);
        loginUserStatusController=" ";
        loginUserURLStatusController=" ";
      }
    if(instanceListener is InstanceUnknownError)
      {
        AppUtils.showCustomSnackBar(context: context, message: "Redirect limit exceeded", color: AppColors.redColor);
      }
  },
  builder: (context, instanceBuilder) {
    return BlocConsumer<LoginUserFinalDataCubit, LoginUserFinalDataState>(
  listener: (context, state) {
    // TODO: implement listener
    if(state is LoginUserFinalDataLoaded)
    {

     // print(finalLoginDataController.userData.empUserName);
      SharedPrefs.generalSetEmpId(empId:finalLoginDataController.userData.empUserId );
      SharedPrefs.generalSetOrgId(empId:finalLoginDataController.userData.empOrgId );
      SharedPrefs.generalSetBranchId(empId:finalLoginDataController.userData.empBranchId );
      SharedPrefs.generalSetSessionId(empId:finalLoginDataController.userData.empSessionId );
      SharedPrefs.generalSetJwt(empId:finalLoginDataController.userData.jwt );
      SharedPrefs.generalSetDepartmentId(empId:finalLoginDataController.userData.empDepartmentId );
      //print(SharedPrefs.generalGetEmpId());
      context.read<DashboardDataCubit>().loadDashboardData(SharedPrefs.generalGetEmpId(), DateTime.now().month.toString(), DateTime.now().year.toString());
      context.read<AttendanceDataCubit>().loadAttendanceData(SharedPrefs.generalGetEmpId(), DateTime.now().month.toString(), DateTime.now().year.toString());

      Navigator.pushReplacement(context, CustomSlidePageRoute(child: DashBoardScreen()));
      ///save data to preferences and navigate to dashboard.//2nd scenario login with instance
    }
  },
  builder: (context, state) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.dashboardBackgroundImage),fit: BoxFit.cover )

        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView(
                    primary: true,
                    shrinkWrap: true,
                    // reverse: true,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      SizedBox(height: 63.h,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 59.sp),
                        width: 296.w,height: 256.h, decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage(AppImages.loginImage) )

                      ), ),
                      SizedBox(height: 61.h,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 145.sp),

                        child: FittedBox(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'E',
                                  style: GoogleFonts.poppins(
                                      color: AppColors.buttonColor,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                                TextSpan(
                                  text: 'MPLEADO',
                                  style: GoogleFonts.poppins(
                                      color: AppColors.greyColor,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      //Empleado id Text Box
                      SizedBox(
                          height: 50.sp,
                          width: 1.sw/1.2,
                          child: const CustomDropDownInstance())


                    ],

                  ),
                ),
                veevoCopyRightWidget()
              ],
            ),
            state is LoginUserFinalDataLoading?Container(
              color: Colors.black54,
              child: Center(
                child: SpinKitWave(color: AppColors.blueContainerColor,size: 25.sp,),
              ),
            ):SizedBox(height: 0.sp,)

          ],
        ),
        // Positioned(
        //
        //     bottom: 0.sp,
        //     child: veevoCopyRightWidget())


      ),

    );
  },
);
  },
);
    }
    else
      {
        return  Center(child:SpinKitWave(color: AppColors.blueContainerColor,size: 25.sp,));
      }
  },
);
  }
}

class CustomDropDownInstance extends StatefulWidget {
  const CustomDropDownInstance({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDropDownInstance> createState() => _CustomDropDownInstanceState();
}
final listOfStrings=getListOfOragnization();
class _CustomDropDownInstanceState extends State<CustomDropDownInstance> {

  var dropdownValue=listOfStrings[0];
  @override
  Widget build(BuildContext context) {
    print(listOfStrings);
  //  print(listOfInstances[0]["org_name"]);
    //print(dropdownValue);
    return DropdownButton<String>(
      isExpanded: true,
      underline: const SizedBox(),
      // hint:  Text("Choose Plan ",style: GoogleFonts.poppins(color: AppColors.greyColor2),),
      // Step 3.
      value: dropdownValue,
      // Step 4.
      items: listOfStrings
          .map<DropdownMenuItem<String>>((String value) {

           // print(value);
        return DropdownMenuItem<String>(
          value:value,
          child: Text(
            value,
            style:  GoogleFonts.poppins(fontSize: 15.sp,color: AppColors.greyColor),
          ),
        );

      }).toList(),

      onChanged: (newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      if(dropdownValue != "Choose Organization Instance") {
        var ch= getInstanceThroughName(dropdownValue);

        print(ch);
        if(ch["token"] != null && ch["role_id"]!=null ) {
          print("here");
          context.read<InstanceCubit>().getInstance("$appId-${ch["token"]}-${ch["role_id"]}");
        }
      }
       //print(ch);

      ///here call the cubit

      },
    );
  }



}