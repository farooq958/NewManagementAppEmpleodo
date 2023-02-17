import 'package:empleado_development/Views/DashboardsScreen/NoticesScreen/notice_detail.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/NoticesWidget/notices_widget.dart';
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

class NoticesScreen extends StatelessWidget {
  const NoticesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text("Notices",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
          leading:
          InkWell(

              onTap: (){

                Navigator.pop(context);
              },
              child: Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,)))


      ),
      body: StickyFooterScrollView(
        itemBuilder: (context,index) {
          return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              InkWell(
                  onTap: (){

                    Navigator.push(context, CustomSlidePageRoute(child: NoticeDetail(noticeTitle: 'to be passed', noticeDate: '2012-10-chek', noticeDescription: 'hello world',)));

                  },
                  child: ContainerListTileNoticeScreen(iconPath: AppIcons.noticesMainPageIcon, titleText: "Notice Title", dateString: '19 may 2020', descriptionString: 'check chcek chcek check chcek chcekcheck chcek chcek', fromDetail: false,)),
              SizedBox(height: 5.sp,)
            ],
          );
        }, footer: veevoCopyRightWidget(), itemCount: 10,
      ),


    );
  }
}
