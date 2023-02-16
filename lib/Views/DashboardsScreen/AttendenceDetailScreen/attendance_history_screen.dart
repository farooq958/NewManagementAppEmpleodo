import 'package:empleado_development/Views/Utils/CustomWidgets/DashboardWidgets/dashboard_utils.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,))


      ),
      body: StickyFooterScrollView(
        itemBuilder: (context,index) {
          return SizedBox(

           height:  200.sp,
           width: 1.sw,
child:ListView(physics: const NeverScrollableScrollPhysics(),
//Icon And date
children: [
SizedBox(height: 20.sp),
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
                                                    child: FittedBox(child: Text("2023 February 30",style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w600),)))),



                                          ],
                                         ),
             ),
           ),
          // SizedBox(height: 5.sp),
///In Time out Time Earned Hours
           Container(

             height: 60.sp,
             padding: EdgeInsets.only(left: 20.sp),
             child: Row(
                   mainAxisAlignment:
                   MainAxisAlignment.spaceEvenly,
                   children: const <Widget>[
                    Flexible(
                     child: Align(
                   alignment: Alignment.topCenter,
                   child: BuildColumnDashboard(
                     firstString: 'In Time',
                     secondString: '9:30 am',
                   ),
                     ),
                   ),

                   Flexible(
                     child: BuildColumnDashboard(
                   firstString: 'Out Time',
                   secondString: '5:30 pm',
                     ),
                   ),

                   Flexible(
                     child: BuildColumnDashboard(
                   firstString: 'Earned Hours',
                   secondString: '7 hrs, 25 min',
                     ),
                   )
                   ],
             ),
           ),
            /// Overtime and late minutes
           Container(
             height: 60.sp,
             padding: EdgeInsets.only(left: 20.sp),
             child: Row(
                   mainAxisAlignment:
                   MainAxisAlignment.spaceEvenly,
                   children:  [

                   const Expanded(
                   flex: 2,
                   child: BuildColumnDashboard(
                     firstString: 'OverTime',
                     secondString: '12 min',
                   ),
                   ),

                   Flexible(
                   flex: 4,
                   child: Padding(
                     padding: EdgeInsets.only(right: 80.0.sp),
                     child: const BuildColumnDashboard(
                   firstString: 'Late Minutes',
                   secondString: '1000',
                     ),
                   ),
                   )


           ],),)  ,
SizedBox(height: 5.sp,),

Image.asset("assets/images/dividerAttendanceHistory.png",height: 20.sp,)
],

),
);
        }, footer: veevoCopyRightWidget(), itemCount: 30,
      ),


    );
  }
}
