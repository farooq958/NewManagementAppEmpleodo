import 'package:empleado_development/Views/Utils/CustomWidgets/NoticesWidget/notices_widget.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

class NoticeDetail extends StatelessWidget {

  String noticeTitle;
  String noticeDate;
  String noticeDescription;
   NoticeDetail({Key? key,required this.noticeTitle,required this.noticeDate,required this.noticeDescription}) : super(key: key);

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
          title: Text("Notice",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
          leading:
          InkWell(
              onTap: (){

                Navigator.pop(context);
              },
              child: Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,)))


      ),
      body:  StickyFooterScrollView(

        itemBuilder: (context,index) {
          return SizedBox(
            height: 1.sh/1.4,
            width: 1.sw,
            child: Column(
          
              children: [
                Expanded(child: ContainerListTileNoticeScreen(iconPath: AppIcons.noticesMainPageIcon, titleText: noticeTitle, dateString: noticeDate,descriptionString: noticeDescription,fromDetail:true)),
               // SizedBox(height: 5.sp,)
              ],
            ),
          );
        }, footer: veevoCopyRightWidget(), itemCount: 1,
      ),
    );
  }
}
