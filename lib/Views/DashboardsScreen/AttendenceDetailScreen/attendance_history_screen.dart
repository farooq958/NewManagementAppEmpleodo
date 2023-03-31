import 'package:empleado_development/Controller/Cubits/Attendance/Last30DaysAttendanceCubit/last_30_days_cubit.dart';
import 'package:empleado_development/Model/AttendanceModel/attendance_controller.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/DashboardWidgets/dashboard_utils.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

class AttendanceHistoryScreen extends  StatelessWidget {
   const AttendanceHistoryScreen({Key? key}) : super(key: key);


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
          title: Text("Attendance History",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
          leading:
          InkWell(

              onTap: (){

                Navigator.pop(context);
              },
              child: Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,)))


      ),
      body: BlocConsumer<Last30DaysCubit, Last30DaysState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, last30DaysBuilder) {
    if(last30DaysBuilder is Last30DaysLoaded) {
      return StickyFooterScrollView(
        footer: veevoCopyRightWidget(),
        itemBuilder: (BuildContext context, int index1) {
          return ListView.builder(

          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          reverse: false,
          itemBuilder: (context,index) {
            return ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
//Icon And date
              children: [
                SizedBox(height: 10.sp),
                UnconstrainedBox(
                  child: Container(
                    //color: Colors.yellow,
                    padding: EdgeInsets.only(right: 180.sp
                    ),
                    height: 20.sp,
                    width: 1.sw,
                    child: Row(
                      children: <Widget>[

                        Expanded(child: Align(
                            alignment: Alignment.centerRight,
                            child: SvgPicture.asset(AppIcons.attendanceHistoryIcon,width: 30.sp,))),
                        SizedBox(width: 4.sp,),
                        Expanded(
                            flex:3,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: FittedBox(child: Text(last30daysController.data[index].date,style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w600),)))),



                      ],
                    ),
                  ),
                ),
                 SizedBox(height: 5.sp),
                ///In Time out Time Earned Hours

                     ListView.builder(
                       shrinkWrap: true,
                         itemCount: last30daysController.data[index].timings.length,
physics: const BouncingScrollPhysics(),
                       itemBuilder: (context,index1) {
                         return ListView(
                           physics: const NeverScrollableScrollPhysics(),
                           shrinkWrap: true,
                           children: [
                             SizedBox(height: 2.sp,),
                             SizedBox(

                               height: 50.sp,
                               child: Row(
                                 mainAxisAlignment:
                                 MainAxisAlignment.spaceEvenly,
                                 children:  <Widget>[
                                   Flexible(
                                     child: Align(
                                       alignment: Alignment.topCenter,
                                       child: BuildColumnDashboard(
                                         firstString: 'In Time',
                                         secondString:last30daysController.data[index].timings[index1].timingIn, theme: false,
                                       ),
                                     ),
                                   ),

                                   Flexible(
                                     child: BuildColumnDashboard(
                                         firstString: 'Out Time',
                                         secondString:  last30daysController.data[index].timings[index1].out ,
                                         theme: false
                                     ),
                                   ),

                                   Flexible(
                                     child: BuildColumnDashboard(
                                         firstString: 'Earned Hours',
                                         secondString: last30daysController.data[index].earned,
                                         theme: false
                                     ),
                                   )
                                 ],
                               ),
                             ),
                           ],
                         );
                       }
                     ),

                /// Overtime and late minutes
                Container(
                  height: 60.sp,
                  padding: EdgeInsets.only(left: 20.sp),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children:  [

                       Expanded(
                        flex: 2,
                        child: BuildColumnDashboard(
                            firstString: 'OverTime',
                            secondString: last30daysController.data[index].overtime,
                            theme: false
                        ),
                      ),

                      Flexible(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.only(right: 80.0.sp),
                          child:  BuildColumnDashboard(
                              firstString: 'Late Minutes',
                              secondString: last30daysController.data[index].lateMinutes.toString(),
                              theme: false
                          ),
                        ),
                      )


                    ],),)  ,
                SizedBox(height: 5.sp,),

                Image.asset("assets/images/dividerAttendanceHistory.png",height: 10.sp,)
              ],

            );
          }, itemCount: last30daysController.data.length,
        ); }, itemCount: 1,

      );
    }
    else
      {
         return Center(child: SpinKitWave(size: 20.sp,itemCount: 5,color: AppColors.blueContainerColor,),);

      }
  },
),


    );
  }
}
