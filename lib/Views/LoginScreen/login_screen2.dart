import 'package:empleado_development/Controller/Cubits/loginCubits/login_radiobutton_cubit.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:empleado_development/Views/DashboardsScreen/DashBoardScreen.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/LoginWidgets/login_button_widget.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/LoginWidgets/radio_button.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/PageTransitions/slide_page_transition.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

class LoginScreen2 extends StatelessWidget {
  const LoginScreen2({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return  Scaffold(
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
                  return Column(
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
                                        color: AppColors.blueContainerColor,

                                        onPressed: (){

                                          // Navigator.pushReplacement(context, CustomSlidePageRoute( direction: AxisDirection.left, child: const DashBoardScreen()));

                                        },
                                        child:   LoginButton(textToDisplay: "GetOtp", height: 40.h, width: 100.w,),
                                      ),
                                    ),


                                    // Padding(
                                    //   padding:  EdgeInsets.symmetric(horizontal:90.sp),
                                    //   child: FittedBox(child:  Text("Ask your HR/Empleado Admin for your Empleado ID",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),)),
                                    // ),
SizedBox(height: 6.h,),
                                    UnconstrainedBox(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                                        height: 38.h,
                                        width: 290.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.sp),
                                            border: Border.all(color: Colors.white),
                                            color: Colors.white
                                        ),

                                        child:   const LoginScreen2TextField(),
                                      ),
                                    ),
                                    SizedBox(height: 11.sp,),
                                    //Next Button
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

                                            Navigator.pushReplacement(context, CustomSlidePageRoute( direction: AxisDirection.left, child: const DashBoardScreen()));

                                          },
                                          child:   LoginButton(textToDisplay: "Login",width: 258.w,height: 38.h,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),


                                  ],

                                ),
                      ),
                      veevoCopyRightWidget()
                    ],
                  );
                },
),
            )

    );


  }
}

class LoginScreen2TextField extends StatefulWidget {
  const LoginScreen2TextField({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen2TextField> createState() => _LoginScreen2TextFieldState();
}

class _LoginScreen2TextFieldState extends State<LoginScreen2TextField> {
  bool passwordToShow=true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      obscureText: passwordToShow,
      controller: AppControllers.loginPinCodeController,
      // selectionWidthStyle: BoxWidthStyle.max,
      decoration: InputDecoration(
        hintText: "Pin Code/Password",
        hintStyle: GoogleFonts.poppins(color: AppColors.greyColor2,fontSize: 12.sp),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 17.sp),
        prefixIcon: SvgPicture.asset(AppIcons.loginPinCodeIcon,height: 18.sp,width: 15.sp,),
        prefixIconConstraints: const BoxConstraints(minWidth: 30, minHeight: 18),
    suffixIcon:  MaterialButton(
        minWidth: 8.sp,
        onPressed: () {
          if(passwordToShow==true) {
            passwordToShow=false;
          }
          else{
            passwordToShow=true;

          }
setState(() {

});

        },
    child:   Icon(Icons.remove_red_eye_rounded,color: AppColors.blueContainerColor,))

      ),
    );
  }
}
