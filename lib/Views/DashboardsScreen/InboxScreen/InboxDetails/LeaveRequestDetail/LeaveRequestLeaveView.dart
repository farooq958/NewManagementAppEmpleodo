import 'package:empleado_development/Controller/Cubits/Inbox/inbox_application_details_cubit.dart';
import 'package:empleado_development/Model/InboxModel/inbox_stories_model_controller.dart';
import 'package:empleado_development/Views/DashboardsScreen/InboxScreen/InboxDetails/application_info.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaveRequestLeaveView extends StatelessWidget {
  const LeaveRequestLeaveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InboxApplicationDetailsCubit, InboxApplicationDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        if(state is InboxApplicationDetailsLoaded) {
          return ListView(

            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            children: [
              SizedBox(height: 10.sp,),

              ApplicationInfoContainer(cHeight: 40.sp, cColor: AppColors.blueContainerColor, text1: 'Leave Start Date', text2: 'Leave End Date',),
              ApplicationInfoContainer(cHeight: 80.sp, cColor: AppColors.whiteColor, text1: inboxLeaveApplicationController.dbData[0].formData.leaveAppStartDate, text2: inboxLeaveApplicationController.dbData[0].formData.leaveAppEndDate.toString().replaceRange(11, 23, "")  ,)
,
              DataTableTheme(
                data: DataTableThemeData(
                headingRowColor: MaterialStateColor.resolveWith((states) => AppColors.blueContainerColor),
                //  dataRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade100),
                  headingTextStyle: GoogleFonts.poppins(fontSize: 15.sp,color: AppColors.blackColor87),
                  dataTextStyle: GoogleFonts.poppins(fontSize: 15.sp,color: AppColors.blackColor87),
                ),
                child: DataTable(
                  columnSpacing: 1.sp,
                  columns:  [
                    DataColumn(label: Text('Date',style: GoogleFonts.poppins(fontSize: 15.sp),)),
                    DataColumn(label: Text('Date AdjustIn',style: GoogleFonts.poppins(fontSize: 15.sp),)),
                    DataColumn(label: Text('Half Days',style: GoogleFonts.poppins(fontSize: 15.sp),)),
                  ],
                  rows: List<DataRow>.generate(
                    inboxLeaveApplicationController.dbData[0].formData.leaveDate.length,
                        (int index) => DataRow(cells: [
                      DataCell(FittedBox(child: Text(inboxLeaveApplicationController.dbData[0].formData.leaveDate[index].length>10? inboxLeaveApplicationController.dbData[0].formData.leaveDate[index].replaceRange(11, 23, ""):inboxLeaveApplicationController.dbData[0].formData.leaveDate[index]))),
                      DataCell( Text(inboxLeaveApplicationController.dbData[0].formData.leaveAdjustIn[index]=="without_pay"?"unpaid":inboxLeaveApplicationController.dbData[0].formData.leaveAdjustIn[index]=="5"?"annual leave":inboxLeaveApplicationController.dbData[0].formData.leaveAdjustIn[index])),
                      DataCell( FittedBox(child: Text(inboxLeaveApplicationController.dbData[0].formData.halfDay[index]=="0"?"Full Day":"Half Day"))),
                    ]),
                  ),
                  dividerThickness: 2.0, // Set the thickness of the divider

                ),
              ),


            ],

          );
        }
        else if(state is InboxApplicationDetailsLoading)
        { return  Center(child: SpinKitWave(
          size: 20.sp,
          color: AppColors.blueContainerColor,

        ));

        }
        else
        {

          return   const Center(child: Text("Something Went Wrong"),);
        }
      },
    );
  }
}
