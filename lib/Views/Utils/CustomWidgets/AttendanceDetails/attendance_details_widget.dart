import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendanceDetailsColumnWidget extends StatelessWidget {
  final String string1;
  final String string2;
  const AttendanceDetailsColumnWidget({
    Key? key, required this.string1, required this.string2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 3.0.sp),
      padding: EdgeInsets.only(left: 1.sw/3.3),
      height: 70.sp,decoration:
    BoxDecoration(border: Border.all(color: AppColors.borderColorgrey),borderRadius: BorderRadius.circular(25.sp)),child: Column(children: [


      Expanded(child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Align(

              alignment: Alignment.centerRight,
              child: SvgPicture.asset("assets/images/clockPolicyIcon.svg",color: Colors.yellow,height: 25.sp,))),
          SizedBox(width: 5.sp,),
          Expanded(
            flex: 14,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(string1,style: GoogleFonts.poppins(color:AppColors.greyColor,fontWeight: FontWeight.w400,fontSize: 17.sp))),)

        ],
      ),
      ),
      Expanded(child:Padding(
        padding:  EdgeInsets.only(left: 50.0.sp),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(string2,style: GoogleFonts.poppins(color:AppColors.greyColor,fontWeight: FontWeight.w600,fontSize: 17.sp))),
      )
      ),

    ],),);
  }
}
class AttendanceDetailsTwoRowWidget extends StatelessWidget {
  final String string1;
  final String string2;
  final String string3;
  final String string4;
  const AttendanceDetailsTwoRowWidget({
    Key? key, required this.string1, required this.string2, required this.string3, required this.string4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        margin:  EdgeInsets.symmetric(horizontal: 3.0.sp),
        padding: EdgeInsets.only(left: 1.sw/19),
        width: 1.sw/2.2,
        height: 70.sp,decoration:
      BoxDecoration(border: Border.all(color: AppColors.borderColorgrey),borderRadius: BorderRadius.circular(15.sp)),child: Column(children: [


        Expanded(child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Align(

                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset("assets/images/clockPolicyIcon.svg",

                      color: string1=="OverTime"?Colors.green:AppColors.redColor,height: 40.sp,))),
            SizedBox(width: 5.sp,),
            Expanded(
              flex: 14,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child:  Text(string1,style: GoogleFonts.poppins(color:AppColors.greyColor,fontWeight: FontWeight.w400,fontSize: 17.sp))),)

          ],
        ),
        ),
        Expanded(child:Padding(
          padding:  EdgeInsets.only(left: 1.0.sp),
          child: Align(
              alignment: Alignment.centerLeft,
              child:string1=="Late Minutes"?FittedBox(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: string3,
                        style: GoogleFonts.poppins(
                            color: AppColors.greyColor,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: '(Used)',
                        style: GoogleFonts.poppins(
                            color: AppColors.greyColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w300),
                      ),
                      TextSpan(
                        text: "/",
                        style: GoogleFonts.poppins(
                            color: AppColors.greyColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: string4,
                        style: GoogleFonts.poppins(
                            color: AppColors.greyColor,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: '(allowed)',
                        style: GoogleFonts.poppins(
                            color: AppColors.greyColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ): Padding(
                padding:  EdgeInsets.only(right: 80.0.sp),
                child: Align(alignment: Alignment.topCenter,child: FittedBox(child: Text(string2,style: GoogleFonts.poppins(color:AppColors.greyColor,fontWeight: FontWeight.w400,fontSize: 15.sp)))),
              )),
        )
        ),

      ],),),
    );
  }
}