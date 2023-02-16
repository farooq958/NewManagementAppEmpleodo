import 'package:empleado_development/Views/Utils/CustomWidgets/HrPolicyWidgets/hr_policy_utils.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

class HrPolicyScreen extends  StatelessWidget {
  const HrPolicyScreen({Key? key}) : super(key: key);

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
  title: Text("HR Policy",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
leading:
         Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,))


),
      body: StickyFooterScrollView(
        itemBuilder: (context,index) {
          return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
          SizedBox(height: 5.sp,),
              ///policy name
               Center(child: Text("Dec 2021",style: GoogleFonts.poppins(color: AppColors.blueContainerColor,fontWeight: FontWeight.w600,fontSize: 25.sp),),)
             ,
              SizedBox(height: 15.sp,),

              const BuildPolicyFirstRows(string1: 'PID', string2: '2142',),
              SizedBox(height: 5.sp,),
              const BuildPolicyFirstRows(string1: 'Timings', string2: '9:30 Am - 6:30 Pm',),

              SizedBox(height: 5.sp,),
              const BuildPolicyFirstRows(string1: 'Expiry', string2: 'Valid',),
              SizedBox(height: 5.sp,),
              const BuildPolicyFirstRows(string1: 'PayRoll Type', string2: 'Time Base',),
              SizedBox(height: 5.sp,),
              const BuildPolicyFirstRows(string1: 'OverTime', string2: 'UnPaid',),
              SizedBox(height: 5.sp,),
              const BuildPolicyFirstRows(string1: 'Created Date', string2: '2021-12-10',),
              SizedBox(height: 15.sp,),
        ///Policy Brief
              Padding(
                padding:  EdgeInsets.only(left: 18.0.sp),
                child: Text("Policy Brief",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor,fontSize: 20.sp),),
              ),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Force Timeout', string2: '300 mins after closing time',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Leniency Time', string2: '10 mins',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Early Arrival Policy', string2: 'Count shift Timing',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Max Early Arrival Time', string2: '0 mins',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Working Days', string2: 'Mon, Tue, Wed, Thu, Fri',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Timeout Policy', string2: 'Mark as Present',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Late Min Monthly Bucket', string2: '210 mins',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Late Comers Penalty ', string2: 'Late Mins x 1.5 mins',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Allowed Leaves', string2: '8 days',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Leave Assigned Group', string2: 'Standard Leaves',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Duty Duration', string2: '8 hrs,30 mins',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Bio Metric Machine', string2: 'Single Machine',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Minimum Overtime Required', string2: '10 Mins',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Daily Overtime', string2: 'UnPaid',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Policy Swap', string2: '--',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Holiday Overtime', string2: 'Un Paid',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Holiday Overtime Ratio', string2: 'Un Paid',),
              SizedBox(height: 10.sp,),
              const PolicyBriefCoulmnWidget(string1: 'Pay Schedule', string2: 'Current',),








            ],);
        }, footer: veevoCopyRightWidget(), itemCount: 1,
      ),


    );
  }
}




