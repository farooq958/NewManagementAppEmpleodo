import 'package:empleado_development/Controller/Cubits/DashboardCubits/animation_scale_dart_cubit.dart';
import 'package:empleado_development/Controller/Cubits/DashboardCubits/date_picking_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Theme/theme_cubit.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:empleado_development/Views/DashboardsScreen/AttendenceDetailScreen/attendance_history_screen.dart';
import 'package:empleado_development/Views/DashboardsScreen/HrPolicyScreen/hr_policy_screen.dart';
import 'package:empleado_development/Views/DashboardsScreen/InboxScreen/inbox_screen.dart';
import 'package:empleado_development/Views/DashboardsScreen/NoticesScreen/notices.dart';
import 'package:empleado_development/Views/DashboardsScreen/NotifcationScreen/notification_screen.dart';
import 'package:empleado_development/Views/DashboardsScreen/PayRollScreen/pay_roll_screen.dart';
import 'package:empleado_development/Views/DashboardsScreen/PerformanceScreen/performance_page_view.dart';
import 'package:empleado_development/Views/DashboardsScreen/TasksScreen/task_screen.dart';
import 'package:empleado_development/Views/LoginScreen/login_screen1.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/DashboardWidgets/dashboard_utils.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/imagePicked.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:empleado_development/Views/Utils/PageTransitions/scale_page_transition.dart';
import 'package:empleado_development/Views/Utils/PageTransitions/slide_page_transition.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Model/attendencemodel.dart';
import 'ApplicationsScreen/application_screen.dart';
import 'AttendenceDetailScreen/attendance_details_screen.dart';
import 'TimeAdjustmentScreen/time_adjustment_screen.dart';

