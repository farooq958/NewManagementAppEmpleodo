import 'dart:async';
import 'dart:ui';

import 'package:empleado_development/Controller/Cubits/loginCubits/find_user_cubit.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:empleado_development/Model/LoginModel/login_controller.dart';
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

class LoginScreen1 extends StatefulWidget {
   LoginScreen1({Key? key}) : super(key: key);

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {

  //final _formKey = GlobalKey<FormState>();
 String? _errorMessage= "";

  void _setErrorMessage(String? message) {

      setState(() {
        _errorMessage = message;
      });


    }
  @override
  Widget build(BuildContext context) {
    print("errormessage $_errorMessage");
   

 return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<FindUserCubit, FindUserState>(
        listener: (context, state) {
          if(state is FindUserLoaded)
          {
            print(findUserStatusController);
            if(findUserStatusController=="NOT_FOUND")
            {
              AppUtils.showCustomSnackBar(context: context, message: "User Not Found ", color: AppColors.redColor);

            }
            if(findUserStatusController == "FOUND"){
              print("here");
              AppUtils.showCustomSnackBar(context: context, message: "Success", color: AppColors.greenColor);
              loginOTPStatusController=" ";
              Navigator.pushReplacement(context, CustomSlidePageRoute( direction: AxisDirection.left, child:  LoginScreen2()));
              // findUserStatusController = "";

            }

          }
          // TODO: implement listener
        },
  builder: (context, stateBuilder) {

    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: Stack(
        children: [
          Container(
              height: 1.sh,
              width: 1.sw,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImages.dashboardBackgroundImage),fit: BoxFit.cover )

              ),
              child: Column(
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
  UnconstrainedBox(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.sp),
              height: 38.h,
              width: 258.w,
              decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(color: Colors.white),
                          color: Colors.white
              ),
              child: TextFormField(
style: GoogleFonts.poppins(color: AppColors.greyColor),
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     _setErrorMessage("Please Enter Email /Number");
                //
                //     // Timer(Duration(seconds: 2), () async {
                //     //   setState(() {
                //     //     _errorMessage = "";
                //     //   });
                //     // });
                //
                //     return _errorMessage;
                //   }
                //
                //   return null;
                // },
controller: AppControllers.loginEmpleadoEmailNumberController,
               // selectionWidthStyle: BoxWidthStyle.max,
                          decoration: InputDecoration(
                            hintText: "Email/Number",
                           // isDense: true,
                           errorText:_errorMessage!.isNotEmpty ? _errorMessage : null,

                            errorStyle: const TextStyle(
                              height: 0.40,
                              fontSize: 10.0,
                              color: Colors.red,
                            ),
                            hintStyle: GoogleFonts.poppins(color: AppColors.greyColor2),
                            border: InputBorder.none,
contentPadding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 8.sp),
prefixIcon: SvgPicture.asset(AppIcons.loginUserNameIcon,height: 18.sp,width: 15.sp,),
                            prefixIconConstraints: const BoxConstraints(minWidth: 30, minHeight: 18),
                          ),
              ),
            ),
          ),
  ),
SizedBox(height: 5.sp,),
  // Padding(
  //   padding:  EdgeInsets.symmetric(horizontal:90.sp),
  //   child: FittedBox(child:  Text("Ask your HR/Empleado Admin for your Empleado ID",style: GoogleFonts.poppins(fontWeight: FontWeight.w600),)),
  // ),
  SizedBox(height: 18.sp,),

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
                    // hoverColor: AppColors.purpleColor,
                     color: AppColors.buttonColor,

                    // splashColor: AppColors.buttonColor,
                    elevation: 8,
                    onPressed: (){


                      if (AppControllers.loginEmpleadoEmailNumberController.text!="" && AppControllers.loginEmpleadoEmailNumberController.text.length>4) {
                        // do something with the validated data
                        context.read<FindUserCubit>().getUser(AppControllers.loginEmpleadoEmailNumberController.text);

                       // Navigator.push(context, CustomSlidePageRoute( direction: AxisDirection.left, child: const LoginScreen2()));

                      }
                      else
                        {
                          if (AppControllers.loginEmpleadoEmailNumberController.text.isEmpty){
                          _setErrorMessage("Please Enter Email /Number");
                        }
else if(AppControllers.loginEmpleadoEmailNumberController.text.length<=4)
  {
          _setErrorMessage("Email or Number Must be greater than 4");
  }


                          Timer(const Duration(seconds: 2), () async {
                            setState(() {
                              _errorMessage = "";
                            });
                          });
                        }
                          debugPrint("next Tap");


//Repository().findUser(AppControllers.loginEmpleadoEmailNumberController.text);
                    },
                    child:   LoginButton(textToDisplay: "Next", height: 38.h, width: 258.w,),
            ),
          ),
  ),



],

                        ),
                  ),
                  veevoCopyRightWidget()
                ],
              ),
                  // Positioned(
                  //
                  //     bottom: 0.sp,
                  //     child: veevoCopyRightWidget())


            ),
          stateBuilder is FindUserLoading?Container(
            color: Colors.black54,
            child: Center(
              child: SpinKitWave(color: AppColors.blueContainerColor,size: 25.sp,),
            ),
          ):SizedBox(height: 0.sp,)

        ],
      ),
    );
  },
),

    );
  }
}


