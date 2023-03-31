import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:easy_downloader/monitor/download_monitor.dart';
import 'package:http/http.dart' as http;
import 'package:empleado_development/Controller/Cubits/DashboardCubits/dashboard_data_cubit.dart';

import 'package:empleado_development/Controller/Cubits/DashboardCubits/date_picking_cubit.dart';
import 'package:empleado_development/Controller/Cubits/PayrollCubit/date_picking_payroll_cubit.dart';
import 'package:empleado_development/Model/DashboardModel/dashboard_controller.dart';
import 'package:empleado_development/Model/DashboardModel/dashboard_model.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/DashboardWidgets/dashboard_utils.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import '../../Utils/Data/utils.dart';

class PayRollScreen extends StatelessWidget {
  const PayRollScreen({Key? key}) : super(key: key);

  // @override
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
          title: Text("Payroll",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
          leading:
          InkWell(
              onTap: (){

                Navigator.pop(context);
              },
              child: Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,)))


      ),
      body: StickyFooterScrollView(

        footer: veevoCopyRightWidget(), itemBuilder: (BuildContext context, int index) {

        return BlocBuilder<DashboardDataCubit, DashboardDataState>(
  builder: (context, state) {
    var chartData=  dashboardData.payrollInfo.increments.reversed.toList();
  final List<Increment> chartIncrementData=getChartFilteredData(chartData);


   //var maxValue= dashboardData.payrollInfo.increments.fold(0, (max, current) => max > current ? max : current);
    return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(height: 30.sp,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.sp),
              height: 200.sp,decoration: BoxDecoration(border: Border.all(color: AppColors.borderColorGrey),borderRadius: BorderRadius.circular(10.sp)),
              child: ListView(physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,children: [
SizedBox(height:10.sp),

                Container(
                  //color: Colors.yellow,
                  padding: EdgeInsets.only(right: 160.sp
                  ),
                  height: 50.sp,
                  width: 1.sw,
                  child: Row(
                    children: <Widget>[

                      Expanded(child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 80.sp,
                            width: 80.sp,
                            decoration:BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(10.sp)),

                              child: Center(child: SvgPicture.asset(AppIcons.payRollMainPageIcon,width: 20.sp,))))),
                      SizedBox(width: 4.sp,),
                      Expanded(
                          flex:3,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: FittedBox(child: Text("Payroll",style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w600,fontSize: 20.sp),)))),



                    ],
                  ),
                ),
///starting pay and current pay
                Container(
                  height: 60.sp,
                  padding: EdgeInsets.only(left: 40.sp),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children:  [

                        Expanded(
                        flex: 2,
                        child: BuildColumnDashboard(
                          firstString: 'Starting Pay',
                          secondString: dashboardData.payrollInfo.basicSalary, theme: false,
                        ),
                      ),

                      Flexible(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.only(right: 80.0.sp),
                          child:  BuildColumnDashboard(
                            firstString: 'Current pay',
                            secondString: dashboardData.payrollInfo.currentSalary,
                            theme: false,
                          ),
                        ),
                      )


                    ],),)  ,
