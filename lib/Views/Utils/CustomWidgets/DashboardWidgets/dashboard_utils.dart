import 'dart:ffi';

import 'package:empleado_development/Controller/Cubits/Theme/theme_cubit.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RowWidgetDashboard2 extends StatelessWidget {
  String value="";
  String textToShow="";
  RowWidgetDashboard2({
    Key? key,
    required this.value,
    required this.textToShow
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
  builder: (context, themeState) {
    return Row(
      children: <Widget>[

        Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 40.sp,
                width: 55.sp,
                decoration: BoxDecoration(color: AppColors.blueContainerColor,borderRadius: BorderRadius.circular(15.sp)

                ),
                child: Center(child: Text(value,style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600))),
              ),
            )),
        Expanded(
            flex: 2,
            child: Padding(
          padding:  EdgeInsets.only(left: 8.sp),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(textToShow,style: GoogleFonts.poppins(color: themeState==false? AppColors.greyColor:Colors.white70,fontSize: 12.sp),)),
        ))

      ],
    );
  },
);
  }
}

class CustomMonthPicker extends DatePickerModel {
  CustomMonthPicker({
    required DateTime currentTime,
    required DateTime minTime,
    required DateTime maxTime,
  }) : super(minTime: minTime, maxTime: maxTime, currentTime: currentTime);

  @override
  List<int> layoutProportions() {
    return [1, 1, 0];
  }
}

class BuildColumnDashboard extends StatelessWidget {
  final String firstString;
  final String secondString;
  final bool theme;
  const BuildColumnDashboard({
    Key? key,
    required this.firstString,
    required this.secondString, required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: FittedBox(
                    child: Text(
                      firstString,
                      style: GoogleFonts.poppins(
                          color: theme==false?AppColors.greyColor:Colors.white70,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    )))),
        Expanded(
            flex: 1,
            child: Align(
                alignment: Alignment.topCenter,
                child: Text(secondString,
                    style: GoogleFonts.poppins(
                        color: theme==false?AppColors.greyColor:Colors.white70,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600)))),
      ],
    );
  }
}
class ContainerListTileDashBoard extends StatelessWidget {
  String iconPath;
  String titleText;
  ContainerListTileDashBoard({
    Key? key,
    required this.iconPath
    ,
    required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
  builder: (context, themeState) {
    return Padding(
      padding:  EdgeInsets.only(left: 10.0.sp,right: 10),
      child: Container(
        height: 50.sp,
        decoration:BoxDecoration(
          color: themeState==false? Colors.transparent:Colors.black87,
            border: Border.all(color: AppColors.borderColorGrey),
            borderRadius: BorderRadius.circular(10.sp)) ,

        child:  ListTile(

          leading: Container(
            padding: EdgeInsets.only(bottom: 10.sp),
              height: 35.sp,
// color: Colors.purpleAccent,
 width: 35.sp,
              child: FittedBox(child: SvgPicture.asset(iconPath,height: 35.sp,width: 35.sp,))),
          title:  Padding(
            padding: EdgeInsets.only(bottom: 15.0.sp),
            child: Text(titleText,style: GoogleFonts.poppins(color: themeState==false? AppColors.greyColor:Colors.white70,fontWeight: FontWeight.w600),),
          ),
          trailing: Padding(
            padding: EdgeInsets.only(bottom: 15.0.sp),
            child: SvgPicture.asset(AppIcons.backButtonIcon,height: 20.sp,),
          ),

        ),
      ),



    );
  },
);
  }
}
