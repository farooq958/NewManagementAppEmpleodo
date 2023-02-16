import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  final String textToDisplay;
  final double height;
  final double width;
  const LoginButton({
    Key? key, required this.textToDisplay, required this.height, required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height,
      width: width,
      //padding: EdgeInsets.symmetric(horizontal: 80.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: AppColors.buttonColor


      ),

      child:  Center(child: FittedBox(child: Text(textToDisplay,style: GoogleFonts.poppins(color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.w400),)),),

    );
  }
}