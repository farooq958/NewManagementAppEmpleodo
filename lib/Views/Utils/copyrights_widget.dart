import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


 Widget veevoCopyRightWidget() {
return Container(color: AppColors.primaryColor , height: 50.sp,width: 1.sw, child:
Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: <Widget>[
Expanded(

child: Align( alignment: Alignment.centerRight
,child: Image.asset(AppIcons.veevoTechLogo,
width: 40.sp,height:25.sp ,))),
Expanded(
flex: 2,
child: Padding(
padding:  EdgeInsets.only(left: 8.0.sp),
child: Text('Powered by Veevo Tech',style:
GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 10.sp,color: AppColors.greyColor),),
)

)
],
 ));}