enum MenuItem { logout }

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int checkWill=0;

    final List<Attendance> chartData = [
      Attendance( day: 1, hours: 9),
      Attendance( day: 2, hours: 8),
      Attendance( day: 3, hours: 6),
      Attendance( day: 4, hours: 5),
      Attendance( day: 5, hours: 7),
      Attendance( day: 6, hours: 7),
      Attendance( day: 7, hours: 8),
      Attendance( day: 8, hours: 6),
      Attendance( day: 9, hours: 3),
      Attendance( day: 10, hours: 2),
      Attendance( day: 11, hours: 3),
      Attendance( day: 12, hours: 1),
      Attendance( day: 13, hours: 8),
      Attendance( day: 14, hours: 2),
      Attendance( day: 15, hours: 4),
      Attendance( day: 16, hours: 7),
      Attendance( day: 17, hours: 8),
      Attendance( day: 18, hours: 6),
      Attendance( day: 19, hours: 5),
      Attendance( day: 20, hours: 7),
      Attendance( day: 21, hours: 7),
      Attendance( day: 22, hours: 8),
      Attendance( day: 23, hours: 6),
      Attendance( day: 24, hours: 5),
      Attendance( day: 25, hours: 7),
      Attendance( day: 26, hours: 7),
      Attendance( day: 27, hours: 8),
      Attendance( day: 28, hours: 6),
      Attendance( day: 29, hours: 5),
      Attendance( day: 30, hours: 7),
      Attendance( day: 31, hours: 7),



    ];
    print("device heigth"+2.sh.toString());
   // ScrollController scrollController=ScrollController(initialScrollOffset: 0.0);
    return  BlocListener<ThemeCubit, bool>(
  listener: (context, state) {
    if(state == true)
      {
        AppUtils.showCustomSnackBar(context: context, message: "Note: Dark Theme is in Beta Mode ");
      }
    // TODO: implement listener
  },
  child: BlocBuilder<ThemeCubit, bool>(
  builder: (context, themeState) {
    return WillPopScope(
      onWillPop: () async {
        if(Repository.onWillCheck==0)
          {
            AppUtils.showCustomSnackBar(context: context, message: "Press Again To Exit");
           Repository.onWillPopCheck(1);
          return false;
          }
        else
          {
            return true;
          }

        //return false;
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
          backgroundColor: themeState==false?AppColors.primaryColor:Colors.black87,
          title: Row(
            children: [
              Flexible(
                  flex:0,child:  Align(
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: CircleAvatar(
                    maxRadius: 15.sp,
                    backgroundImage: const AssetImage("assets/images/playStoreIcon.png"),
                  ),
                ),
              )),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'E',
                            style: GoogleFonts.poppins(
                                color: AppColors.buttonColor,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: 'MPLEADO',
                            style: GoogleFonts.poppins(
                                color: themeState==false?AppColors.greyColor:AppColors.whiteColor,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
          actions: [

                 InkWell(
                   onTap: (){
                     if (themeState==true) {
                       context.read<ThemeCubit>().switchTheme(false);
                     }
                     else {
                       context.read<ThemeCubit>().switchTheme(true);
                     }
                   },
                   child: Icon(
            themeState==true
            ? Icons.mode_night_outlined
            : Icons.sunny,
color: themeState==false?AppColors.yellowColor:Colors.white70,
                ),
                 )
              ,
            SizedBox(width: 15.sp,),
            InkWell(
                onTap: () {
                  debugPrint("messageTapped");
                  //context.read<ThemeCubit>().switchTheme(false);
                  Navigator.push(context, ScalePageTransition.scalePageTransition(page: const InboxScreen(), alignment: Alignment.topCenter));

                },
                child: Icon(
                  Icons.message_sharp,
                  color: AppColors.buttonColor,
                )),
            SizedBox(
              width: 20.sp,
            ),
            InkWell(
                onTap: () {
                  debugPrint("BellTapped");
                 // context.read<ThemeCubit>().switchTheme(false);
                  Navigator.push(context, CustomSlidePageRoute(child: const NotificationScreen(),direction: AxisDirection.down));
                },
                child: SvgPicture.asset(AppIcons.bellMainPageIcon)),
            PopupMenuButton(
              padding: EdgeInsets.zero,
              position: PopupMenuPosition.under,
              color: Colors.white,
              elevation: 0,
              offset: Offset(-25.sp, -140.sp),
              constraints: BoxConstraints(
                  minWidth: 130.sp,
                  maxWidth: 200.sp,
                  minHeight: 20.sp,
                  maxHeight: 40.sp),
              enabled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.sp),
                side: BorderSide(
                  width: 1.sp,
                  color: AppColors.greyColor,
                  style: BorderStyle.solid,
                ),
              ),
              onSelected: (value) {
                if(value==MenuItem.logout)
                  {
///logout logic handling here ///
                    context.read<ThemeCubit>().switchTheme(false);
                   Navigator.pushReplacement(context, ScalePageTransition.scalePageTransition(page: const LoginScreen1(), alignment: Alignment.bottomLeft));
                  }
                // if (value == MenuItem.favourite) {
                //
                //   context.read<RemoveFavouriteCubit>().removeFavouriteDeviceFunc(favouriteDevices.favouriteDevices[index].id);
                //
                //   setState(() {
                //     favouriteDevices.favouriteDevices.remove(favouriteDevices.favouriteDevices[index]);
                //
                //   });
                // }
                // else if (value == MenuItem.devices) {
                //   context.read<DropDownButtonCubit>().category('Devices');
                // } else if (value == MenuItem.places) {
                //   context.read<DropDownButtonCubit>().category('Places');
                // } else if (value == MenuItem.devicesGroups) {
                //   context.read<DropDownButtonCubit>().category('Device Groups');
                // }
              },
              icon: Icon(
                Icons.more_vert_rounded,
                color: AppColors.buttonColor,
                size: 30.sp,
              ),
              itemBuilder: (context) => [
                //logout
                PopupMenuItem(
                  value: MenuItem.logout,
                  padding: EdgeInsets.only(left: 5.sp),
                  height: 30.sp,
                  textStyle: GoogleFonts.roboto(
                    color: AppColors.greyColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  child: Text(
                    "LogOut",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, color: AppColors.greyColor),
                  ),
                ),
              ],
            )
          ],
        ),
        body:


                 //dummy list will be change for api



      // BlocListener<AnimationScaleDartCubit, double>(
      // listener: (context, state) {
      // if (state == 0.7) {
      // Future.delayed(const Duration(milliseconds: 100)).then(
      // (value) => context
      //     .read<AnimationScaleDartCubit>()
      //     .transformWidget(1.0));
      // }
      // if (state == 0.8) {
      // Future.delayed(const Duration(milliseconds: 500)).then(
      // (value) => context
      //     .read<AnimationScaleDartCubit>()
      //     .transformWidget(1.0));
      // }
      // // TODO: implement listener
      // },)

                   StickyFooterScrollView(
                    itemBuilder: (context,index) {
                      return  ListView(
                        shrinkWrap: true,
                          //    controller: scrollController,
physics:const NeverScrollableScrollPhysics(),
                        children: [
                           Container(
                             width: 1.sw,
                             height: 1.sh/3.6,
                             decoration:  BoxDecoration(
                               border:Border.all(color: Colors.transparent),
                   color: themeState==false?Colors.transparent:Colors.black87,
                               image: const DecorationImage(image: AssetImage(AppImages.dashboardBackgroundImage))
,
                              // color: Colors.red
                             ),


                             child: ListView(
                               physics: const NeverScrollableScrollPhysics(),
                              children: [
                                UnconstrainedBox(
                                  child:  Container(
                                    height: 130.sp,
                                    width: 130.sp,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.sp),
                                      color: AppColors.blueContainerColor,
                                    ),

                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(40.sp),
                                      onTap: (){
                                      //  context.read<ThemeCubit>().switchTheme(false);
                                        Navigator.push(context, ScalePageTransition.scalePageTransition(page: const ImagePickerWidget(imagePath:"assets/images/face3.jpeg"), alignment: Alignment.centerLeft));
                                       // print("profile tapeed");
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.greenColor,
                                        backgroundImage: const AssetImage("assets/images/face3.jpeg"),
                                        maxRadius: 100.sp,
                                        //child: Image.asset("assets/images/face2.jpeg",fit: BoxFit.fitWidth,)
                                        ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.sp,),
                                 Center(child: Text("Muhammad Farooq Khan",style: GoogleFonts.poppins(color: AppColors.blueContainerColor,fontWeight: FontWeight.w600))),


                                 Center(child: Text("Mobile App Engineer,DevAPPSSDSA",style: GoogleFonts.poppins(color:themeState==false? AppColors.greyColor2:Colors.white70,fontWeight: FontWeight.w500))),
                                 Center(child: Text(" for 2 years and 1 Month",style: GoogleFonts.poppins(color: themeState==false?AppColors.greyColor2:Colors.white70,fontWeight: FontWeight.w500))),
                              ],
                          ),
                           ),



                           Container(
                             height: 1.sh<750.0?2.0.sh-(1.sh/3):1.sw>430.0?1.9.sh-(1.sh/3):1.689.sh-(1.sh/3),
                             width: 1.sw,
color: themeState==false?Colors.transparent:Colors.black87,
                             child: Stack(
                               children: [
                                 Positioned(
                                     top: 50.sp,
                                     left: 0,
                                     right: 0,
                                     bottom: 0,
                                     child: Container(
                                       width: 1.sw,
                                       height: 1.sh,
                                       decoration: BoxDecoration(
                                           color: themeState==false?Colors.white:Colors.black87,
                                           borderRadius: BorderRadius.only(
                                               topLeft: Radius.circular(40.sp),
                                               topRight: Radius.circular(40.sp)),
                                           boxShadow:  [
                                           BoxShadow(
                                           color: AppColors.greyColor2.withOpacity(0.5), //New
                                           blurRadius: 70.0.sp,
                                           offset: const Offset(0, -10))
                                       ],
                                       ),
                                       child: ListView(
                                         physics:
                                             const NeverScrollableScrollPhysics(),
                                         children: [
                                           SizedBox(
                                             height: 70.sp,
                                           ),
                                           Container(
                                             width: 1.sw,
                                             height: 70.sp,
                                             color: themeState==false?Colors.white:Colors.black87,
                                             child: Row(
                                               mainAxisAlignment:
                                                   MainAxisAlignment.spaceEvenly,
                                               children: <Widget>[
                                                  Expanded(
                                                   child: BuildColumnDashboard(
                                                     firstString: 'Current Status',
                                                     secondString: 'Signed In',
                                                     theme:themeState
                                                   ),
                                                 ),
                                                 Flexible(
                                                     child: SizedBox(
                                                   width: 20.sp,
                                                   child: RotationTransition(
                                                       turns:
                                                           const AlwaysStoppedAnimation(
                                                               90 / 360),
                                                       child: Divider(
                                                         color: AppColors.greyColor2,
                                                       )),
                                                 )),
                                                  Expanded(
                                                   child: BuildColumnDashboard(
                                                     firstString: 'Working Status',
                                                     secondString: 'Duty Time',
                                                       theme:themeState
                                                   ),
                                                 ),
                                                 Flexible(
                                                   flex: 0,
                                                     child: SizedBox(
                                                       //color: Colors.grey,
                                                   width: 20.sp,
                                                   //height: 1.sp,
                                                   child: RotationTransition(
                                                       turns:
                                                           const AlwaysStoppedAnimation(
                                                               90 / 360),
                                                       child: Divider(
                                                         color: AppColors.greyColor2,
                                                       )),
                                                 )),
                                                  Expanded(
                                                   child: BuildColumnDashboard(
                                                     firstString: 'Login Time',
                                                     secondString: '9:30',
                                                       theme:themeState
                                                   ),
                                                 )
                                               ],
                                             ),
                                           ),
                                           SizedBox(
                                             height: 15.sp,
                                           ),
                                             Padding(
                                               padding:  EdgeInsets.symmetric(horizontal: 10.0.sp),
                                               child: Text("Attendance History",style: GoogleFonts.poppins(
                                                   color: themeState==false?AppColors.greyColor:Colors.white70,
                                                   fontWeight: FontWeight.w600,fontSize: 18.sp),),
                                             ),
                                           SizedBox(
                                             height: 10.sp,
                                           ),
                                            Center(
                                              child: SizedBox(
                                                height: 55.sp,
                                                width: 1.sw / 1.9,
                                              //   decoration: BoxDecoration(
                                              //
                                              //   borderRadius:
                                              //       BorderRadius.circular(2.sp),
                                              //   color: AppColors.primaryColor,
                                              // ),
                                                child:  ElevatedButton(
style: ButtonStyle(
  
  backgroundColor:themeState== false? MaterialStateProperty.all(AppColors.primaryColor):MaterialStateProperty.all(AppColors.blueContainerColor)
),
                                                  onPressed: () {
                                                    //context.read<ThemeCubit>().switchTheme(false);
                                                    Navigator.push(context, ScalePageTransition.scalePageTransition(page: const AttendanceHistoryScreen(), alignment: Alignment.center));

                                                    },
                                                  child: Center(
                                                  child: FittedBox(
                                                      child: Text(
                                                    "Last 30 days",
                                                    style: GoogleFonts.poppins(
                                                        color: themeState==false?AppColors.greyColor:Colors.white70,
                                                        fontWeight: FontWeight.w400),
                                                  )),
                                                ),
                                                ),
                                              ),
                                            ),
                                           SizedBox(
                                             height: 20.sp,
                                           ),
                                           BlocConsumer<DatePickingCubit, DateTime>(
  listener: (context, dateTimeAdjustedListener) {
      // TODO: implement listener
  },
  builder: (context, dateTimeAdjusted) {
      return UnconstrainedBox(
                                             child: Container(
                                               height: 1.sh<750? 1.sh / 1.7:1.sh/2.05,  //2.03
                                               width: 1.sw / 1.1,
                                               decoration: BoxDecoration(
                                                   color: themeState==false?AppColors.primaryColor:AppColors.greyColor2,
                                                   borderRadius:
                                                       BorderRadius.circular(30.sp)),
                                               child: ListView(
                                                 physics:
                                                     const NeverScrollableScrollPhysics(),
                                                 children: [
                                                   SizedBox(
                                                     height: 30.sp,
                                                   ),
                                                   Row(
                                                     children: <Widget>[
                                                       Expanded(
                                                           child: Padding(
                                                         padding: EdgeInsets.only(
                                                             left: 20.0.sp),
                                                         child: Text(
                                                           "Attendance",
                                                           style:
                                                               GoogleFonts.poppins(
                                                                   fontWeight:
                                                                       FontWeight
                                                                           .w700,
                                                                   color:themeState==false? AppColors
                                                                       .greyColor:Colors.white70),
                                                         ),
                                                       )),
                                                       Expanded(
                                                           child: InkWell(
                                                         onTap: () {
                                                           // BottomPicker.date(title: "Date Picked",onSubmit: (value){print(value);},).show(context);

                                                           DatePicker.showPicker(
                                                               context,
                                                               pickerModel:
                                                                   CustomMonthPicker(
                                                                 minTime: DateTime(
                                                                     2010, 1, 1),
                                                                 maxTime:
                                                                     DateTime.now(),
                                                                 currentTime:
                                                                     DateTime.now(),
                                                               ), onConfirm:
                                                                   (dateValue) {
                                                             context
                                                                 .read<
                                                                     DatePickingCubit>()
                                                                 .adjustDate(
                                                                     dateValue);
                                                             print(dateValue);
                                                           });
                                                         },
                                                         child: Padding(
                                                           padding: EdgeInsets.only(
                                                               left: 20.0.sp,
                                                               right: 20.sp),
                                                           child: Align(
                                                               alignment: Alignment
                                                                   .centerRight,
                                                               child: Container(
                                                                 height: 40.sp,
                                                                 decoration: BoxDecoration(
                                                                     color:themeState==false? AppColors
                                                                         .primaryColor:AppColors.blueContainerColor,
                                                                     border: Border.all(
                                                                         color: AppColors
                                                                             .greyColor2),
                                                                     borderRadius:
                                                                         BorderRadius
                                                                             .circular(
                                                                                 10.sp)),
                                                                 child: Center(
                                                                     child: FittedBox(
                                                                         child: Text(
                                                                   "${AppUtils.getString(dateTimeAdjusted.month)}-${dateTimeAdjusted.year}",
                                                                   style: GoogleFonts.poppins(
                                                                       fontWeight:
                                                                           FontWeight
                                                                               .w400,
                                                                       color: themeState==false?AppColors
                                                                           .greyColor:Colors.white70,
                                                                       fontSize:
                                                                           15.sp),
                                                                 ))),
                                                               )),
                                                         ),
                                                       ))
                                                     ],
                                                   ),
                                                   SizedBox(height: 20.sp,),
                                                   SfCartesianChart(
                                                    // margin: EdgeInsets.symmetric(horizontal: 0),

// legend: Legend(
//   alignment: ChartAlignment.near,
//  // overflowMode: LegendItemOverflowMode.scroll,
//     isVisible: true,
//     position: LegendPosition.top,
//     legendItemBuilder: (string,series,point,index){
//       return  Container(
//
//         color: Colors.yellow,
//         height: 30.sp,width: 50.sp,child: FittedBox(child: Text(" ${string}")),);
//
//
//     }
//
// ),
                                                     primaryXAxis: NumericAxis(
                                                         labelStyle: GoogleFonts.poppins(color: themeState==false?AppColors.greyColor2:Colors.white70),
                                                       interval: 5,
                                                       title: AxisTitle(text: "Month Days"
                                                           ,textStyle:
                                                           GoogleFonts.poppins(color: themeState==false?AppColors.greyColor:Colors.white70,fontWeight: FontWeight.w500,fontSize: 14.sp)),
                                                       minimum: 0
                                                           ,
                                                       maximum: 32
                                                     ),
                                                       primaryYAxis: NumericAxis(

                                                           title: AxisTitle(


                                                               text: "Hours",textStyle:
                                                           GoogleFonts.poppins(color:themeState==false? AppColors.greyColor:Colors.white70,fontWeight: FontWeight.w500,fontSize: 14.sp)),
                                                         labelStyle: GoogleFonts.poppins(color: themeState==false?AppColors.greyColor2:Colors.white70),
                                                         minimum: 0,
                                                         maximum: 10
                                                       ),
                                                       plotAreaBorderColor: themeState==false?AppColors.greyColor:Colors.black87,
 plotAreaBackgroundColor: themeState==false?AppColors.primaryColor:AppColors.greyColor2,
                                                       series: <ChartSeries<Attendance, int>>[
                                                         // Renders column chart
                                                         ColumnSeries<Attendance ,int>(
                                                         //  isTrackVisible: true,
                                                           trackColor: themeState==false?AppColors.greyColor2:Colors.white70,

                                                           borderWidth:2,


borderColor:themeState==false? AppColors.primaryColor:Colors.transparent,
                                                           color: AppColors.blueContainerColor,
                                                           width: 0.7.sp,
                                                             dataSource: chartData,
                                                             xValueMapper: (Attendance data, _) => data.day,
                                                             yValueMapper: (Attendance data, _) => data.hours
,
                                                       pointColorMapper: (Attendance data, _) => data.hours<=3?AppColors.redColor:data.hours<=6?AppColors.yellowColor:AppColors.greenColor,
                                                       markerSettings:  MarkerSettings(
                                                         borderColor:  AppColors.purpleColor,
                                                       isVisible: true,
                                                       color: AppColors.primaryColor,
                                                       // Marker shape is set to diamond
                                                       shape: DataMarkerType.circle
                                                   )
                                                         ),

                                                       ]
                                                   ),
                                                   //SizedBox(height: 5.sp,),



                                                 ],
                                               ),
                                             ),
                                           );
  },
),
                                           SizedBox(height: 10.sp,),
                                           Row(
                                             children: [
                                               SizedBox(width: 6.sp,),
                                               Expanded(
                                                 flex: 2,
                                                   child:  Align(
                                                 child: SizedBox(
                                                   height: 40.sp,
                                                   width: 120.sp,
                                                   // decoration:BoxDecoration(color: AppColors.primaryColor,borderRadius: BorderRadius.circular(20.sp)),
                                                   child: ElevatedButton(
                                                     style:   ButtonStyle(
                                                         backgroundColor:themeState== false? MaterialStateProperty.all(AppColors.primaryColor):MaterialStateProperty.all(AppColors.blueContainerColor)


                                                     ),
                                                     // splashFactory: InkRipple.splashFactory,
                                                     // hoverColor: AppColors.purpleColor,
                                                     // highlightColor: AppColors.buttonColor.withOpacity(0.6),
                                                     // splashColor: AppColors.buttonColor,
                                                     onPressed: (){
                                                       debugPrint("Application");
                                                       //context.read<ThemeCubit>().switchTheme(false);
                                                       Navigator.push(context, ScalePageTransition.scalePageTransition(page: const ApplicationScreen(), alignment: Alignment.centerLeft));


                                                     },
                                                     child:  FittedBox(child: Text("Applications",
                                                     style: GoogleFonts.poppins(color:themeState== false? AppColors.greyColor:Colors.white70),)),
                                                   ),
                                                 ),
                                               )),
                                               SizedBox(width: 3.sp,),
                                               Expanded(
                                                   flex:3,child: Align(
                                                 child: SizedBox(
                                                   height: 40.sp,
                                                   width: 300.sp,

                                                   child: ElevatedButton(
                                                     style:   ButtonStyle(
                                                         backgroundColor:themeState== false? MaterialStateProperty.all(AppColors.primaryColor):MaterialStateProperty.all(AppColors.blueContainerColor)


                                                     ),
                                                     onPressed: (){
                                                      // context.read<ThemeCubit>().switchTheme(false);
                                                       debugPrint("Time Adjustment tap");
                                                       Navigator.push(context, ScalePageTransition.scalePageTransition(page: const TimeAdjustmentScreen(), alignment: Alignment.centerLeft));

                                                     },
                                                     child: FittedBox(child: Text("Time Adjustment",  style: GoogleFonts.poppins(color: themeState==false? AppColors.greyColor:Colors.white70,fontSize: 14.sp))),
                                                   ),
                                                 ),
                                               )),
                                               SizedBox(width: 3.sp,),
                                               Expanded(
                                                   flex: 2,
                                                   child: Align(
                                                     child: SizedBox(
                                                       height: 40.sp,
                                                       width: 120.sp,

                                                       child: ElevatedButton(
                                                         style:   ButtonStyle(
                                                             backgroundColor:themeState== false? MaterialStateProperty.all(AppColors.primaryColor):MaterialStateProperty.all(AppColors.blueContainerColor)


                                                         ),
                                                         onPressed: (){
                                                          // context.read<ThemeCubit>().switchTheme(false);
                                                           debugPrint("View Details");
                                                           Navigator.push(context, ScalePageTransition.scalePageTransition(page: const AttendanceDetailsScreen(), alignment: Alignment.centerLeft));

                                                         },
                                                         child: FittedBox(child: Text("View Details",  style: GoogleFonts.poppins(color:themeState==false? AppColors.greyColor:Colors.white70,fontSize: 14.sp))),
                                                       ),
                                                     ),
                                                   )),
                                               SizedBox(width: 3.sp,),
                                             ],
                                           ),
                                           SizedBox(height: 15.sp,),

                                           Padding(
                                             padding:  EdgeInsets.only(left: 30.0.sp),
                                             child: Row(children: [
                                               Expanded(child: RowWidgetDashboard2(value: '120', textToShow: 'Earned\nHours',),
                                                 ),
                                               Flexible(
                                                   flex: 1,
                                                   child: SizedBox(
                                                   //  height: 20.sp,
                                                     width: 50.sp,
                                                     child: RotationTransition(
                                                       turns: const AlwaysStoppedAnimation(90/360),
                                                       child: Divider(
height: 1.sp,
                                                 thickness: 1,
                                                 color: AppColors.greyColor2,
                                               ),
                                                     ),
                                                   )),
                                               Expanded(child: RowWidgetDashboard2(value: '120', textToShow: 'Total\nAbsentees',),
                                               ),

                                             ],),
                                           ),
                                           SizedBox(height: 5.sp,),
                                           Padding(
                                             padding:  EdgeInsets.only(left: 30.0.sp),
                                             child: Row(children: [
                                               Expanded(child: RowWidgetDashboard2(value: '210', textToShow: 'Allowed\nLateMins',),
                                               ),
                                               Flexible(
                                                   flex: 1,
                                                   child: SizedBox(
                                                     //  height: 20.sp,
                                                     width: 50.sp,
                                                     child: RotationTransition(
                                                       turns: const AlwaysStoppedAnimation(90/360),
                                                       child: Divider(
                                                         height: 1.sp,
                                                         thickness: 1,
                                                         color: AppColors.greyColor2,
                                                       ),
                                                     ),
                                                   )),
                                               Expanded(child: RowWidgetDashboard2(value: '5', textToShow: 'Used\nLateMins',),
                                               ),

                                             ],),
                                           ),
                                           SizedBox(height: 30.sp,),
                                           Material(
                                             color: themeState==false? AppColors.whiteColor:Colors.black38,
                                             child: InkWell(
                                                 onTap: (){

                                                   Navigator.push(context, CustomSlidePageRoute(child: const TaskScreen(),direction: AxisDirection.left));

                                                 },
                                                 child: ContainerListTileDashBoard(iconPath: AppIcons.taskMainPageIcon, titleText: 'Tasks',)),
                                           ),
                                            SizedBox(height: 10.sp,),
                                            Material(
                                              color: themeState==false? AppColors.whiteColor:Colors.black38,
                                              child: InkWell(
                                                 onTap:(){
                                                  // context.read<ThemeCubit>().switchTheme(false);
                                                   Navigator.push(context, CustomSlidePageRoute(child: const NoticesScreen()));

                                                 },
                                                 child: ContainerListTileDashBoard(iconPath: AppIcons.noticesMainPageIcon, titleText: 'Notices',)),
                                            ),
                                           SizedBox(height: 10.sp,),
                                            Material(
                                              color: themeState==false? AppColors.whiteColor:Colors.black38,
                                              child: InkWell(

                                                 onTap: ()
                                                 {
                                                  // context.read<ThemeCubit>().switchTheme(false);
                                                   Navigator.push(context, CustomSlidePageRoute(child: const PayRollScreen()));

                                                 },
                                                 child: ContainerListTileDashBoard(iconPath: AppIcons.payRollMainPageIcon, titleText: 'PayRoll',)),
                                            ),
                                           SizedBox(height: 10.sp,),
                                           Material(
                                             color: themeState==false? AppColors.whiteColor:Colors.black38,
                                             //surfaceTintColor: Colors.lightBlueAccent,
                                             //shadowColor: ,

                                             child: InkWell(

                                      //  focusColor: AppColors.purpleColor,
                                           //   splashColor: AppColors.blueContainerColor,
                                                 onTap: (){
                                                //   context.read<ThemeCubit>().switchTheme(false);
                                                   Navigator.push(context, CustomSlidePageRoute(child: const PerformancePageView()));

                                                 },
                                                 child: ContainerListTileDashBoard(iconPath: AppIcons.performanceMainPageIcon, titleText: 'Performance',)),
                                           ),
                                          SizedBox(height: 10.sp,),

                                         ],
                                       ),
                                     )),

                                 ///Blue Container id working Policy date time eye icons
                                 Positioned(
                                     top: 1.sh * 0.0007,
                                     left: 1.sw / 9,
                                     child: BlocConsumer<AnimationScaleDartCubit, double>(
                                       listener: (context, state) {
                                       if (state == 0.7) {
                                       Future.delayed(const Duration(milliseconds: 100)).then(
                                       (value) => context
                                           .read<AnimationScaleDartCubit>()
                                           .transformWidget(1.0));
                                       }
                                       if (state == 0.8) {
                                       Future.delayed(const Duration(milliseconds: 500)).then(
                                       (value) => context
                                           .read<AnimationScaleDartCubit>()
                                           .transformWidget(1.0));
                                       }
                                       // TODO: implement listener
                                       } ,
  builder: (context, scaleFactor) {
      return UnconstrainedBox(
                                       child: Container(
                                         height: 120.sp,
                                         width: 1.sw / 1.2,
                                         decoration: BoxDecoration(
                                             color: AppColors.blueContainerColor,
                                             borderRadius:
                                                 BorderRadius.circular(30.sp)),
                                         child: Row(
                                           children: <Widget>[
                                             //First column Empleado Id AND VALUE
                                             Expanded(
                                                 flex: 5,
                                                 child: ListView(
                                                   padding: EdgeInsets.only(
                                                       left: 12.sp, top: 10.sp),
                                                   physics:
                                                       const NeverScrollableScrollPhysics(),
                                                   children: [
                                                     SizedBox(
                                                       height: 20.sp,
                                                     ),
                                                     Center(
                                                         child: Text(
                                                       "9112208",
                                                       style: GoogleFonts.poppins(
                                                           fontSize: 18.sp,
                                                           fontWeight:
                                                               FontWeight.w600,
                                                           color: Colors.white),
                                                     )),
                                                     Center(
                                                         child: Text(
                                                       "Empleado ID",
                                                       style: GoogleFonts.poppins(
                                                           fontSize: 13.sp,
                                                           fontWeight:
                                                               FontWeight.w400,
                                                           color: Colors.white),
                                                     ))
                                                   ],
                                                 )),

                                             Expanded(
                                                 flex: 1,
                                                 child: RotationTransition(
                                                     turns:
                                                         const AlwaysStoppedAnimation(
                                                             90 / 360),
                                                     child: Divider(
                                                         color: Colors.white,
                                                         thickness: 2.0.sp,
                                                         height: 10.sp))),

                                             //Working Policy Value Text
                                             Expanded(
                                                 flex: 6,
                                                 child: InkWell(
                                                   // customBorder: Border.all(color: AppColors.purpleColor,width: 5.sp),
                                                   onTap: () {
                                                     context
                                                         .read<
                                                             AnimationScaleDartCubit>()
                                                         .transformWidget(0.7);
                                                     //context.read<ThemeCubit>().switchTheme(false);

                                                     Navigator.push(context, ScalePageTransition.scalePageTransition(page: const HrPolicyScreen(), alignment: Alignment.centerLeft));



                                                     // context.read<AnimationScaleDartCubit>().transformWidget(1);

                                                     debugPrint(
                                                         "Working Policy Container tap");
                                                   },
                                                   onLongPress: () {
                                                     context
                                                         .read<
                                                             AnimationScaleDartCubit>()
                                                         .transformWidget(0.8);
// print(scaleFactor);
// print("long");
                                                   },
                                                   onTapCancel: () {
                                                     if (scaleFactor != 0.7) {
                                                       context
                                                           .read<
                                                               AnimationScaleDartCubit>()
                                                           .transformWidget(1.001);
                                                     }
                                                     // print("this here");
                                                     // print(scaleFactor);
                                                   },
                                                   child: Transform.scale(
                                                     scale: scaleFactor,
                                                     child: ListView(
                                                       padding: EdgeInsets.only(
                                                           right: 20.sp, top: 1.sp),
                                                       physics:
                                                           const NeverScrollableScrollPhysics(),
                                                       children: [
                                                         SizedBox(
                                                           height: 20.sp,
                                                         ),
                                                         Center(
                                                             child: Align(
                                                                 alignment: Alignment
                                                                     .bottomCenter,
                                                                 child: Text(
                                                                   "Working Policy",
                                                                   style: GoogleFonts.poppins(
                                                                       fontSize:
                                                                           13.sp,
                                                                       fontWeight:
                                                                           FontWeight
                                                                               .w700,
                                                                       color: Colors
                                                                           .white),
                                                                 ))),
                                                         Center(
                                                             child: Align(
                                                                 alignment: Alignment
                                                                     .bottomCenter,
                                                                 child: Text(
                                                                   "9:30 am - 6:00 pm",
                                                                   style: GoogleFonts.poppins(
                                                                       fontSize:
                                                                           13.sp,
                                                                       fontWeight:
                                                                           FontWeight
                                                                               .w400,
                                                                       color: Colors
                                                                           .white),
                                                                 ))),
                                                         UnconstrainedBox(
                                                             child: Container(
                                                           height: 40.sp,
                                                           width: 130.sp,
                                                           decoration: BoxDecoration(
                                                               borderRadius:
                                                                   BorderRadius
                                                                       .circular(
                                                                           10.sp),
                                                               border: Border.all(
                                                                   color: Colors
                                                                       .white)),
                                                           child: ListView(
                                                             scrollDirection:
                                                                 Axis.horizontal,
                                                             //padding: EdgeInsets.only(right: 30),
                                                             shrinkWrap: true,
                                                             children: [
                                                               SizedBox(
                                                                 width: 10.sp,
                                                               ),
                                                               Icon(
                                                                 Icons
                                                                     .remove_red_eye_sharp,
                                                                 color: Colors.white,
                                                                 size: 19.sp,
                                                               ),
                                                               SizedBox(
                                                                   // height: 40,
                                                                   width: 20.sp,
                                                                   child: RotationTransition(
                                                                       turns: const AlwaysStoppedAnimation(
                                                                           90 / 360),
                                                                       child: Divider(
                                                                           color: Colors
                                                                               .white,
                                                                           thickness:
                                                                               1.5
                                                                                   .sp,
                                                                           height:
                                                                               10))),
                                                               Padding(
                                                                 padding:
                                                                     EdgeInsets.only(
                                                                         right:
                                                                             20.0.sp,
                                                                         top: 8.sp),
                                                                 child: Text(
                                                                   "Dec 2021",
                                                                   style: GoogleFonts.poppins(
                                                                       color: Colors
                                                                           .white,
                                                                       fontWeight:
                                                                           FontWeight
                                                                               .w400,
                                                                       fontSize:
                                                                           14.sp),
                                                                 ),
                                                               )
                                                             ],
                                                           ),
                                                         ))
                                                       ],
                                                     ),
                                                   ),
                                                 )),
                                           ],
                                         ),
                                       ),
                                     );
  },
)),



                               ],
                             ),
                           )
                          ,
                        //  SizedBox(height:1.sh*0.09 ,),

                          ///Copyrigth widget
                         //  veevoCopyRightWidget(),
                        ],
                      );
                    }, footer: veevoCopyRightWidget(), itemCount: 1,
                  )




      ),
    );
  },
),
);
  }


}



