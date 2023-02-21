import 'package:empleado_development/Controller/Cubits/PerformanceCubit/PerformancePageViewCubit/performance_page_view_cubit.dart';
import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/PerformanceWidgets/performanceDropDownSearch.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/PageTransitions/scale_page_transition.dart';
import 'package:empleado_development/Views/Utils/PageTransitions/slide_page_transition.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_goals_screen.dart';
import 'competency.dart';
import 'feedBack.dart';
import 'goals.dart';
import 'history.dart';


class PerformancePageView extends StatefulWidget {
  const PerformancePageView({Key? key}) : super(key: key);

  @override
  State<PerformancePageView> createState() => _PerformancePageViewState();
}

class _PerformancePageViewState extends State<PerformancePageView> {
  @override
  Widget build(BuildContext context) {
    List<String> items=["Afghanistan", "Albania", "Algeria", "American Samoa",
      "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda",
      "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan"];



    return  BlocConsumer<PerformancePageViewCubit, int>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, pageIndexState) {
    return WillPopScope(
      onWillPop: ()async{

        Navigator.pop(context);
        context.read<PerformancePageViewCubit>().setIndexTopPage(0);
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
      title: Text("Performance",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
      leading:
      InkWell(
          onTap: (){

            Navigator.pop(context);
            context.read<PerformancePageViewCubit>().setIndexTopPage(0);
          },
          child: Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,)))


),
        floatingActionButton: pageIndexState==0?FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: (){

          Navigator.push(context, ScalePageTransition.scalePageTransition(page: const AddGoalsScreen(), alignment: Alignment.centerLeft));


        },
        child:  Center(child: Text("+",style: GoogleFonts.poppins(fontSize: 50.sp,fontWeight: FontWeight.w800,color: AppColors.blueContainerColor),)),
        ):const SizedBox(),
        body:  Container(
        height: 1.sh,
        width: 1.sw,
        color: Colors.white,
        child:

        Column(
        children: [
          ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                //custom app bar
                // Container(
                //   height: 52.sp,
                //   width: 1.sw,
                //   color: AppColors.greyColor,
                //   padding: EdgeInsets.symmetric(horizontal: 30.sp),
                //   child: Row(
                //     children: [
                //       //back arrow button
                //       Expanded(
                //         flex: 1,
                //         child: Container(
                //           height: 52.sp,
                //           color: AppColors.greyColor,
                //           child: InkWell(
                //             highlightColor: Colors.transparent,
                //             splashColor: Colors.transparent,
                //             onTap: () {
                //               // AppControllers.bottomNavigationBarController
                //               //     .jumpToPage(0);
                //             //  context.read<HomeViewDevicePageViewCubit>().topButtonsPageIndex(currentIndex: 0);
                //             },
                //             child: Icon(
                //               Icons.arrow_back_ios,
                //               size: 14.sp,
                //               color: AppColors.greyColor2,
                //             ),
                //           ),
                //         ),
                //       ),
                //
                //       //title
                //       Expanded(
                //         flex: 30,
                //         child: Container(
                //           height: 52.sp,
                //           color: AppColors.greyColor,
                //           alignment: Alignment.center,
                //           child: FittedBox(
                //             child: Text(
                //               'Device Name',
                //               style: GoogleFonts.poppins(
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: 16.sp,
                //                 color: AppColors.greyColor2,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),



                SizedBox(height: 25.71.sp),
///Top row details
               SizedBox(height: 60.sp ,width: 1.sw,
//color: Colors.lightBlue,
child: Row(
  children: <Widget>[
          SizedBox(width: 2.sp,),
          ///profile Pic
          Expanded(
            child: UnconstrainedBox(
              child:  Container(
                height: 50.sp,
                width: 50.sp,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.sp),
                  color: AppColors.blueContainerColor,
                ),

                child: CircleAvatar(
                    backgroundColor: AppColors.greenColor,
                    backgroundImage: const AssetImage("assets/images/face3.jpeg"),
                    maxRadius: 30.sp ),
              ),
            ),
          ),
          SizedBox(width: 2.sp,),
          ///Name and designation
          Expanded(
            flex: 3,
            child: Column(
                            children: <Widget>[

                               Expanded(child: Align(

                                   alignment: Alignment.bottomCenter,
                                   child: FittedBox(child: Text("Muhammad Farooq",style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w600),)))),
                               Expanded(child:  Align(

                                   alignment: Alignment.topCenter,
                                   child: FittedBox(child: Text('Mobile App Engineer',style: GoogleFonts.poppins(color: AppColors.greyColor2)))))

                            ],
                          ),
          ),
const Spacer(),
          ///Green Like button/icon
          Expanded(
            child: Column(
              children: <Widget>[

                Expanded(child:SvgPicture.asset(AppIcons.performanceGreenLikeIcon)),
                Expanded(child:  Text('10',style: GoogleFonts.poppins(color: AppColors.greyColor2)))

              ],
            ),
          ),
          ///Red disike button/icon
          Expanded(
            child: Column(
              children: <Widget>[

                Expanded(child: SvgPicture.asset(AppIcons.performanceRedDislikeIcon)),
                Expanded(child:  Text('2',style: GoogleFonts.poppins(color: AppColors.greyColor2)))

              ],
            ),
          ),
          ///Medal icon yellow
          Expanded(
            child: Column(
              children: <Widget>[

                Expanded(child: SvgPicture.asset(AppIcons.performanceMedalIcon)),
                Expanded(child:  Text('10',style: GoogleFonts.poppins(color: AppColors.greyColor2)))

              ],
            ),
          ),
                      ],
),


               ),
                Divider(
                  color: AppColors.greyColor,
                ),
                ///DropDown  search
                FlutterDropdownSearch(
                  textFieldBorder: InputBorder.none,
                  hintText: "Choose Review Cycle",
                  textController: AppControllers.dropDownController,
                  items: items,
                  dropdownHeight: 200.sp,
                  style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w600)

                ),

