import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerListTileNoticeScreen extends StatelessWidget {
  String iconPath;
  String titleText;
  String dateString;
  String descriptionString;
  bool fromDetail;
  ContainerListTileNoticeScreen({
    Key? key,
    required this.iconPath
    ,
    required this.titleText,
    required this.dateString,
    required this.descriptionString, required  this.fromDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 10.0.sp,right: 10),
      child: Container(
        height: fromDetail==true?1.sh/1.5:150.sp,
        width: 1.sw,
        decoration:BoxDecoration(
            border: Border.all(color: AppColors.borderColorgrey),
            borderRadius: BorderRadius.circular(10.sp)) ,

        child:  ListTile(

          leading: Container(
            height: 50.sp,
            width: 50.sp,
            decoration:BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10.sp)),
            child: Center(child: SvgPicture.asset(iconPath,height: 30.sp,))),
          title:  SizedBox(
            height: 80.sp,

            child: Column(
              children: [
                Expanded(child: Padding(
                  padding:  EdgeInsets.only(bottom: 12.0.sp),
                  child: Align(

                      alignment: Alignment.bottomLeft,
                      child: Text(titleText,style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w600),)),
                )),
                Row(
                  children: <Widget>[
        SvgPicture.asset(AppIcons.attendanceHistoryIcon,height: 13.sp,color: AppColors.greyColor2,),
                    SizedBox(width: 2.sp,),
                    Text(dateString,style: GoogleFonts.poppins(color: AppColors.greyColor2,fontSize: 12.sp),)

                  ],
                ),
              ],
            ),
          ),

          subtitle: Container(
padding: const EdgeInsets.only(top: 10),
            height:fromDetail==true?300.sp :80.sp,
width: 200.sp,

child:   Text(descriptionString,
  textAlign: TextAlign.start,
  overflow: fromDetail==true?TextOverflow.visible:TextOverflow.ellipsis,
  softWrap: true,style: GoogleFonts.poppins(color: AppColors.greyColor2,fontSize: fromDetail==true?15.sp:20.sp,fontWeight: FontWeight.w400),),

          ),
          trailing: fromDetail==true? SizedBox(height: 0.sp,width: 0.sp,) : SizedBox(

              height: 100.sp,
              width: 20.sp,

              child: Align(

                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(AppIcons.backButtonIcon,height: 20.sp,))),

        ),
      ),



    );
  }
}