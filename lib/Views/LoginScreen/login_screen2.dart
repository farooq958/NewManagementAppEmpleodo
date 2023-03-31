import 'dart:async';
import 'dart:convert';

import 'package:empleado_development/Controller/Cubits/Attendance/attendance_data_cubit.dart';
import 'package:empleado_development/Controller/Cubits/DashboardCubits/dashboard_data_cubit.dart';
import 'package:empleado_development/Controller/Cubits/loginCubits/login_radiobutton_cubit.dart';
import 'package:empleado_development/Controller/Cubits/loginCubits/login_user_cubit.dart';
import 'package:empleado_development/Controller/Cubits/loginCubits/login_user_final_data_cubit.dart';
import 'package:empleado_development/Controller/Cubits/loginCubits/send_otp_cubit.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:empleado_development/Controller/UtilsData/app_constants.dart';
import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:empleado_development/Controller/UtilsData/app_preferences.dart';
import 'package:empleado_development/Model/LoginModel/login_controller.dart';
import 'package:empleado_development/Views/DashboardsScreen/DashBoardScreen.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/LoginWidgets/login_button_widget.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/LoginWidgets/radio_button.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:empleado_development/Views/Utils/PageTransitions/slide_page_transition.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

import 'instance_screen.dart';
import 'login_screen1.dart';

class LoginScreen2 extends StatefulWidget {
   LoginScreen2({Key? key}) : super(key: key);

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  String? _errorMessage= "";

  void _setErrorMessage(String? message) {

    setState(() {
      _errorMessage = message;
    });


  }
  @override
  void dispose() {
   // AppControllers.loginPinCodeController.dispose();
   // AppControllers.loginEmpleadoEmailNumberController.dispose();
   // AltSmsAutofill().unregisterListener();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return  WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> LoginScreen1()));
        return false;
      },
      child:
    
