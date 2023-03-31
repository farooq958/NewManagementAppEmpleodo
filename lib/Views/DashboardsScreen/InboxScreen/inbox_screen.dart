import 'package:cached_network_image/cached_network_image.dart';
import 'package:empleado_development/Controller/Cubits/Inbox/chat_socket_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Inbox/inbox_stories_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Inbox/socket_connect_cubit.dart';
import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:empleado_development/Model/DashboardModel/dashboard_controller.dart';
import 'package:empleado_development/Model/InboxModel/inbox_stories_model_controller.dart';
import 'package:empleado_development/Views/DashboardsScreen/DashBoardScreen.dart';
import 'package:empleado_development/Views/DashboardsScreen/InboxScreen/InboxDetails/inbox_detail.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:empleado_development/Views/Utils/PageTransitions/scale_page_transition.dart';
import 'package:empleado_development/Views/Utils/PageTransitions/slide_page_transition.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{

        Navigator.pushReplacement(context, CustomSlidePageRoute(child: DashBoardScreen()));
        return true; },
      child: Scaffold(

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

                Navigator.pushReplacement(context, CustomSlidePageRoute(child: DashBoardScreen()));

              },
              child: Center(
                  child: Image.asset(
                AppImages.backButton,
                fit: BoxFit.fitHeight,
                height: 20.sp,
                width: 20.sp,
              )),
            )),
        body: BlocConsumer<InboxStoriesCubit, InboxStoriesState>(
  listener: (context, state) {
      // TODO: implement listener
  },
  builder: (context, storyState) {
      if(storyState is InboxStoriesLoaded) {
        print(inboxStoriesController.stories[0].entryTime);
        return StickyFooterScrollView(
          footer: veevoCopyRightWidget(),
          itemCount: inboxStoriesController.storiesCount,
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
                          Navigator.push(context, ScalePageTransition.scalePageTransition(page:  ChatScreen(ind:index), alignment: Alignment.centerRight));
      //context.read<SocketConnectCubit>().connectSocket(context,inboxStoriesController.stories[index].storyId );


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
                                  height: 45.sp,
                                  width: 45.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.sp),
                                    color: AppColors.blueContainerColor,
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.greenColor,
                                    //backgroundImage:  NetworkImage(dashboardData.personalInfo.dp),
                                    //maxRadius: 100.sp,
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        //dashboardData.personalInfo.dp,
                                        fit: BoxFit.cover,
                                        width: 127.sp,
                                        height: 127.sp,
                                        placeholder: (context, url) => Image.asset('assets/images/placeholder.jpeg'),
                                        errorWidget: (context, url,dynamic) => Image.asset('assets/images/placeholder.jpeg'),
                                        // errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                        //   return Image.asset('assets/images/placeholder.jpeg');
                                        // },
                                        imageUrl: AppUtils.addThumbToImageUrl(dashboardData.personalInfo.dp),
                                      ),
                                    ),
                                  )
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
                                            inboxStoriesController.stories[index].userInfo.dbData.fullName,
                                            style: GoogleFonts.poppins(
                                                color: AppColors.greyColor,
                                                fontWeight: FontWeight.w600),
                                          )))),
                                  Expanded(
                                      child: Align(
                                          alignment: Alignment.topCenter,
                                          child: FittedBox(
                                              child: Text( inboxStoriesController.stories[index].title,
                                                  style: GoogleFonts.poppins(
                                                      color:
                                                          AppColors.greyColor2)))))
                                ],
                              ),
                            ),
                            const Spacer(),
             Padding(
               padding:  EdgeInsets.only(right: 18.0.sp,top: 5.sp),
               child: Column(
                 children: [
                   Text(AppUtils.formatDateForInbox(inboxStoriesController.stories[index].entryTime),style: GoogleFonts.poppins(color: AppColors.greyColor,fontSize: 12.sp),),
                   Icon(Icons.message,color: AppColors.blueContainerColor,),
                 ],
               ),
             )

                          ],
                        ),
                      )),
                  Divider(color: AppColors.borderColorGrey,)
                ]);
          },
        );
      }
      else if (storyState is InboxStoriesLoading)
        {

          return  Center(child: SpinKitWave(
            size: 20.sp,
            color: AppColors.blueContainerColor,

          ));
        }
      else if (storyState is InboxStoriesInternetError)
        {
          return  ListView(

            //shrinkWrap: true,
            children: [
              SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: Center(child: Text(
                  "No Internet",style: GoogleFonts.poppins(fontSize: 25.sp,fontWeight: FontWeight.w600) ,

                )),
              ),
            ],
          );
        }
      else
        {

          return ListView(

            //shrinkWrap: true,
            children: [
              SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: Center(child: Text(
                  "Something went wrong ",style: GoogleFonts.poppins(fontSize: 25.sp,fontWeight: FontWeight.w600) ,

                )),
              ),
            ],
          );
        }
  },
),
      ),
    );
  }
}
