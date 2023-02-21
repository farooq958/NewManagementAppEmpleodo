import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif_view/gif_view.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  WillPopScope(
      onWillPop: () async {
       return true;
      },
      child: Scaffold(


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
            title: Text("Tasks",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
            leading:
            InkWell(
                onTap: (){

                  Navigator.pop(context);
                },
                child: Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,)))


        ),

        body: Column(
          children: [
            Expanded(
              child: Container(height: 1.sh,width: 1.sw,
              color: Colors.white,

              child: ListView(

                physics: 1.sh<600 || 1.sw >500?const BouncingScrollPhysics():const NeverScrollableScrollPhysics(),
                children:  [

                  SizedBox(height: 90.sp,),
Container(
  padding: EdgeInsets.symmetric(horizontal: 20.sp),
  child:     FittedBox(
      child: Text(
 'We have moved the legacy task system to a whole new ',
        style: GoogleFonts.poppins(
            color: AppColors.greyColor,
            fontSize: 28.sp,
            fontWeight: FontWeight.w400),
      ),
  ),

),
                   Center(child: FittedBox(
                     child: Text(
                       'version 2.0',
                      style: GoogleFonts.poppins(
                          color: AppColors.greyColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600),
                  ),
                   ),),
SizedBox(height: 25.sp,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.sp),
                    child:     FittedBox(
                      child: Text(
                        'We are introducing accelerate.'
                        ,
                        style: GoogleFonts.poppins(
                            color: AppColors.buttonColor,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),

                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 44.sp),child: FittedBox(
                    child: Text(
                      'A complete project management tool.'
                      ,
                      style: GoogleFonts.poppins(
                          color: AppColors.greyColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),),
                  SizedBox(height: 60.sp,),
                  SizedBox(
                    height: 200.h,
                    width: 200.w,
                    child: GifView.asset(

                      'assets/images/androidTaskAnimation.gif',
                      fit: BoxFit.fitHeight,
//color: AppColors.primaryColor,

                      frameRate: 20, // default is 15 FPS
                    ),
                  )

,
                  SizedBox(height: 5.sp,),
                  Container(
                    height: 80.sp,
                  margin: EdgeInsets.only(right: 99.sp),
                  //  color: Colors.green,
                    child: Row(
                        children: <Widget>[

Expanded(child: Align(
      alignment: Alignment.centerRight,
      child: Image.asset(AppIcons.taskAccelerateIcon,height: 50.sp,width: 50.sp,))),
                           SizedBox(width: 5.sp,),
                           Expanded(child:  Align(

                               alignment: Alignment.centerLeft,
                               child: FittedBox(child: Text("Open Accelerate",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor,fontSize: 20.sp),))) )



                        ],
                      ),
                  ),
                  ],

              ) ,

              ),
            ),
            veevoCopyRightWidget()
          ],
        ),

      ),
    );
  }
}
