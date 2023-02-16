import 'package:empleado_development/Controller/Cubits/DashboardCubits/animation_scale_dart_cubit.dart';
import 'package:empleado_development/Controller/Cubits/DashboardCubits/date_picking_cubit.dart';
import 'package:empleado_development/Views/DashboardsScreen/AttendenceDetailScreen/attendance_history_screen.dart';
import 'package:empleado_development/Views/DashboardsScreen/HrPolicyScreen/hr_policy_screen.dart';
import 'package:empleado_development/Views/DashboardsScreen/InboxScreen/inbox_screen.dart';
import 'package:empleado_development/Views/DashboardsScreen/NoticesScreen/notices.dart';
import 'package:empleado_development/Views/DashboardsScreen/NotifcationScreen/notification_screen.dart';
import 'package:empleado_development/Views/DashboardsScreen/PayRollScreen/pay_roll_screen.dart';
import 'package:empleado_development/Views/DashboardsScreen/PerformanceScreen/performance_page_view.dart';
import 'package:empleado_development/Views/DashboardsScreen/TasksScreen/task_screen.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/DashboardWidgets/dashboard_utils.dart';
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
                              color: AppColors.greyColor,
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
              onTap: () {
                debugPrint("messageTapped");
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
                           decoration: const BoxDecoration(

                             image: DecorationImage(image: AssetImage(AppImages.dashboardBackgroundImage))
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

                                  child: CircleAvatar(
                                    backgroundColor: AppColors.greenColor,
                                    backgroundImage: const AssetImage("assets/images/face 1.png"),
                                    maxRadius: 100.sp ),
                                ),
                              ),
                              SizedBox(height: 5.sp,),
                               Center(child: Text("Muhammad Farooq Khan",style: GoogleFonts.poppins(color: AppColors.blueContainerColor,fontWeight: FontWeight.w600))),


                               Center(child: Text("Mobile App Engineer,DevAPPSSDSA",style: GoogleFonts.poppins(color: AppColors.greyColor2,fontWeight: FontWeight.w500))),
                               Center(child: Text(" for 2 years and 1 Month",style: GoogleFonts.poppins(color: AppColors.greyColor2,fontWeight: FontWeight.w500))),
                            ],
                        ),
                         ),



                         SizedBox(
                           height: 1.sh<750.0?2.0.sh-(1.sh/3):1.sw>430.0?1.9.sh-(1.sh/3):1.689.sh-(1.sh/3),
                           width: 1.sw,
//color: Colors.black,
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
                                         color: Colors.white,
                                         borderRadius: BorderRadius.only(
                                             topLeft: Radius.circular(40.sp),
                                             topRight: Radius.circular(40.sp))),
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
                                           color: Colors.white,
                                           child: Row(
                                             mainAxisAlignment:
                                                 MainAxisAlignment.spaceEvenly,
                                             children: <Widget>[
                                               const Expanded(
                                                 child: BuildColumnDashboard(
                                                   firstString: 'Current Status',
                                                   secondString: 'Signed In',
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
                                               const Expanded(
                                                 child: BuildColumnDashboard(
                                                   firstString: 'Working Status',
                                                   secondString: 'Duty Timing',
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
                                               const Expanded(
                                                 child: BuildColumnDashboard(
                                                   firstString: 'Login Time',
                                                   secondString: '9:30',
                                                 ),
                                               )
                                             ],
                                           ),
                                         ),
                                         SizedBox(
                                           height: 15.sp,
                                         ),
                                          Center(
                                            child: Container(
                                              height: 55.sp,
                                              width: 1.sw / 1.9,
                                              decoration: BoxDecoration(

                                              borderRadius:
                                                  BorderRadius.circular(2.sp),
                                              color: AppColors.primaryColor,
                                            ),
                                              child:  MaterialButton(
                                                hoverColor: AppColors.purpleColor,
                                                highlightColor: AppColors.buttonColor,
                                                splashColor: AppColors.buttonColor,
                                                onPressed: () {
                                                  Navigator.push(context, ScalePageTransition.scalePageTransition(page: const AttendanceHistoryScreen(), alignment: Alignment.center));

                                                  },
                                                child: Center(
                                                child: FittedBox(
                                                    child: Text(
                                                  "Last 30 days",
                                                  style: GoogleFonts.poppins(
                                                      color: AppColors.greyColor,
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
                                             height: 1.sh<750? 1.sh / 1.7:1.sh/2.03,
                                             width: 1.sw / 1.1,
                                             decoration: BoxDecoration(
                                                 color: AppColors.primaryColor,
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
                                                                 color: AppColors
                                                                     .greyColor),
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
                                                                   color: AppColors
                                                                       .primaryColor,
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
                                                                     color: AppColors
                                                                         .greyColor,
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
                                                     interval: 5,
                                                     title: AxisTitle(text: "Day"
                                                         ,textStyle:
                                                         GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w500,fontSize: 14.sp)),
                                                     minimum: 0
                                                         ,
                                                     maximum: 32
                                                   ),
                                                     primaryYAxis: NumericAxis(

                                                         title: AxisTitle(

                                                             text: "Hours",textStyle:
                                                         GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w500,fontSize: 14.sp)),
                                                       minimum: 0,
                                                       maximum: 10
                                                     ),
                                                     plotAreaBorderColor: AppColors.greyColor,
 plotAreaBackgroundColor: AppColors.primaryColor,
                                                     series: <ChartSeries<Attendance, int>>[
                                                       // Renders column chart
                                                       ColumnSeries<Attendance ,int>(
                                                         borderWidth:2,


borderColor: AppColors.primaryColor,
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
                                             Expanded(child:  Align(
                                               child: Container(
                                                 height: 45.sp,
                                                 width: 100.sp,
                                                 decoration:BoxDecoration(color: AppColors.primaryColor,borderRadius: BorderRadius.circular(20.sp)),
                                                 child: Material(
                                                   color: Colors.transparent,
                                                   shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.sp)),
                                                   child: InkWell(
                                                     splashFactory: InkRipple.splashFactory,
                                                     hoverColor: AppColors.purpleColor,
                                                     highlightColor: AppColors.buttonColor.withOpacity(0.6),
                                                     splashColor: AppColors.buttonColor,
                                                     onTap: (){
                                                       debugPrint("Application");
                                                       Navigator.push(context, ScalePageTransition.scalePageTransition(page: const ApplicationScreen(), alignment: Alignment.centerLeft));


                                                     },
                                                     child:  Center(child: Text("Application",
                                                     style: GoogleFonts.poppins(color: AppColors.greyColor,fontSize: 14.sp),)),
                                                   ),
                                                 ),
                                               ),
                                             )),
                                             Expanded(child: Align(
                                               child: Container(
                                                 height: 45.sp,
                                                 width: 220.sp,
                                                 decoration:BoxDecoration(color: AppColors.primaryColor,borderRadius: BorderRadius.circular(20.sp)),
                                                 child: Material(
                                                   color: Colors.transparent,
                                                   shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.sp)),
                                                   child: InkWell(
                                                     splashFactory: InkRipple.splashFactory,
                                                     hoverColor: AppColors.purpleColor,
                                                     highlightColor: AppColors.buttonColor.withOpacity(0.6),
                                                     splashColor: AppColors.buttonColor,
                                                     onTap: (){

                                                       debugPrint("Time Adjustment tap");
                                                       Navigator.push(context, ScalePageTransition.scalePageTransition(page: const TimeAdjustmentScreen(), alignment: Alignment.centerLeft));

                                                     },
                                                     child: Center(child: Text("Time Adjustment",  style: GoogleFonts.poppins(color: AppColors.greyColor,fontSize: 14.sp))),
                                                   ),
                                                 ),
                                               ),
                                             )),
                                             Expanded(
                                                 flex: 1,
                                                 child: Align(
                                                   child: Container(
                                                     height: 45.sp,
                                                     width: 120.sp,
                                                     decoration:BoxDecoration(color: AppColors.primaryColor,borderRadius: BorderRadius.circular(20.sp)),
                                                     child: Material(

                                                       color: Colors.transparent,
                                                       shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.sp)),
                                                       child: InkWell(
                                                         splashFactory: InkRipple.splashFactory,
                                                         hoverColor: AppColors.purpleColor,
                                                         highlightColor: AppColors.buttonColor.withOpacity(0.6),
                                                         splashColor: AppColors.buttonColor,
                                                         onTap: (){

                                                           debugPrint("View Details");
                                                           Navigator.push(context, ScalePageTransition.scalePageTransition(page: const AttendanceDetailsScreen(), alignment: Alignment.centerLeft));

                                                         },
                                                         child: Center(child: Text("View details",  style: GoogleFonts.poppins(color: AppColors.greyColor,fontSize: 14.sp))),
                                                       ),
                                                     ),
                                                   ),
                                                 )),
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
                                         SizedBox(height: 60.sp,),
                                         Material(
                                           child: InkWell(
                                               onTap: (){

                                                 Navigator.push(context, CustomSlidePageRoute(child: const TaskScreen()));

                                               },
                                               child: ContainerListTileDashBoard(iconPath: AppIcons.taskMainPageIcon, titleText: 'Tasks',)),
                                         ),
                                          SizedBox(height: 10.sp,),
                                          Material(
                                            child: InkWell(
                                               onTap:(){
                                                 Navigator.push(context, CustomSlidePageRoute(child: const NoticesScreen()));

                                               },
                                               child: ContainerListTileDashBoard(iconPath: AppIcons.noticesMainPageIcon, titleText: 'Notices',)),
                                          ),
                                         SizedBox(height: 10.sp,),
                                          Material(
                                            child: InkWell(

                                               onTap: ()
                                               {
                                                 Navigator.push(context, CustomSlidePageRoute(child: const PayRollScreen()));

                                               },
                                               child: ContainerListTileDashBoard(iconPath: AppIcons.payRollMainPageIcon, titleText: 'PayRoll',)),
                                          ),
                                         SizedBox(height: 10.sp,),
                                         Material(

                                           //surfaceTintColor: Colors.lightBlueAccent,
                                           //shadowColor: ,

                                           child: InkWell(

                                    //  focusColor: AppColors.purpleColor,
                                         //   splashColor: AppColors.blueContainerColor,
                                               onTap: (){

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
                                                     "Empleado Id",
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
                                                                 "9:30 am - 5:30 pm",
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
              
            
          
       
    );
  }


}