SizedBox(height: 10.sp,),
                ///top bar buttons row pages
                SizedBox(
                  height: 50.sp,
                  width: 1.sw,
                  //color: Colors.blue,
                  // padding: EdgeInsets.only(
                  //   left: 24.sp,
                  //   right: 90.sp,
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //goals button
                      Expanded(
                        flex: 1,
                        child: Material(
                          child: InkWell(
                            splashFactory: InkRipple.splashFactory,
                            //focusColor: Colors.red,
                            highlightColor: AppColors.blueContainerColor,
                            //  focusColor: AppColors.purpleColor,
                            splashColor: AppColors.primaryColor,
                            onTap: () {
                              context
                                  .read<PerformancePageViewCubit>()
                                  .setIndexTopPage(0);
                              AppControllers.performanceController.jumpToPage(0);

                            },
                            child: Container(
                              height: 35.sp,
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child:  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        'Goals',
                                        style: GoogleFonts.poppins(
                                          color:pageIndexState==0?AppColors.buttonColor: AppColors.greyColor,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                   Expanded(child: Padding(
                                     padding:  EdgeInsets.symmetric(horizontal: 8.0.sp),
                                     child: pageIndexState==0? Divider(color: AppColors.buttonColor,thickness: 1.5,):const SizedBox(),
                                   ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),



                      //Competency button
                      Expanded(
                        flex: 1,
                        child: Material(
                          child: InkWell(
                            splashFactory: InkRipple.splashFactory,
                            //focusColor: Colors.red,
                            highlightColor: AppColors.blueContainerColor,
                            //  focusColor: AppColors.purpleColor,
                            splashColor: AppColors.primaryColor,
                            onTap: () {
                              // context
                              //     .read<HomeViewDevicePageViewCubit>()
                              //     .topButtonsPageIndex(currentIndex: 1);
                              // AppControllers.homeViewDeviceController.jumpToPage(1);

                              context
                                  .read<PerformancePageViewCubit>()
                                  .setIndexTopPage(1);
                              AppControllers.performanceController.jumpToPage(1);
                            },
                            child: Container(
                              height: 35.sp,
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                              alignment: Alignment.center,
                              child:Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child:  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: FittedBox(
                                        child: Text(
                                          'Competency',
                                          style: GoogleFonts.poppins(
                                            color:pageIndexState==1?AppColors.buttonColor: AppColors.greyColor,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 8.0.sp),
                                    child: pageIndexState==1? Divider(color: AppColors.buttonColor,thickness: 1.5,):const SizedBox(),
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Feedback button
                      Expanded(
                        flex: 1,
                        child: Material(
                          child: InkWell(
                            splashFactory: InkRipple.splashFactory,
                            //focusColor: Colors.red,
                            highlightColor: AppColors.blueContainerColor,
                            //  focusColor: AppColors.purpleColor,
                            splashColor: AppColors.primaryColor,
                            onTap: () {
                              context
                                  .read<PerformancePageViewCubit>()
                                  .setIndexTopPage(2);
                              AppControllers.performanceController.jumpToPage(2);
                              // context
                              //     .read<HomeViewDevicePageViewCubit>()
                              //     .topButtonsPageIndex(currentIndex: 1);
                              // AppControllers.homeViewDeviceController.jumpToPage(1);

                            },
                            child: Container(
                              height: 35.sp,
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child:  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        'FeedBack',
                                        style: GoogleFonts.poppins(
                                          color:pageIndexState==2?AppColors.buttonColor: AppColors.greyColor,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 8.0.sp),
                                    child: pageIndexState==2? Divider(color: AppColors.buttonColor,thickness: 1.5,):const SizedBox(),
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      //History Button
                      Expanded(
                        flex: 1,
                        child: Material(

                          child: InkWell(
                            splashFactory: InkRipple.splashFactory,
                            //focusColor: Colors.red,
                            highlightColor: AppColors.blueContainerColor,
                            //  focusColor: AppColors.purpleColor,
                            splashColor: AppColors.primaryColor,
                            onTap: () {
                              context
                                  .read<PerformancePageViewCubit>()
                                  .setIndexTopPage(3);
                              AppControllers.performanceController.jumpToPage(3);
                              // context
                              //     .read<HomeViewDevicePageViewCubit>()
                              //     .topButtonsPageIndex(currentIndex: 1);
                              // AppControllers.homeViewDeviceController.jumpToPage(1);

                            },
                            child: Container(
                              height: 35.sp,
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(30.sp),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child:  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        'History',
                                        style: GoogleFonts.poppins(
                                          color:pageIndexState==3?AppColors.buttonColor: AppColors.greyColor,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 8.0.sp),
                                    child:pageIndexState==3? Divider(color: AppColors.buttonColor,thickness: 1.5,):const SizedBox(),
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              //  SizedBox(height: 10.sp),
Divider(color: AppColors.greyColor,height: 1.sp,),
                //page view

                //veevoCopyRightWidget()
              ],
            ),
          Expanded(
            child: SizedBox(
              height: 550.sp,
              width: 1.sw,
            //  color: Colors.blue,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: AppControllers.performanceController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (x) {
                  context
                      .read<PerformancePageViewCubit>()
                      .setIndexTopPage(x);
                  // AppControllers.performanceController.jumpToPage(x);
                  // context
                  //     .read<HomeViewDevicePageViewCubit>()
                  //     .topButtonsPageIndex(currentIndex: x);
                },
                children:  const [
                  GoalsScreen(),
                  CompetencyScreen(),

                  FeedbackScreen(),
                  HistoryScreen()

                  //device details content
                  // DeviceDetailsScreen(),
                  //
                  // //device management content
                  // DeviceManagementScreen(),
                ],
              ),
            ),
          ),

        ],
      )

      ),

      ),
    );
  },
);
  }
}
