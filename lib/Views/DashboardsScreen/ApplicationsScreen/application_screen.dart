import 'package:empleado_development/Views/DashboardsScreen/ApplicationsScreen/ApplicationType/Leave/leave_details.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/DashboardWidgets/dashboard_utils.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/PageTransitions/slide_page_transition.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({Key? key}) : super(key: key);

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
          title: Text("Application Type",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
          leading:
          Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,))


      ),
      body: StickyFooterScrollView(footer: veevoCopyRightWidget(), itemBuilder: (context,index){

        return ListView(
          shrinkWrap: true,
          physics:const NeverScrollableScrollPhysics(),
          children: [
          SizedBox(height: 20.sp,),
            InkWell (
              splashFactory: InkRipple.splashFactory,
                splashColor: AppColors.purpleColor.withOpacity(0.2),
                onTap: (){
Navigator.push(context, CustomSlidePageRoute( child: const LeaveDetails() ,direction: AxisDirection.left));

                },

                child: ContainerListTileDashBoard(iconPath: AppIcons.applicationTypeLeaveIcon, titleText: "Leave")),
          ],
        );

      }, itemCount: 1),

    );
  }
}