     BlocConsumer<LoginUserCubit, LoginUserState>(
  listener: (context, loginState) {
    if(loginState is LoginUserLoaded)
      {
if(loginUserStatusController=="SUCCESSFUL")
  {
context.read<LoginUserFinalDataCubit>().getFinalLoginUserData(loginUserURLStatusController);
loginUserStatusController=" ";
  }
if(loginUserVerifyStatusController=="FAILED")
{
AppUtils.showCustomSnackBar(context: context, message: "Please Provide Correct Credentials", color: AppColors.redColor);
loginUserVerifyStatusController=" ";
}
if(loginUserStatusController=="MULTIPLE-CHOICE")
{
  grantType="access_token";
Navigator.pushReplacement(context, CustomSlidePageRoute(child: const InstanceLoginScreen()));

}
      }
    // TODO: implement listener
  },
  builder: (context, stateLoginBuilder) {
  return  BlocConsumer<LoginUserFinalDataCubit, LoginUserFinalDataState>(
      listener: (context, state) {
        if(state is LoginUserFinalDataLoaded)
        {

          print(finalLoginDataController.userData.empOrgId);
          print(finalLoginDataController.userData.oneid);
          print(finalLoginDataController.userData.jwt);
          SharedPrefs.generalSetEmpId(empId:finalLoginDataController.userData.empUserId );
          SharedPrefs.generalSetOrgId(empId:finalLoginDataController.userData.empOrgId );
          SharedPrefs.generalSetBranchId(empId:finalLoginDataController.userData.empBranchId );
          SharedPrefs.generalSetSessionId(empId:finalLoginDataController.userData.empSessionId );
          SharedPrefs.generalSetJwt(empId:finalLoginDataController.userData.jwt );
          SharedPrefs.generalSetDepartmentId(empId:finalLoginDataController.userData.empDepartmentId );
          SharedPrefs.generalSetOneId(empId:finalLoginDataController.userData.oneid );
          //print(SharedPrefs.generalGetEmpId());
          context.read<DashboardDataCubit>().loadDashboardData(SharedPrefs.generalGetEmpId(), DateTime.now().month.toString(), DateTime.now().year.toString());
          context.read<AttendanceDataCubit>().loadAttendanceData(SharedPrefs.generalGetEmpId(), DateTime.now().month.toString(), DateTime.now().year.toString());

          Navigator.pushReplacement(context, CustomSlidePageRoute(child: DashBoardScreen()));
          ///save data to preferences and navigate to dashboard.//first scenario direct passsword or otp
        }
        // TODO: implement listener
      },
      builder: (context, finalLoginState) {
    return BlocConsumer<SendOtpCubit, SendOtpState>(
  listener: (context, otpListener) {
    if(otpListener is SendOtpLoading){

      AppUtils.showCustomSnackBar(context: context, message: "Sending OTP..", color: AppColors.blueContainerColor);
    }

    if(otpListener is SendOtpLoaded){
if(loginOTPStatusController=="OTP_SENT")
  {
    AppUtils.showCustomSnackBar(context: context, message: "OTP Sent Successfully", color: AppColors.greenColor);

  }
if(loginOTPStatusController=="FAILED")
{
  AppUtils.showCustomSnackBar(context: context, message: "Failed To Send OTP Please Try again later", color: AppColors.greenColor);

}


    }

    // TODO: implement listener
  },
  builder: (context, otpBuilder) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body:
               Container(
                height: 1.sh,
                width: 1.sw,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppImages.dashboardBackgroundImage),fit: BoxFit.cover )

                ),
                child: BlocBuilder<LoginRadiobuttonCubit, int?>(
                  builder: (context, radioValue) {
                   // print(radioValue);
                    return Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: ListView(
                                shrinkWrap: true,

                                physics:const ClampingScrollPhysics(),
                                        children: [
                                          SizedBox(height: 100.h,),
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 59.sp),
                                            width: 296.w,height: 256.h, decoration: const BoxDecoration(
                                              image: DecorationImage(image: AssetImage(AppImages.loginImage) )

                                          ), ),
                                          SizedBox(height: 21.h,),
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
                                          SizedBox(height: 5.h,),
                                 UnconstrainedBox(child: MyRadioGroup(radioState:radioValue, context: context,)),
                                          //Empleado id Text Box
                                          // UnconstrainedBox(
                                          //   child: Container(
                                          //     padding: EdgeInsets.symmetric(horizontal: 5.sp),
                                          //     height: 38.h,
                                          //     width: 258.w,
                                          //     decoration: BoxDecoration(
                                          //         borderRadius: BorderRadius.circular(10.sp),
                                          //         border: Border.all(color: Colors.white),
                                          //         color: Colors.white
                                          //     ),
                                          //
                                          //     child:   TextField(
                                          //       controller: AppControllers.loginEmpleadoIdController,
                                          //       // selectionWidthStyle: BoxWidthStyle.max,
                                          //       decoration: InputDecoration(
                                          //         hintText: "Empleado ID",
                                          //         hintStyle: GoogleFonts.poppins(color: AppColors.greyColor2),
                                          //         border: InputBorder.none,
                                          //         contentPadding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 10.sp),
                                          //         prefixIcon: SvgPicture.asset(AppIcons.loginUserNameIcon,height: 18.sp,width: 15.sp,),
                                          //         prefixIconConstraints: const BoxConstraints(minWidth: 30, minHeight: 18),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          radioValue==0?SizedBox(height: 25.sp,):
                                          //GetOtp Button
                                          UnconstrainedBox(
                                            child: MaterialButton(
                                              color: AppColors.buttonColor,

                                              onPressed: (){
                                                var loginUsername="";
                                               // loginUsername=jsonEncode(AppControllers.loginEmpleadoEmailNumberController.text);
                                                if(AppControllers.loginEmpleadoEmailNumberController.text.startsWith("+")){
                                                  //AppControllers.loginEmpleadoEmailNumberController.text=AppControllers.loginEmpleadoEmailNumberController.text.replaceRange(0, 1, "+92");

                                                  AppControllers.loginEmpleadoEmailNumberController.text=Uri.encodeComponent(AppControllers.loginEmpleadoEmailNumberController.text);

                                                }
                                               // AppControllers.loginEmpleadoEmailNumberController.text=


                                                print(AppControllers.loginEmpleadoEmailNumberController.text);
                                                context.read<SendOtpCubit>().getOTP(AppControllers.loginEmpleadoEmailNumberController.text);

                                                // Navigator.pushReplacement(context, CustomSlidePageRoute( direction: AxisDirection.left, child: const DashBoardScreen()));

                                              },
                                              child:   LoginButton(textToDisplay: "GetOTP", height: 40.h, width: 100.w,),
                                            ),
                                          ),


                                          // Padding(
                                          //   padding:  EdgeInsets.symmetric(horizontal:90.sp),
                                          //   child: FittedBox(child:  Text("Ask your HR/Empleado Admin for your Empleado ID",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),)),
                                          // ),
SizedBox(height: 6.h,),
                                            radioValue==0? UnconstrainedBox(
                                              child: Container(
                                                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                                                height: 38.h,
                                                width: 290.w,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10.sp),
                                                    border: Border.all(color: Colors.white),
                                                    color: Colors.white
                                                ),

                                                child:    LoginScreen2TextField(errorMessage: _errorMessage,),
                                              ),
                                            ) : SizedBox(height: 11.sp,),
                                            (radioValue==1 && loginOTPStatusController=="OTP_SENT")?
                                          UnconstrainedBox(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                                              height: 100.h,
                                              width: 290.w,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10.sp),
                                                  border: Border.all(color: Colors.white),
                                                  color: Colors.white
                                              ),

                                              child:    PinCodeTextField(
                                                autoDisposeControllers: false,
                                                appContext: context,
                                                pastedTextStyle: GoogleFonts.poppins(
                                                  color: Colors.green.shade600,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                length: AppControllers.loginEmpleadoEmailNumberController.text.startsWith("%")?4:5,
                                                obscureText: false,
                                                animationType: AnimationType.fade,
                                                pinTheme: PinTheme(
                                                    shape: PinCodeFieldShape.box,
                                                    borderRadius: BorderRadius.circular(10),
                                                    fieldHeight: 50.sp,
                                                    fieldWidth: 40.sp,
                                                    inactiveFillColor: Colors.white,
                                                    inactiveColor: AppColors.greyColor,
                                                    selectedColor: AppColors.greyColor,
                                                    selectedFillColor: Colors.white,
                                                    activeFillColor: Colors.white,
                                                    activeColor: AppColors.greyColor
                                                ),
                                                cursorColor: Colors.black,
                                                animationDuration: const Duration(milliseconds: 300),
                                                enableActiveFill: true,
                                                controller: AppControllers.loginPinCodeController,
                                                keyboardType: TextInputType.number,
                                                boxShadows: const [
                                                  BoxShadow(
                                                    offset: Offset(0, 1),
                                                    color: Colors.black12,
                                                    blurRadius: 10,
                                                  )
                                                ],
                                                onCompleted: (v) {
                                                  //do something or move to next screen when code complete
                                                },
                                                onChanged: (value) {

                                                },
                                              ),
                                            ),
                                          ):
                                          SizedBox(height: 11.sp,),
                                          //Next Button
                                     radioValue==0 ||    (radioValue==1 && loginOTPStatusController=="OTP_SENT")?
                                          Center(
                                            child: Container(
                                              height: 49.sp,
                                              width: 1.sw/1.6,
                                              decoration: BoxDecoration(

                                                borderRadius:
                                                BorderRadius.circular(2.sp),
                                                color: AppColors.blueContainerColor,
                                              ),
                                              child: MaterialButton(

                                                color: AppColors.buttonColor,

                                                onPressed: (){
                                                  if (AppControllers.loginPinCodeController.text.isEmpty){
                                                    _setErrorMessage("Please Enter Password/PinCode");

                                                    Timer(const Duration(milliseconds: 1500), () async {
                                                      setState(() {
                                                        _errorMessage = "";
                                                      });
                                                    });
                                                  }
                                                  else{
                                                    // var loginUsername=radioValue==0?AppControllers.loginEmpleadoEmailNumberController.text:"";
                                                    // if(AppControllers.loginEmpleadoEmailNumberController.text.startsWith("0") && radioValue==1){
                                                    //   AppControllers.loginEmpleadoEmailNumberController.text=AppControllers.loginEmpleadoEmailNumberController.text.replaceRange(0, 0, "+92");
                                                    //   loginUsername=Uri.encodeComponent(AppControllers.loginEmpleadoEmailNumberController.text);
                                                    //
                                                    // }
                                                    // else if(radioValue==1)
                                                    //   {
                                                    //     loginUsername=Uri.encodeComponent(AppControllers.loginEmpleadoEmailNumberController.text);
                                                    //   }
                                                    print(AppControllers.loginEmpleadoEmailNumberController.text);
                                                    context.read<LoginUserCubit>().getLoginUser(AppControllers.loginEmpleadoEmailNumberController.text, AppControllers.loginPinCodeController.text);


                                                  }

                                              //  context.read<DashboardDataCubit>().loadDashboardData("9108371",DateTime.now().month.toString(),DateTime.now().year.toString());
                                                //context.read<AttendanceDataCubit>().loadAttendanceData("9108371",DateTime.now().month.toString(),DateTime.now().year.toString());
                                             // context.read<DashboardDataCubit>().loadDashboardData("3976",DateTime.now().month.toString(),DateTime.now().year.toString());
                                              //context.read<AttendanceDataCubit>().loadAttendanceData("3976",DateTime.now().month.toString(),DateTime.now().year.toString());
                                           //  context.read<DashboardDataCubit>().loadDashboardData("9112847",DateTime.now().month.toString(),DateTime.now().year.toString());
                                             // context.read<AttendanceDataCubit>().loadAttendanceData("9112847",DateTime.now().month.toString(),DateTime.now().year.toString());
                                               //   Navigator.push(context, CustomSlidePageRoute( direction: AxisDirection.left, child:  const InstanceLoginScreen()));

                                                },
                                                child:   LoginButton(textToDisplay: "Login",width: 258.w,height: 38.h,),
                                              ),
                                            ),
                                          ):
                                          SizedBox(height: 10.h,),


                                        ],

                                      ),
                            ),
                            veevoCopyRightWidget()
                          ],
                        ),
                        finalLoginState is LoginUserFinalDataLoading || stateLoginBuilder is LoginUserLoading ?Container(
                          color: Colors.black54,
                          child: Center(
                            child: SpinKitWave(color: AppColors.blueContainerColor,size: 25.sp,),
                          ),
                        ):SizedBox(height: 0.sp,)
                      ],
                    );
                  },
),
              )

      );
  },
);
  },
);
  },
)
  
    );


  }
}

