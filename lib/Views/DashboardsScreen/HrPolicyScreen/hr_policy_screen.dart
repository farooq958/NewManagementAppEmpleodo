import 'package:empleado_development/Controller/Cubits/HrPolicy/hr_policy_cubit.dart';
import 'package:empleado_development/Model/HrPolicyModel/hr_policy_controller.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/HrPolicyWidgets/hr_policy_utils.dart';
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
         InkWell(

             onTap: (){

               Navigator.pop(context);
             },
             child: Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,)))


),
      body: StickyFooterScrollView(
        itemBuilder: (context,index) {
          return BlocConsumer<HrPolicyCubit, HrPolicyState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, hrData) {
    if(hrData is HrPolicyLoaded) {
      return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
          SizedBox(height: 5.sp,),
              ///policy name
               Center(child: Text(hrPolicyController.policyName,style: GoogleFonts.poppins(color: AppColors.blueContainerColor,fontWeight: FontWeight.w600,fontSize: 25.sp),),)
             ,
              SizedBox(height: 15.sp,),

               BuildPolicyFirstRows(string1: 'PID', string2: hrPolicyController.id.toString(),),
              SizedBox(height: 5.sp,),
               BuildPolicyFirstRows(string1: 'Timings', string2: "${hrPolicyController.startingTime} - ${hrPolicyController.closingTime}" ,),

              SizedBox(height: 5.sp,),
              const BuildPolicyFirstRows(string1: 'Expiry', string2: 'Valid',),
              SizedBox(height: 5.sp,),
               BuildPolicyFirstRows(string1: 'PayRoll Type', string2:  hrPolicyController.payroll == "1"
                  ? "Time Base"
                  : hrPolicyController.payroll == "2"
                  ? "Attendence Base"
                  :
                   "Hourly Base"
                 ,),
              SizedBox(height: 5.sp,),
               BuildPolicyFirstRows(string1: 'OverTime', string2: hrPolicyController.overtimePay=="0"?"UnPaid":"Paid",),
              SizedBox(height: 5.sp,),
               BuildPolicyFirstRows(string1: 'Created Date', string2:AppUtils.formatDateFromEpoch(hrPolicyController.creationTime),),
              SizedBox(height: 15.sp,),
        ///Policy Brief
              Padding(
                padding:  EdgeInsets.only(left: 18.0.sp),
                child: Text("Policy Brief",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor,fontSize: 20.sp),),
              ),
              SizedBox(height: 10.sp,),
               PolicyBriefColumnWidget(string1: 'Force Timeout', string2: '${hrPolicyController.forceTimeout} mins after closing time',),
              SizedBox(height: 10.sp,),
               PolicyBriefColumnWidget(string1: 'Leniency Time', string2: '${hrPolicyController.leniencyTime} mins',),
              SizedBox(height: 10.sp,),
               PolicyBriefColumnWidget(string1: 'Early Arrival Policy', string2:hrPolicyController.earlyArrival=="1" ?'Count shift Timing':"Count Actual Time",),
              SizedBox(height: 10.sp,),
               PolicyBriefColumnWidget(string1: 'Max Early Arrival Time', string2: '${hrPolicyController.earlyArrivalMaxTime} mins',),
              SizedBox(height: 10.sp,),
               PolicyBriefColumnWidget(string1: 'Working Days', string2: hrPolicyController.workingDays,),
              SizedBox(height: 10.sp,),
               PolicyBriefColumnWidget(string1: 'Timeout Policy', string2: hrPolicyController.timeoutPolicy=="1"?"Mark as present":
               hrPolicyController.timeoutPolicy=="0"?
                   "Mark as absent":hrPolicyController.timeoutPolicy=="2"?"Mark as half day":"Count as 1hour"),
              SizedBox(height: 10.sp,),
               PolicyBriefColumnWidget(string1: 'Late Min Monthly Bucket', string2: '${hrPolicyController.lateTimeInMinutes} mins',),
              SizedBox(height: 10.sp,),
              const PolicyBriefColumnWidget(string1: 'Late Comers Penalty ', string2: 'Late Mins x 1.5 mins',),
              SizedBox(height: 10.sp,),
               PolicyBriefColumnWidget(string1: 'Allowed Leaves', string2: '${hrPolicyController.allowedOffs} days',),
              SizedBox(height: 10.sp,),
               PolicyBriefColumnWidget(string1: 'Leave Assigned Group', string2: hrPolicyController.leaveGroup,),
              SizedBox(height: 10.sp,),
               PolicyBriefColumnWidget(string1: 'Duty Duration', string2:hrPolicyController.payroll=="3"? (int.parse(hrPolicyController.workingHours)+int.parse(hrPolicyController.workingMin)).toString():
                 AppUtils.convertToUtcAndGetDurationTime(hrPolicyController.startingTime, hrPolicyController.closingTime)
                 ,),
              SizedBox(height: 10.sp,),
               PolicyBriefColumnWidget(string1: 'Bio Metric Machine', string2: hrPolicyController.useMultiDevices=="1"?"Multiple Machine":'Single Machine',),
              SizedBox(height: 10.sp,),
               PolicyBriefColumnWidget(string1: 'Minimum Overtime Required', string2: '${hrPolicyController.overtimeMinMinutes} Mins',),
              SizedBox(height: 10.sp,),
              const PolicyBriefColumnWidget(string1: 'Daily Overtime', string2: 'UnPaid',),
              SizedBox(height: 10.sp,),
              const PolicyBriefColumnWidget(string1: 'Policy Swap', string2: '--',),
              SizedBox(height: 10.sp,),
               PolicyBriefColumnWidget(string1: 'Holiday Overtime', string2:hrPolicyController.overtimeRules!=null ?
               hrPolicyController.overtimeRules.holidayOtRate=="0"
               ?'Un Paid':"Paid":""),
              SizedBox(height: 10.sp,),
               PolicyBriefColumnWidget(string1: 'Holiday Overtime Ratio', string2: hrPolicyController.overtimeRules!=null ?
              hrPolicyController.overtimeRules.holidayOtRate=="0"
                  ?'Un Paid':hrPolicyController.overtimeRules.holidayOtVal:"0.0",),
              SizedBox(height: 10.sp,),
               PolicyBriefColumnWidget(string1: 'Pay Schedule', string2: hrPolicyController.payMonth,),








            ],);
    }
    else{

      return SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Center(child: SpinKitWave(color: AppColors.blueContainerColor,size: 20.sp,)));
    }
  },
);
        }, footer: veevoCopyRightWidget(), itemCount: 1,
      ),


    );
  }
}