SizedBox(height: 20.sp,),
                ///date and download buttun
                BlocConsumer<DatePickingPayrollCubit, DateTime>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, dateAdjustPayroll) {
    return Row(
                      children: <Widget>[
                        SizedBox(width: 30.sp,),
                         Expanded(
                           child: TouchableOpacity(
                            onTap: () {
                              // BottomPicker.date(title: "Date Picked",onSubmit: (value){print(value);},).show(context);

                              DatePicker.showPicker(

                                  context,
                                 // showTitleActions: true,
                                  pickerModel:
                                  CustomMonthPicker(
                                    minTime: DateTime.now().subtract( Duration(days: 365+(DateTime.now().month*20))),
                                    maxTime:
                                    DateTime.now(),
                                    currentTime:
                                    DateTime.now(),
                                  ), onConfirm:
                                  (dateValue) {
                                context
                                    .read<
                                    DatePickingPayrollCubit>()
                                    .adjustDate(
                                    dateValue);
                                print(dateValue);
                              });
                            },
                            child:  Container(
                              height: 40.sp,
                              width: 102.sp,
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

                              child: Row(
                                children: [
                                 // SizedBox(width: 5.sp,),
                                  SizedBox(width: 3.sp,),
                                  Expanded(
                                    flex:4,
                                    child: Center(
                                        child: Text(
                                          "${AppUtils.getString(dateAdjustPayroll.month)}-${dateAdjustPayroll.year}",
                                          style: GoogleFonts.poppins(
                                              fontWeight:
                                              FontWeight
                                                  .w400,
                                              color: AppColors
                                                  .greyColor,
                                              fontSize:
                                              11.sp),
                                        )),
                                  ),
                                  SizedBox(width: 5.sp,),
                                   Expanded(

                                       child: Align(
                                           alignment: Alignment.centerLeft,
                                           child: SvgPicture.asset(AppIcons.attendanceHistoryIcon,height: 13.sp,color: AppColors.greyColor2,))),

                                ],
                              ),
                            ),
                        ),
                         ),
                         SizedBox(width: 10.sp,),
                         Expanded(
                           child: Container(
                            height: 40.sp,
                            width: 135.sp,
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
                            child: MaterialButton(
                              onPressed: () { 
                                
                                _prepare(context, "https://emp-beta.veevotech.com/api/get_data.php?operation=export_payslips&user_id=9112208&month=${dateAdjustPayroll.month}&year=${dateAdjustPayroll.year}", "Payslip ${dateAdjustPayroll.month} ${dateAdjustPayroll.year}");
                              },
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Expanded(


                                  
                                  child: Align(

                                      alignment: Alignment.centerRight,
                                      child: Text("Download",style: GoogleFonts.poppins(color: AppColors.greyColor,fontSize: 13.sp),))),
                               Icon(Icons.download,color: AppColors.buttonColor,size: 20.sp,),
                              SizedBox(width: 10.sp,)

                            ],
                        ),
                            ),
                        ),
                         ),
                        SizedBox(width: 30.sp,),

                      ],
                    );
  },
),



                  ],),),
            SizedBox(height: 20.sp,),
            Padding(
              padding:  EdgeInsets.only(left: 18.0.sp),
              child: Text("Increment",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
            ),
            dashboardData.payrollInfo.increments.isNotEmpty?
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                //sf chart
                SfCartesianChart(
                  tooltipBehavior: TooltipBehavior(enable: true,
                    color: AppColors.primaryColor,
                    canShowMarker: false,
                    format: 'point.y',
                      duration: 1000,
                      builder: (dynamic data, dynamic point, dynamic series,
                          int pointIndex, int seriesIndex) {
                        return Container(
                          height: 50.sp,
                            width: 100.sp,
                            padding: EdgeInsets.symmetric(vertical: 5.sp),
                            decoration: BoxDecoration(

                              color: AppColors.blackColor87,
                              borderRadius: BorderRadius.circular(20.sp)
                            ),
                            child: Column(
                              children: [
                                Expanded(

                                  child:  Text(
                                      'Increment',style: GoogleFonts.poppins(
                                      color: AppColors.whiteColor,
                                      fontSize: 10.sp,fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Divider(color: AppColors.greyColor,),
                                 Expanded(child:  Text(chartData[pointIndex].incAmount,style: GoogleFonts.poppins(
                                     color: AppColors.whiteColor,
                                     fontWeight: FontWeight.w500,fontSize: 10.sp),))
                              ],
                            )
                        );
                      },

                      tooltipPosition: TooltipPosition.auto,
                    textStyle: GoogleFonts.poppins(fontSize: 8.sp,color: AppColors.blueContainerColor)

                  ),

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
                    primaryXAxis: CategoryAxis(
                        labelStyle:  GoogleFonts.poppins(
                          color:AppColors.greyColor,
                          fontWeight: FontWeight.bold,
                         // fontStyle: FontStyle.italic,
                          fontSize: 12.sp,
                        ),
                      isVisible: true
                      ,
                     // rangePadding: ChartRangePadding.additional,
                     // maximumLabels: 20,
                      minimum: 0,
                      arrangeByIndex: true



                    ),
                    primaryYAxis: NumericAxis(


                      // labelStyle:  GoogleFonts.poppins(
                      //   color: Colors.blueGrey,
                      //   fontWeight: FontWeight.bold,
                      //   //fontStyle: FontStyle.italic,
                      //   fontSize: 10.sp,
                      // ),
                      isVisible: true
                      ,
                    maximumLabels: 4,
                        //arrangeByIndex: true,
                        rangePadding: ChartRangePadding.additional

                      , interval: 1000,
// maximum:dashboardData.payrollInfo.increments.fold(0, (max, current) => max! > double.parse(current.incAmount.replaceAll(',', '')) ? max : double.parse(current.incAmount.replaceAll(',', '')))


                    ),
                    plotAreaBorderColor: AppColors.greyColor,
                    plotAreaBackgroundColor: AppColors.primaryColor,
                    series: <ChartSeries<Increment, String>>[
                      // Renders column chart
                      SplineSeries<Increment ,String>(
  //dataLabelSettings: const DataLabelSettings(isVisible: true),


                       // enableTooltip: true,
                        splineType: SplineType.monotonic,
                        //  isTrackVisible: true,
//                          trackColor: AppColors.greyColor2,

  //                        borderWidth:2,


                       //  borderColor: AppColors.primaryColor,
                          color: AppColors.buttonColor,
                          //width: 0.1.sp,
// onPointTap: (va){
//                             print(va.viewportPointIndex);
// },
                           dataSource: chartIncrementData,

                         // dataSource: chartIncrementData,
                          xValueMapper: (Increment data, _) => data.date,
    yValueMapper: (Increment data, _) => int.parse(data.incAmount.replaceAll(',', ''))
        // int.parse(dashboardData.payrollInfo.increments[index+1].incAmount.replaceAll(',', ''))
                        //   lowValueMapper: (Increment data, _) => 0,
                        //   highValueMapper: (Increment data, _) => num.parse(data.incAmount.replaceAll(',', ''))
                        //   ,
                        // closeValueMapper: (Increment data, _) => num.parse(data.incAmount.replaceAll(',', '')),
                        // openValueMapper: (Increment data, _) => 0,
                         // pointColorMapper: (Increment data, _) => data.hours<=3?AppColors.redColor:data.hours<=6?AppColors.yellowColor:AppColors.greenColor,
                         , markerSettings:  MarkerSettings(
                              borderColor:  AppColors.purpleColor,
                              isVisible: true,
                              color: AppColors.primaryColor,
                              // Marker shape is set to diamond
                              shape: DataMarkerType.circle
                          )
                      ),

                    ]
                ),
//                AspectRatio(
//                  aspectRatio: 1.5,
//                  child: LineChart(LineChartData(
//                    lineBarsData: [LineChartBarData(
//                      isCurved: true,
//                        dotData: FlDotData(
//                          show: true,
//
//                        ),
//
//                      spots: chartIncrementData.map((e) => FlSpot(double.parse(e.incAmount.replaceAll(',', '')), double.parse(e.incAmount.replaceAll(',', '')))).toList()
//                    )]
//
//                  )),
//                ),

                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.sp),
                    height: 200.sp,decoration: BoxDecoration(border: Border.all(color: AppColors.borderColorGrey),borderRadius: BorderRadius.circular(10.sp)),
                    child: ListView(physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,children: [
                      SizedBox(height:10.sp),

                      Container(
                        //color: Colors.yellow,
                        padding: EdgeInsets.only(right: 160.sp
                        ),
                        height: 50.sp,
                        width: 1.sw,
                        child: Row(
                          children: <Widget>[

                            Expanded(child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    height: 80.sp,
                                    width: 80.sp,
                                    decoration:BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.circular(10.sp)),

                                    child: Center(child: SvgPicture.asset(AppIcons.payRollMainPageIcon,width: 20.sp,))))),
                            SizedBox(width: 4.sp,),
                            Expanded(
                                flex:3,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: FittedBox(child: Text("Increment History",style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w600,fontSize: 20.sp),)))),



                          ],
                        ),
                      ),
                      ///Increment and Efective from
                      Container(
                        height: 60.sp,
                        padding: EdgeInsets.only(left: 40.sp),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children:  [

                             Expanded(
                              flex: 2,
                              child: BuildColumnDashboard(
                                firstString: 'Increment',
                                secondString: dashboardData.payrollInfo.increments[index].incAmount,
                                theme: false,
                              ),
                            ),

                            Flexible(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.only(right: 80.0.sp),
                                child:  BuildColumnDashboard(
                                  firstString: 'Effective from',
                                  secondString: dashboardData.payrollInfo.increments[index].date,
                                  theme: false,
                                ),
                              ),
                            )


                          ],),)  ,
                      //SizedBox(height: 20.sp,),
                      Padding(
                        padding:  EdgeInsets.only(left: 18.0.sp),
                        child: Text("Description",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
                      ),
                      ///Description
                      SizedBox(
                        height:100,
                        child: Padding(
                          padding:  EdgeInsets.only(left: 8.0.sp),
                          child: Text(dashboardData.payrollInfo.increments[index].detail,style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w400,fontSize: 11.sp),),
                        ),
                      )



                    ],),);

                }, separatorBuilder: (context,index){
                  return Image.asset("assets/images/dividerAttendanceHistory.png",height: 20.sp,);
                }, itemCount:  dashboardData.payrollInfo.increments.length),
              ],
            ):
                Center(child: Text("No Increment History",style: GoogleFonts.poppins(fontSize: 12.sp,color: AppColors.greyColor2,fontWeight: FontWeight.w600),))

          ],

        );
  },
);


      }, itemCount: 1,),

    );
  }
  void _prepare(BuildContext context,url,fileName) async {
    var permissionReady = await _checkPermission(context);
    if (permissionReady) {
       var localPath = '${await _findLocalPath()}${Platform.pathSeparator}Download';
      final savedDir = Directory(localPath);
      bool hasExisted = await savedDir.exists();
      if (!hasExisted) {
        savedDir.create();
      }
      _startDownload(context,url, localPath, fileName);
    }
  }

  Future<String> _findLocalPath() async {
    final directory = Platform.isAndroid ? await getExternalStorageDirectory() : await getApplicationDocumentsDirectory();
    return directory!.path;
  }

  Future<bool> _checkPermission(BuildContext context) async {
    if (Platform.isAndroid) {
      var status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        status = await Permission.storage.request();
        if (status != PermissionStatus.granted) {
          AppUtils.showCustomSnackBar(context: context, message: "Permission denied. Please grant storage permission to download files.", color: AppColors.redColor);
          return false;
        }
      }

    }
    return true;
  }

  void _startDownload(context,url,localPath,nameFile) async {
   // var taskId = await FlutterDownloader.enqueue(
   //    url: url,
   //    savedDir: localPath,
   //    fileName: nameFile,
   //    showNotification: true,
   //    openFileFromNotification: true,
   //    headers: {
   //      // optional headers
   //    },
   //  );
try{
  var request = await http.get(Uri.parse(url));
//print(request.reasonPhrase);
  var data= jsonDecode(request.bodyBytes.toString());
  //print(data.length);
  if(data.length == 66)
  {
    AppUtils.showCustomSnackBar(context: context, message: "Payslip Not Generated Yet", color:AppColors.blueContainerColor );
  }
  else {
    //openFile(localPath+nameFile);
    // FlutterDownloader.registerCallback(downloadCallback,step: 1);
    // File file = File(localPath + nameFile);
    // file.writeAsBytesSync(request.bodyBytes);
    var taskId = await FlutterDownloader.enqueue(
      url: url,
      savedDir: localPath,
      fileName: nameFile+".pdf",
      showNotification: true,
      saveInPublicStorage: true,
      openFileFromNotification: true,
      allowCellular: true,
      headers: {
        // optional headers
      },
    );


//download(stream, filename)
    // var task = await EasyDownloader.newTask(url, localPath, nameFile, maxSplit: 8, showNotification: true);
    // var controller =
    // EasyDownloader.getController(task.downloadId);
    // if (controller != null) {
    //   controller.start(
    //       monitor: DownloadMonitor(
    //         duration: const Duration(milliseconds: 100),
    //         blockMonitor: (blocks) {
    //           //listen all blocks
    //         },
    //         onProgress: (downloaded, total, speed, status) {
    //           // speed[task.downloadId] = speed;
    //           // log("downloaded: $downloaded, total: $total, speed: $speed, status: $status");
    //           //listen progress
    //           //listen speed/second
    //           //listen status
    //           //listen status
    //         },
    //       ));
    // } else {
    //   //no task found
    // }

    // var taskId =  FileDownloader.downloadFile(
    //    url: url,
    //    //savedDir: localPath,
    //    name:nameFile,
    //    //showNotification: true,
    //    //saveInPublicStorage: true,
    //    //openFileFromNotification: true,
    //    //allowCellular: true,
    //    onDownloadCompleted: (va)
    //     {
    //       print(va);
    //     }
    //  );
    // FlutterDownloader.loadTasks(DownloadTask(taskId: taskId);
  }
}on SocketException catch (e) {
  debugPrint(e.toString());
  debugPrint('Internet connection is down.');
  AppUtils.showCustomSnackBar(context: context, message: "No Internet", color: AppColors.redColor);
} on Exception catch (e) {
  debugPrint('sent data api exception: $e');
  AppUtils.showCustomSnackBar(context: context, message: "Server Error", color: AppColors.redColor);
}

    // http.StreamedResponse response = await request.send();

    // if (request.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    // }
    // else {
    //   print(response.reasonPhrase);
    // }

  }
  // Future<void> openFile(String filePath) async {
  //   await Future.delayed(const Duration(seconds: 1));
  //    OpenFile.open(filePath);
  // }
  List<Increment> getChartFilteredData(List<Increment> chartData) {
    if(chartData.isNotEmpty)
      {
    List<Increment> outputList = [chartData[0]];
    //int previousValue =int.parse(chartData[0].incAmount.replaceAll(',', ''));
    Increment previousObject = chartData[0];
    for (int i = 1; i < chartData.length; i++) {
      int newValue = int.parse(previousObject.incAmount.replaceAll(',', '')) + int.parse(chartData[i].incAmount.replaceAll(',', '')) ;
      Increment newObject = Increment(incAmount: newValue.toString(), detail: chartData[i].detail, date: chartData[i].date);
      outputList.add(newObject);
      previousObject = newObject;
    //  previousValue = newValue;
      print(outputList[i].incAmount);
    }

    return outputList;}
    else
      {

      return  <Increment>[];
      }
  }

  // convertToPdf(url)
  // {
  //   var bytes = File.fromUri(Uri.parse(url)).readAsBytesSync();
  //   var decoder = SpreadsheetDecoder.decodeBytes(bytes);
  //   var table = decoder.tables['Sheet1'];
  //   var values = table.rows[0];
  //
  //   var fileName = 'sample.png';
  //   var outFile = File.fromUri(Uri.parse(fileName));
  //   outFile.createSync();
  //   outFile.writeAsBytesSync(await _networkImageToByte(values[3]));
  // final img = imageDecode.decodeImage(File(fileName).readAsBytesSync());
  //
  // final Document pdf = Document();
  // final image = PdfImage(
  // pdf.document,
  // image: img.data.buffer.asUint8List(),
  // width: img.width,
  // height: img.height,
  // );
  //
  // pdf.addPage(Page(
  // pageFormat: PdfPageFormat(600, 400),
  // build: (Context context) {
  // return Column(children: [
  // Text('Hello World'),
  // Center(
  // child: SizedBox(
  // height: 100.0,
  // width: 100.0,
  // child: Image(image),
  // ),
  // )
  // ]); // Center
  // }));
  //
  // final File file = File('example.pdf');
  // file.writeAsBytesSync(pdf.save());
  //
  // }

}
