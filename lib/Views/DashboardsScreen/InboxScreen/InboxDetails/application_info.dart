import 'package:empleado_development/Controller/Cubits/Inbox/inbox_application_detail_page_view_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Inbox/inbox_application_details_cubit.dart';
import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:empleado_development/Model/InboxModel/inbox_stories_model_controller.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import 'LeaveRequestDetail/LeaveApplicationView.dart';
import 'LeaveRequestDetail/LeaveRequestLeaveView.dart';

class ApplicationInfo extends StatelessWidget {
  final bool type;
  const ApplicationInfo({Key? key,required this.type}) : super(key: key);

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
          InkWell(

              onTap: (){

                Navigator.pop(context);
              },
              child: Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,)))


      ),
      body: type==true?
      BlocConsumer<InboxApplicationDetailsCubit, InboxApplicationDetailsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {

    if(state is InboxApplicationDetailsLoaded) {
      return ListView(

        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        children: [

          ApplicationInfoContainer(cHeight: 40.sp, cColor: AppColors.blueContainerColor, text1: 'From', text2: 'Dated',),
          ApplicationInfoContainer(cHeight: 80.sp, cColor: AppColors.whiteColor, text1: inboxTimeAdjustmentController.dbData[0].userName, text2:AppUtils.formatDateForInbox(AppUtils.getTimeFromEpoch(inboxTimeAdjustmentController.dbData[0].entryTime))  ,)
          ,
      ApplicationInfoContainer(cHeight: 40.sp, cColor: AppColors.blueContainerColor, text1: 'Emp Id', text2: 'Subject',),

      ApplicationInfoContainer(cHeight: 80.sp, cColor: AppColors.whiteColor, text1: inboxTimeAdjustmentController.dbData[0].formData.empId, text2: "Time Adjustment",),

          ApplicationInfoContainer(cHeight: 40.sp, cColor: AppColors.blueContainerColor, text1: 'To', text2: 'Details',),

          ApplicationInfoContainer(cHeight: 80.sp, cColor: AppColors.whiteColor, text1: 'Approval Flow', text2: inboxTimeAdjustmentController.dbData[0].formData.reason,),
      
          Text("Requested Time Adjustment: ${inboxTimeAdjustmentController.dbData[0].formData.date} ",style: GoogleFonts.poppins(color: AppColors.buttonColor,fontWeight: FontWeight.w500),)
,SizedBox(height: 15.sp,),
          ApplicationInfoContainer(cHeight: 40.sp, cColor: AppColors.blueContainerColor, text1: 'In Time', text2: 'Out Time',),

          ApplicationInfoContainer(cHeight: 80.sp, cColor: AppColors.whiteColor, text1: inboxTimeAdjustmentController.dbData[0].formData.inTime, text2: inboxTimeAdjustmentController.dbData[0].formData.outTime)
      ,SizedBox(height: 15.sp,),
          Text("Approval List ",style: GoogleFonts.poppins(color: AppColors.buttonColor,fontWeight: FontWeight.w500,fontSize: 12.sp),)
,
          SizedBox(height: 10.sp,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: inboxTimeAdjustmentController.dbData[0].approvalMembers.length,
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
                  ApplicationInfoContainer(cHeight: 20.sp, cColor: Colors.transparent, text1: 'Date: ${AppUtils.formatDateForInbox(AppUtils.getTimeFromEpoch(int.parse(inboxTimeAdjustmentController.dbData[0].approvalMembers[index].entryTime)))}', text2: 'Status: ${inboxTimeAdjustmentController.dbData[0].approvalMembers[index].status}',),
Divider(color: AppColors.borderColorGrey,),
                  ApplicationInfoContainer(cHeight: 40.sp, cColor: Colors.transparent, text1: 'Approved By ${inboxTimeAdjustmentController.dbData[0].approvalMembers[index].approvedBy}', text2: '    ${inboxTimeAdjustmentController.dbData[0].approvalMembers[index].approvalIndex}',),
                  Divider(color: AppColors.borderColorGrey,),
                  ApplicationInfoContainer(cHeight: 20.sp, cColor: Colors.transparent, text1: 'Approval Type', text2: inboxTimeAdjustmentController.dbData[0].approvalMembers[index].approvedName,),


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
):const LeaveRequestView()
    );
  }
}

class LeaveRequestView extends StatelessWidget {
  const LeaveRequestView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     SizedBox(

      height: 1.sh,
      width: 1.sw,

      child: Column(

        children: [
          BlocConsumer<InboxApplicationDetailPageViewCubit, int>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, pageIndex) {
    return Container(
            height: 50.sp,
            width: 1.sw,
margin: EdgeInsets.only(left: 20.sp,right: 20.sp),
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(10.sp)
  
),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TouchableOpacity(
                    onTap: ()
                    {
                      if(pageIndex!=0) {
                        context.read<InboxApplicationDetailPageViewCubit>().setPageIndex(0);
                        AppControllers.inboxLeavePageViewController.jumpToPage(0);
                      }

                    },

                    child: Container(
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.only(topLeft:Radius.circular(10.sp),bottomLeft:Radius.circular(10.sp)),
                          color:pageIndex==0? AppColors.blueContainerColor:AppColors.whiteColor
                      )
                      ,child: Center(child: Text("Application",style: GoogleFonts.poppins(color: pageIndex==0? AppColors.whiteColor:AppColors.blackColor87,fontWeight: FontWeight.w600),),),),
                  ),
                ),
                 Expanded(child: TouchableOpacity(

                   onTap:(){
                     print(pageIndex);
                     if(pageIndex!=1) {
                       context.read<InboxApplicationDetailPageViewCubit>().setPageIndex(1);
                       AppControllers.inboxLeavePageViewController.jumpToPage(1);
                     }


                   },
                   child: Container(  decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(topRight:Radius.circular(10.sp),bottomRight:Radius.circular(10.sp)),
                       color:pageIndex==1?AppColors.blueContainerColor: AppColors.whiteColor
                   ),child: Center(child: Text("Request Leave",style: GoogleFonts.poppins(color:pageIndex==1?AppColors.whiteColor: AppColors.blackColor87,fontWeight: FontWeight.w600)),),),
                 )),

              ],
            ),

          );
  },
),
          SizedBox(height: 10.sp,),
           Expanded(
             flex: 2,
             child: PageView(
               onPageChanged: (x)
               {
                 context.read<InboxApplicationDetailPageViewCubit>().setPageIndex(x);
               },
               scrollDirection: Axis.horizontal,
              controller: AppControllers.inboxLeavePageViewController,

              children: const [

                LeaveApplicationView(),
                LeaveRequestLeaveView()

              ],
          ),
           ),
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
    Expanded(child: Text(text1,style: GoogleFonts.poppins(color: AppColors.blackColor87,fontWeight: FontWeight.w400,fontSize: 14.sp),)),
    SizedBox(
        height: 30.sp,
        child: VerticalDivider(color: AppColors.greyColor,width: 10,)),
     Expanded(child: SingleChildScrollView(child: Text(text2,style: GoogleFonts.poppins(color: AppColors.blackColor87,fontWeight: FontWeight.w400,fontSize: 14.sp),))),

  ],
),
    );
  }
}
