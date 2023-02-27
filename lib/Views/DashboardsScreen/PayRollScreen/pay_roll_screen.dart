import 'package:empleado_development/Controller/Cubits/DashboardCubits/date_picking_cubit.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/DashboardWidgets/dashboard_utils.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

import '../../Utils/Data/utils.dart';

class PayRollScreen extends StatelessWidget {
  const PayRollScreen({Key? key}) : super(key: key);

  // @override
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
          title: Text("Payroll",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
          leading:
          InkWell(
              onTap: (){

                Navigator.pop(context);
              },
              child: Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,)))


      ),
      body: StickyFooterScrollView(

        footer: veevoCopyRightWidget(), itemBuilder: (BuildContext context, int index) {

        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(height: 30.sp,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.sp),
              height: 200.sp,decoration: BoxDecoration(border: Border.all(color: AppColors.borderColorGrey),borderRadius: BorderRadius.circular(10.sp)),
              child: ListView(physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,children: [
SizedBox(height:10.sp),

                Container(
                  //color: Colors.yellow,
                  padding: EdgeInsets.only(right: 160.sp
                  ),
                  height: 50.sp,
                  width: 1.sw,
                  child: Row(
                    children: <Widget>[

                      Expanded(child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 80.sp,
                            width: 80.sp,
                            decoration:BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(10.sp)),

                              child: Center(child: SvgPicture.asset(AppIcons.payRollMainPageIcon,width: 20.sp,))))),
                      SizedBox(width: 4.sp,),
                      Expanded(
                          flex:3,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: FittedBox(child: Text("Payroll",style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w600,fontSize: 20.sp),)))),



                    ],
                  ),
                ),
///starting pay and current pay
                Container(
                  height: 60.sp,
                  padding: EdgeInsets.only(left: 40.sp),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children:  [

                       const Expanded(
                        flex: 2,
                        child: BuildColumnDashboard(
                          firstString: 'Starting Pay',
                          secondString: '10,30,000', theme: false,
                        ),
                      ),

                      Flexible(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.only(right: 80.0.sp),
                          child: const BuildColumnDashboard(
                            firstString: 'Current pay',
                            secondString: '10,30,000',
                            theme: false,
                          ),
                        ),
                      )


                    ],),)  ,
SizedBox(height: 20.sp,),
                ///date and download buttun
                Row(
                      children: <Widget>[

                         InkWell(
                          onTap: () {
                            // BottomPicker.date(title: "Date Picked",onSubmit: (value){print(value);},).show(context);

                            DatePicker.showPicker(

                                context,
                               // showTitleActions: true,
                                pickerModel:
                                CustomMonthPicker(
                                  minTime: DateTime.now().subtract( Duration(days: 365+(DateTime.now().month*20))),
                                  maxTime:
                                  DateTime.now(),
                                  currentTime:
                                  DateTime.now(),
                                ), onConfirm:
                                (dateValue) {
                              context
                                  .read<
                                  DatePickingCubit>()
                                  .adjustDate(
                                  dateValue);
                              print(dateValue);
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 55.0.sp,
                                right: 10.sp),
                            child: Align(
                                alignment: Alignment
                                    .centerRight,
                                child:
                                    Container(
                                      height: 40.sp,
                                      width: 150.sp,
                                      decoration: BoxDecoration(
                                          color: AppColors
                                              .primaryColor,
                                          border: Border.all(
                                              color: AppColors
                                                  .greyColor2),
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              10.sp)),

                                      child: Row(
                                        children: [
                                          SizedBox(width: 5.sp,),
                                          Center(
                                              child: FittedBox(
                                                  child: Text(
                                                    "${AppUtils.getString(2)}-${"2020"}",
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        color: AppColors
                                                            .greyColor,
                                                        fontSize:
                                                        15.sp),
                                                  ))),
                                          SizedBox(width: 5.sp,),
                                          SvgPicture.asset(AppIcons.attendanceHistoryIcon,height: 13.sp,color: AppColors.greyColor2,),

                                        ],
                                      ),
                                    ),


                                ),
                          ),
                        ),
                        Container(
                          height: 40.sp,
                          width: 135.sp,
                          decoration: BoxDecoration(
                            color: AppColors
                                .primaryColor,
                            border: Border.all(
                                color: AppColors
                                    .greyColor2),
                            borderRadius:
                            BorderRadius
                                .circular(
                                10.sp)),
                          child: MaterialButton(
                            onPressed: () {  },
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            Expanded(

                                
                                child: Text("Download",style: GoogleFonts.poppins(color: AppColors.greyColor,fontSize: 13.sp),)),
                             Icon(Icons.download,color: AppColors.buttonColor,size: 20.sp,)

                          ],
                        ),
                          ),
                        )

                      ],
                    ),



                  ],),),
            SizedBox(height: 20.sp,),
            Padding(
              padding:  EdgeInsets.only(left: 18.0.sp),
              child: Text("Increment",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20.sp),
                height: 200.sp,decoration: BoxDecoration(border: Border.all(color: AppColors.borderColorGrey),borderRadius: BorderRadius.circular(10.sp)),
                child: ListView(physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,children: [
                  SizedBox(height:10.sp),

                  Container(
                    //color: Colors.yellow,
                    padding: EdgeInsets.only(right: 160.sp
                    ),
                    height: 50.sp,
                    width: 1.sw,
                    child: Row(
                      children: <Widget>[

                        Expanded(child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                height: 80.sp,
                                width: 80.sp,
                                decoration:BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(10.sp)),

                                child: Center(child: SvgPicture.asset(AppIcons.payRollMainPageIcon,width: 20.sp,))))),
                        SizedBox(width: 4.sp,),
                        Expanded(
                            flex:3,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: FittedBox(child: Text("Increment History",style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w600,fontSize: 20.sp),)))),



                      ],
                    ),
                  ),
                  ///Increment and Efective from
                  Container(
                    height: 60.sp,
                    padding: EdgeInsets.only(left: 40.sp),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children:  [

                        const Expanded(
                          flex: 2,
                          child: BuildColumnDashboard(
                            firstString: 'Increment',
                            secondString: '10,30,000',
                            theme: false,
                          ),
                        ),

                        Flexible(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.only(right: 80.0.sp),
                            child: const BuildColumnDashboard(
                              firstString: 'Effective from',
                              secondString: '10 jun 2023',
                              theme: false,
                            ),
                          ),
                        )


                      ],),)  ,
                  //SizedBox(height: 20.sp,),
                  Padding(
                    padding:  EdgeInsets.only(left: 18.0.sp),
                    child: Text("Description",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
                  ),
                  ///Description
                  SizedBox(
                    height:100,
                    child: Padding(
                      padding:  EdgeInsets.only(left: 8.0.sp),
                      child: Text(" completion of one year training and as a result Promotion to a permanent position as ‘Jr. Web Engineer (PHP)",style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w400,fontSize: 11.sp),),
                    ),
                  )



                ],),);

            }, separatorBuilder: (context,index){
              return Image.asset("assets/images/dividerAttendanceHistory.png",height: 20.sp,);
            }, itemCount: 10)

          ],

        );


      }, itemCount: 1,),

    );
  }
}