class  LoginScreen2TextField extends StatefulWidget {
String? errorMessage;
   LoginScreen2TextField({Key? key,required this.errorMessage}) : super(key: key);

  @override
  State<LoginScreen2TextField> createState() => _LoginScreen2TextFieldState();
}

class _LoginScreen2TextFieldState extends State<LoginScreen2TextField> {
  bool passwordToShow = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,

      obscureText: passwordToShow,
      controller: AppControllers.loginPinCodeController,
      // selectionWidthStyle: BoxWidthStyle.max,
      decoration: InputDecoration(
          errorText: widget.errorMessage!.isNotEmpty ?widget.errorMessage : null,
          hintText: "Pin Code/Password",
          hintStyle: GoogleFonts.poppins(
              color: AppColors.greyColor2, fontSize: 12.sp),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
              horizontal: 10.sp, vertical: 17.sp),
          prefixIcon: SvgPicture.asset(
            AppIcons.loginPinCodeIcon, height: 18.sp, width: 15.sp,),
          prefixIconConstraints: const BoxConstraints(
              minWidth: 30, minHeight: 18),
          suffixIcon: MaterialButton(
              minWidth: 8.sp,
              onPressed: () {
                if (passwordToShow == true) {
                  passwordToShow = false;
                }
                else {
                  passwordToShow = true;
                }
                setState(() {

                });
              },
              child: Icon(Icons.remove_red_eye_rounded,
                color: AppColors.blueContainerColor,))

      ),
    );
  }
}