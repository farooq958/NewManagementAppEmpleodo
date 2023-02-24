
import 'package:empleado_development/Controller/Cubits/DashboardCubits/date_picking_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Theme/theme_cubit.dart';
import 'package:empleado_development/Model/attendencemodel.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/AttendanceDetails/attendance_details_widget.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/DashboardWidgets/dashboard_utils.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/HrPolicyWidgets/hr_policy_utils.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AttendanceDetailsScreen extends StatelessWidget {
  const AttendanceDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Attendance> chartData = [
      Attendance( day: 1, hours: 5),
      Attendance( day: 2, hours: 8),
      Attendance( day: 3, hours: 6),
      Attendance( day: 4, hours: 5),
      Attendance( day: 5, hours: 7),
      Attendance( day: 6, hours: 7),
      Attendance( day: 7, hours: 8),
      Attendance( day: 8, hours: 6),
      Attendance( day: 9, hours: 5),
      Attendance( day: 10, hours: 7),
      Attendance( day: 11, hours: 7),
      Attendance( day: 12, hours: 8),
      Attendance( day: 13, hours: 6),
      Attendance( day: 14, hours: 5),
      Attendance( day: 15, hours: 7),
      Attendance( day: 16, hours: 7),
      Attendance( day: 17, hours: 8),
      Attendance( day: 18, hours: 6),
      Attendance( day: 19, hours: 5),
      Attendance( day: 20, hours: 7),
      Attendance( day: 21, hours: 7),
      Attendance( day: 22, hours: 8),
      Attendance( day: 23, hours: 6),
      Attendance( day: 24, hours: 5),
      Attendance( day: 25, hours: 7),
      Attendance( day: 26, hours: 7),
      Attendance( day: 27, hours: 8),
      Attendance( day: 28, hours: 6),
      Attendance( day: 29, hours: 5),
      Attendance( day: 30, hours: 7),
      Attendance( day: 31, hours: 7),



    ];
    return  BlocBuilder<ThemeCubit, bool>(
      builder: (context, themeState) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor:AppColors.blueContainerColor,

            // Status bar brightness (optional)
            statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          backgroundColor: themeState==false?AppColors.primaryColor:Colors.black87,
          // automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text("Attendance",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: themeState==false?AppColors.greyColor:Colors.white70),),
          leading:
          InkWell(
              onTap: (){

                Navigator.pop(context);
              },
              child: Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,color: themeState==false?AppColors.greyColor:Colors.white70,)))


      ),

      body: StickyFooterScrollView( itemBuilder: (context,index){

        return Container(
          color: themeState==false?AppColors.primaryColor:Colors.black87,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              SizedBox(height: 20.sp,),
              BlocConsumer<DatePickingCubit, DateTime>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, dateTimeAdjusted) {
    return UnconstrainedBox(
                child: Container(
                  height: 1.sh<750? 1.sh / 1.7:1.sh/2.03,
                  width: 1.sw / 1.1,
                  decoration: BoxDecoration(
                   color:   themeState==false?AppColors.primaryColor:AppColors.greyColor2,
                      borderRadius:
                      BorderRadius.circular(30.sp)),
                  child: ListView(
                    physics:
                    const NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 30.sp,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0.sp),
                                child: Text(
                                  "Attendance",
                                  style:
                                  GoogleFonts.poppins(
                                      fontWeight:
                                      FontWeight
                                          .w700,
                                      color: AppColors
                                          .greyColor),
                                ),
                              )),
                          Expanded(
                              child: InkWell(
                                onTap: () {
                                  // BottomPicker.date(title: "Date Picked",onSubmit: (value){print(value);},).show(context);

                                  DatePicker.showPicker(
                                      context,
                                      pickerModel:
                                      CustomMonthPicker(
                                        minTime: DateTime(
                                            2010, 1, 1),
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
                                      left: 20.0.sp,
                                      right: 20.sp),
                                  child: Align(
                                      alignment: Alignment
                                          .centerRight,
                                      child: Container(
                                        height: 40.sp,
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
                                        child: Center(
                                            child: FittedBox(
                                                child: Text(
                                                  "${AppUtils.getString(dateTimeAdjusted.month)}-${dateTimeAdjusted.year}",
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight
                                                          .w400,
                                                      color: AppColors
                                                          .greyColor,
                                                      fontSize:
                                                      15.sp),
                                                ))),
                                      )),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(height: 20.sp,),
                      SfCartesianChart(
                        //margin: EdgeInsets.symmetric(horizontal: 0),


                          primaryXAxis: NumericAxis(
                              interval: 5,
                              title: AxisTitle(text: "Month Days"
                                  ,textStyle:
                                  GoogleFonts.poppins(color:themeState==false? AppColors.greyColor:Colors.white70,fontWeight: FontWeight.w500,fontSize: 14.sp)),
                              minimum: 0
                              ,
                              maximum: 32,
                              labelStyle: GoogleFonts.poppins(color: themeState==false?AppColors.greyColor2:Colors.white70),

                      ),
                          primaryYAxis: NumericAxis(

                              title: AxisTitle(

                                  text: "Hours",textStyle:

                                  GoogleFonts.poppins(color:themeState==false? AppColors.greyColor:Colors.white70,fontWeight: FontWeight.w500,fontSize: 14.sp)),
                              minimum: 0,
                              maximum: 10,
                            labelStyle: GoogleFonts.poppins(color: themeState==false?AppColors.greyColor2:Colors.white70),

                          ),
                          plotAreaBorderColor: themeState==false?AppColors.greyColor:Colors.black87,
                          plotAreaBackgroundColor: themeState==false?AppColors.primaryColor:AppColors.greyColor2,
                          series: <ChartSeries<Attendance, int>>[
                            // Renders column chart
                            ColumnSeries<Attendance,int>(

                                borderColor: AppColors.primaryColor,
                                color: AppColors.blueContainerColor,
                                width: 0.7.sp,
                                dataSource: chartData,
                                xValueMapper: (Attendance data, _) => data.day,
                                yValueMapper: (Attendance data, _) => data.hours
                                ,
                                pointColorMapper: (Attendance data, _) => data.hours<=3?AppColors.redColor:data.hours<=6?AppColors.yellowColor:AppColors.greenColor,

                                markerSettings:  MarkerSettings(
                                    borderColor: AppColors.purpleColor,
                                    isVisible: true,
                                    color: AppColors.primaryColor,
                                    // Marker shape is set to diamond
                                    shape: DataMarkerType.circle
                                )
                            ),

                          ]
                      ),
                      //SizedBox(height: 5.sp,),



                    ],
                  ),
                ),
              );
  },
),
              SizedBox(height: 10.sp,),
  const AttendanceDetailsColumnWidget(string1: "Expected Hours", string2: "170"),
              SizedBox(height: 10.sp,),
