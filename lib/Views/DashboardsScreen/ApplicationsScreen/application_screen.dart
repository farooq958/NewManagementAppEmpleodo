import 'package:empleado_development/Controller/Cubits/Theme/theme_cubit.dart';
import 'package:empleado_development/Views/DashboardsScreen/ApplicationsScreen/ApplicationType/Leave/leave_details.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/DashboardWidgets/dashboard_utils.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/PageTransitions/slide_page_transition.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          title: Text("Application Type",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: themeState==false?AppColors.greyColor:Colors.white70),),
          leading:
          InkWell(

            onTap: (){
              //context.read<LeaveDetailCubit>().setVisibiity(0);
              Navigator.pop(context);

            },

              child: Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,color:themeState==false?AppColors.greyColor:Colors.white70)))


      ),
      body: Container(
        color: themeState==false?AppColors.greyColor:Colors.black87,
        child: StickyFooterScrollView(footer: veevoCopyRightWidget(), itemBuilder: (context,index){

          return ListView(
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
            children: [
            SizedBox(height: 20.sp,),
              Material(
                color: themeState==false? AppColors.whiteColor:Colors.black38,
                child: InkWell (
             
                    onTap: (){
Navigator.push(context, CustomSlidePageRoute( child: const LeaveDetails() ,direction: AxisDirection.left));

                    },

                    child: ContainerListTileDashBoard(iconPath: AppIcons.applicationTypeLeaveIcon, titleText: "Leave")),
              ),
            ],
          );

        }, itemCount: 1),
      ),

    );
  },
);
  }
}
