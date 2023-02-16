import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StickyFooterScrollView(footer: veevoCopyRightWidget(), itemBuilder: (context,index){


      return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SizedBox(height: 10.sp,),
          UnconstrainedBox(
            child: Container(
height: 150.sp,
              width: 1.sw,
              color: Colors.white,
              child: ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
       SizedBox(
         height: 50.sp,
         width: 1.sw,
         child: Row(
      children: <Widget>[
          Expanded(child:  ListTile(leading: SvgPicture.asset(AppIcons.performanceGoalsIcon),title: Text("Goal Name",style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w600),)


            ,
          trailing: SizedBox(
            height: 50.sp,
            width: 100.sp,
           // color: Colors.pink,
            child: Row(
              children: <Widget>[
                ///Icons.task_alt
                Expanded(child: Icon(Icons.incomplete_circle,color: AppColors.greenColor,)),
                const Expanded(child: FittedBox(child: Text("Completed"))),


              ],
            ),
          ),
          ))

      ]
      ),
       ),
      
                
                
      ],),
              
              ),

            ),
          
          Image.asset("assets/images/dividerAttendanceHistory.png",height: 20.sp,)
        ],
      );

    }, itemCount: 10);
  }
}
