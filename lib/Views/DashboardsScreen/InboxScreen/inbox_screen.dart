import 'package:empleado_development/Views/DashboardsScreen/InboxScreen/InboxDetails/inbox_detail.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/PageTransitions/scale_page_transition.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: AppColors.blueContainerColor,

            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          backgroundColor: AppColors.primaryColor,
          // automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            "Inbox",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, color: AppColors.greyColor),
          ),
          leading: InkWell(
            onTap: (){

              Navigator.pop(context);

            },
            child: Center(
                child: Image.asset(
              AppImages.backButton,
              fit: BoxFit.fitHeight,
              height: 20.sp,
              width: 20.sp,
            )),
          )),
      body: StickyFooterScrollView(
        footer: veevoCopyRightWidget(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SizedBox(
                  height: 20.sp,
                ),
                SizedBox(
                    height: 60.sp,
                    width: 1.sw,
//color: Colors.lightBlue,
                    child: MaterialButton(
                      onPressed: (){
                        ///inbox detail navigation
                        Navigator.push(context, ScalePageTransition.scalePageTransition(page: const ChatScreen(), alignment: Alignment.centerRight));


                      },
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 2.sp,
                          ),

                          ///profile Pic
                          Expanded(
                            child: UnconstrainedBox(
                              child: Container(
                                height: 50.sp,
                                width: 50.sp,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.sp),
                                  color: AppColors.blueContainerColor,
                                ),
                                child: CircleAvatar(
                                    backgroundColor: AppColors.greenColor,
                                    backgroundImage: const AssetImage(
                                        "assets/images/face3.jpeg"),
                                    maxRadius: 30.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.sp,
                          ),

                          ///Name and Type
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: FittedBox(
                                            child: Text(
                                          "Muhammad Farooq Khan",
                                          style: GoogleFonts.poppins(
                                              color: AppColors.greyColor,
                                              fontWeight: FontWeight.w600),
                                        )))),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: FittedBox(
                                            child: Text('Time Adjustment',
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        AppColors.greyColor2)))))
                              ],
                            ),
                          ),
                          const Spacer(),
           Padding(
             padding:  EdgeInsets.only(right: 18.0.sp),
             child: Icon(Icons.message,color: AppColors.blueContainerColor,),
           )

                        ],
                      ),
                    )),
                Divider(color: AppColors.borderColorgrey,)
              ]);
        },
      ),
    );
  }
}
