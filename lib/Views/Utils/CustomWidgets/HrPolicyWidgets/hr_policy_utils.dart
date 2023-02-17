import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildPolicyFirstRows extends StatelessWidget {
  final String string1;
  final String string2;

  const BuildPolicyFirstRows({
    Key? key, required this.string1, required this.string2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.sp,
      color: AppColors.primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 30.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          Expanded(child: Text(string1,style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w600,fontSize: 17.sp),)),
          Expanded(child: Text(string2,style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w400,fontSize: 16.sp)))

        ],
      ),
    );
  }
}
class PolicyBriefColumnWidget extends StatelessWidget {
  final String string1;
  final String string2;
  const PolicyBriefColumnWidget({
    Key? key, required this.string1, required this.string2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 18.0.sp),
      height: 50.sp,decoration:
    BoxDecoration(color: AppColors.blueContainerColor,borderRadius: BorderRadius.only( topLeft:Radius.circular(25.sp),bottomRight: Radius.circular(25.sp) )),child: Column(children: [


      Expanded(child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Align(

              alignment: Alignment.centerRight,
              child: SvgPicture.asset("assets/images/clockPolicyIcon.svg"))),
          SizedBox(width: 5.sp,),
          Expanded(
            flex: 15,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(string1,style: GoogleFonts.poppins(color:Colors.white,fontWeight: FontWeight.w600,fontSize: 17.sp))),)

        ],
      ),
      ),
      Expanded(child:Padding(
        padding:  EdgeInsets.only(left: 25.0.sp),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(string2,style: GoogleFonts.poppins(color:Colors.white,fontWeight: FontWeight.w400,fontSize: 15.sp))),
      )
      ),

    ],),);
  }
}