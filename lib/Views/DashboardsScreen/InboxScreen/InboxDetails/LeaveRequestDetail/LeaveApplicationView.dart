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

class LeaveApplicationView extends StatelessWidget {
  const LeaveApplicationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<InboxApplicationDetailsCubit, InboxApplicationDetailsState>(
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
              ApplicationInfoContainer(cHeight: 40.sp, cColor: AppColors.blueContainerColor, text1: 'From', text2: 'Dated',),
              ApplicationInfoContainer(cHeight: 80.sp, cColor: AppColors.whiteColor, text1: inboxLeaveApplicationController.dbData[0].userName, text2:AppUtils.formatDateForInbox(AppUtils.getTimeFromEpoch(inboxLeaveApplicationController.dbData[0].entryTime))  ,)
              ,
              ApplicationInfoContainer(cHeight: 40.sp, cColor: AppColors.blueContainerColor, text1: 'Emp Id', text2: 'Subject',),

              ApplicationInfoContainer(cHeight: 80.sp, cColor: AppColors.whiteColor, text1: inboxLeaveApplicationController.dbData[0].formData.empId, text2: inboxLeaveApplicationController.dbData[0].formData.subject,),

              ApplicationInfoContainer(cHeight: 40.sp, cColor: AppColors.blueContainerColor, text1: 'To', text2: 'Details',),

              ApplicationInfoContainer(cHeight: 80.sp, cColor: AppColors.whiteColor, text1: 'Approval Flow', text2:  inboxLeaveApplicationController.dbData[0].formData.appBody,),


              Text("Approval List ",style: GoogleFonts.poppins(color: AppColors.buttonColor,fontWeight: FontWeight.w500,fontSize: 12.sp),)
              ,
              SizedBox(height: 10.sp,),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: inboxLeaveApplicationController.dbData[0].approvalMembers.length,
                  itemBuilder: (context,index) {
                    return Container(height: 150.sp,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20.sp),
                          border: Border.all(color: AppColors.borderColorGrey)),
                      child: ListView(shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        children: [
                          SizedBox(height: 15.sp,),
                          ApplicationInfoContainer(cHeight: 20.sp, cColor: Colors.transparent, text1: 'Date: ${AppUtils.formatDateForInbox(AppUtils.getTimeFromEpoch(int.parse(inboxLeaveApplicationController.dbData[0].approvalMembers[index].entryTime)))}', text2: 'Status: ${inboxLeaveApplicationController.dbData[0].approvalMembers[index].status}',),
                          Divider(color: AppColors.borderColorGrey,),
                          ApplicationInfoContainer(cHeight: 40.sp, cColor: Colors.transparent, text1: 'Approved By ${inboxLeaveApplicationController.dbData[0].approvalMembers[index].approvedBy}', text2: '    ${inboxLeaveApplicationController.dbData[0].approvalMembers[index].approvalIndex}',),
                          Divider(color: AppColors.borderColorGrey,),
                          ApplicationInfoContainer(cHeight: 20.sp, cColor: Colors.transparent, text1: 'Approval Type', text2: inboxLeaveApplicationController.dbData[0].approvalMembers[index].approvedName,),


                        ],),

                    );
                  }
              ),
              SizedBox(height: 10.sp,)

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
