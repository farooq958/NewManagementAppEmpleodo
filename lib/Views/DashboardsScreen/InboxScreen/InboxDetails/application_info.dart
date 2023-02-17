import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationInfo extends StatelessWidget {
  const ApplicationInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor:AppColors.blueContainerColor,

            // Status bar brightness (optional)
            statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          backgroundColor: AppColors.primaryColor,
          // automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text("Application Info",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
          leading:
          Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,))


      ),
      body: ListView(

        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        children: [

          ApplicationInfoContainer(cHeight: 40.sp, cColor: AppColors.blueContainerColor, text1: 'From', text2: 'Dated',),
          ApplicationInfoContainer(cHeight: 80.sp, cColor: AppColors.whiteColor, text1: 'Muhammad Farooq Khan', text2: '22-Feb-2023',)
          ,
      ApplicationInfoContainer(cHeight: 40.sp, cColor: AppColors.blueContainerColor, text1: 'Emp Id', text2: 'Subject',),

      ApplicationInfoContainer(cHeight: 80.sp, cColor: AppColors.whiteColor, text1: '9068211', text2: 'Time Adjustment',),

          ApplicationInfoContainer(cHeight: 40.sp, cColor: AppColors.blueContainerColor, text1: 'To', text2: 'Details',),

          ApplicationInfoContainer(cHeight: 80.sp, cColor: AppColors.whiteColor, text1: 'Approval Flow', text2: 'Was in bank was in bank was in bank Was in bank was in bank was in bankWas in bank was in bank was in bankWas in bank was in bank was in bankWas in bank was in bank was in bankWas in bank was in bank was in bankWas in bank was in bank was in bankWas in bank was in bank was in bankWas in bank was in bank was in bankWas in bank was in bank was in bankWas in bank was in bank was in bankWas in bank was in bank was in bank',),
      
          Text("Requested Time Adjustment: 2023-02-07 ",style: GoogleFonts.poppins(color: AppColors.buttonColor,fontWeight: FontWeight.w500),)
,SizedBox(height: 15.sp,),
          ApplicationInfoContainer(cHeight: 40.sp, cColor: AppColors.blueContainerColor, text1: 'In Time', text2: 'Out Time',),

          ApplicationInfoContainer(cHeight: 80.sp, cColor: AppColors.whiteColor, text1: '9:30', text2: '18:30 ')
      ,SizedBox(height: 15.sp,),
          Text("Approval List ",style: GoogleFonts.poppins(color: AppColors.buttonColor,fontWeight: FontWeight.w500,fontSize: 12.sp),)
,
          SizedBox(height: 10.sp,),
          Container(height: 150.sp,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20.sp),
            border: Border.all(color: AppColors.borderColorgrey)),
            child: ListView(shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
            children: [
              SizedBox(height: 15.sp,),
              ApplicationInfoContainer(cHeight: 20.sp, cColor: Colors.transparent, text1: 'Date: Wed Feb 08 2023', text2: 'Status: Pending',),
Divider(color: AppColors.borderColorgrey,),
              ApplicationInfoContainer(cHeight: 40.sp, cColor: Colors.transparent, text1: 'Approved By Administrator', text2: '    0',),
              Divider(color: AppColors.borderColorgrey,),
              ApplicationInfoContainer(cHeight: 20.sp, cColor: Colors.transparent, text1: 'Approval Type', text2: 'Administrator',),


            ],),

          ),
          SizedBox(height: 10.sp,)

        ],

      ),
    );
  }
}

class ApplicationInfoContainer extends StatelessWidget {
 final double? cHeight;
 final Color cColor;
 final String text1;
 final String text2;
  const ApplicationInfoContainer({
    Key? key,
  required this.cHeight,
    required this.cColor, required this.text1, required this.text2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cHeight,
      color: cColor,

child: Row(
  children: <Widget>[
SizedBox(width: 5.sp,),
    Expanded(child: Text(text1,style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w400,fontSize: 14.sp),)),
    SizedBox(
        height: 30.sp,
        child: VerticalDivider(color: AppColors.greyColor,width: 10,)),
     Expanded(child: SingleChildScrollView(child: Text(text2,style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w400,fontSize: 14.sp),))),

  ],
),
    );
  }
}