SizedBox(
    width: 1.sw/1.1,
    height: 75.sp,
    //color: AppColors.primaryColor,
    child: ListView(
  physics: const NeverScrollableScrollPhysics(),
  scrollDirection: Axis.horizontal,
  shrinkWrap: true,children: [
      SizedBox(width: 5.sp,),
      const AttendanceDetailsTwoRowWidget(string1: "Late Minutes", string2: "2Hrs", string3: '2100', string4: '210',),
      SizedBox(width: 5.sp,),
      const AttendanceDetailsTwoRowWidget(string1: "OverTime", string2: "3Hrs", string3: '', string4: '',),

],)),

              SizedBox(height: 15.sp,),
              Padding(
                padding:  EdgeInsets.only(left: 30.0.sp),
                child: Row(children: [
                  Expanded(child: RowWidgetDashboard2(value: '120', textToShow: 'Earned\nHours',),
                  ),
                  Flexible(
                      flex: 1,
                      child: SizedBox(
                        //  height: 20.sp,
                        width: 50.sp,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(90/360),
                          child: Divider(
                            height: 1.sp,
                            thickness: 1,
                            color: AppColors.greyColor2,
                          ),
                        ),
                      )),
                  Expanded(child: RowWidgetDashboard2(value: '120', textToShow: 'Total\nAbsentees',),
                  ),

                ],),
              ),
              SizedBox(height: 5.sp,),
              Padding(
                padding:  EdgeInsets.only(left: 30.0.sp),
                child: Row(children: [
                  Expanded(child: RowWidgetDashboard2(value: '210', textToShow: 'Allowed\nLateMins',),
                  ),
                  Flexible(
                      flex: 1,
                      child: SizedBox(
                        //  height: 20.sp,
                        width: 50.sp,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(90/360),
                          child: Divider(
                            height: 1.sp,
                            thickness: 1,
                            color: AppColors.greyColor2,
                          ),
                        ),
                      )),
                  Expanded(child: RowWidgetDashboard2(value: '5', textToShow: 'Used\nLateMins',),
                  ),

                ],),
              ),
              SizedBox(height: 5.sp,),

              Image.asset("assets/images/dividerAttendanceHistory.png"),
              SizedBox(height: 5.sp,),
              Padding(
                padding:  EdgeInsets.only(left: 15.0.sp),
                child: Text("Absentees/Leaves",style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w600),),
              ),
              SizedBox(height: 5.sp,),
              Padding(
                padding:  EdgeInsets.only(left: 30.0.sp),
                child: Row(children: [
                  Expanded(child: RowWidgetDashboard2(value: '120', textToShow: 'Total\nAbsentees',),
                  ),
                  Flexible(
                      flex: 1,
                      child: SizedBox(
                        //  height: 20.sp,
                        width: 50.sp,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(90/360),
                          child: Divider(
                            height: 1.sp,
                            thickness: 1,
                            color: AppColors.greyColor2,
                          ),
                        ),
                      )),
                  Expanded(child: RowWidgetDashboard2(value: '120', textToShow: 'Allowed\nLeaves',),
                  ),

                ],),
              ),
              SizedBox(height: 5.sp,),
              Padding(
                padding:  EdgeInsets.only(left: 30.0.sp),
                child: Row(children: [
                  Expanded(child: RowWidgetDashboard2(value: '210', textToShow: 'Adjusted\nLeaves',),
                  ),
                  Flexible(
                      flex: 1,
                      child: SizedBox(
                        //  height: 20.sp,
                        width: 50.sp,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(90/360),
                          child: Divider(
                            height: 1.sp,
                            thickness: 1,
                            color: AppColors.greyColor2,
                          ),
                        ),
                      )),
                  Expanded(child: RowWidgetDashboard2(value: '5', textToShow: 'Counted\nas Absent',),
                  ),

                ],),
              ),
              SizedBox(height: 5.sp,),
              Image.asset("assets/images/dividerAttendanceHistory.png"),
              SizedBox(height: 5.sp,),
              // Container(
              //   height: 100.sp,
              //   width: 1.sw,
              //   child: Row(
              //         children: <Widget>[
              //
              //           AttendanceDetailsTwoRowWidget(string1: "Late Minutes", string2: "0(used)/210(allowed)"),
              //
              //
              //         ],
              //       ),
              // ),
                ],

          ),
        );



      }, itemCount: 1,footer: veevoCopyRightWidget(),)
 
    );
  },
);
  }
}
