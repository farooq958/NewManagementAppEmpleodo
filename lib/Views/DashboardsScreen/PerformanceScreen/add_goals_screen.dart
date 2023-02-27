import 'package:bottom_picker/widgets/date_picker.dart';
import 'package:empleado_development/Controller/Cubits/PerformanceCubit/add_goals_date_picking_cubit.dart';
import 'package:empleado_development/Controller/Cubits/PerformanceCubit/add_goals_end_date_picking_cubit.dart';
import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/PerformanceWidgets/performanceDropDownSearch.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';
enum MenuItem { high,medium,low }
class AddGoalsScreen extends StatelessWidget {
  const AddGoalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> items=["Afghanistan", "Albania", "Algeria", "American Samoa",
      "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda",
      "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan"];

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
          title: Text("Add Goals",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
          leading:
          InkWell(
              onTap: (){

                Navigator.pop(context);
              },
              child: Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,)))


      ),
      body: StickyFooterScrollView(

        footer: veevoCopyRightWidget(),
        itemBuilder: (BuildContext context, int index) {
        return ListView(

        shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
children: [
  SizedBox(height: 10.sp,),
  ///drop down choose revie cycle search
  Padding(
    padding:  EdgeInsets.symmetric(horizontal: 30.sp),
    child: FlutterDropdownSearch(
        textFieldBorder: InputBorder.none,
        hintText: "Choose Review Cycle",
        textController: AppControllers.addGoalsDropDownReviewCycleController,
        items: items,
        dropdownHeight: 200.sp,
        style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w600)

    ),
  ),
SizedBox(height: 5.sp,),
  ///start Date
  BlocConsumer<DatePickingAddGoalsCubit, DateTime>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, dateTimeState) {
      return Row(
        children: [
          Expanded(child: Align(

              alignment: Alignment.centerRight,
              child: Text("Start Date",style: GoogleFonts.poppins(color: AppColors.greyColor,fontSize: 18.sp,fontWeight: FontWeight.w600),))),
          Expanded(
            flex:2,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20.0.sp,
                  right: 50.sp),
              child: InkWell(
                onTap: () async {
                  // BottomPicker.date(title: "Date Picked",onSubmit: (value){print(value);},).show(context);

                  // DatePicker.showPicker(
                  // context,
                  // pickerModel:
                  // CustomMonthPicker(
                  // minTime: DateTime(
                  // 2010, 1, 1),
                  // maxTime:
                  // DateTime.now(),
                  // currentTime:
                  // DateTime.now(),
                  // ), onConfirm:
                  // (dateValue) {
                  // context
                  //     .read<
                  // DatePickingCubit>()
                  //     .adjustDate(
                  // dateValue);
                  // print(dateValue);
                  // });
                  final DateTime? picked = await
                  showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2010,1,1), lastDate: DateTime(2050),
                      helpText: "Start Date",
                      fieldHintText: "Start Date",
                      fieldLabelText: "Start Date");
//var l=          //  CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime(2010,1,1), lastDate: DateTime.now(), onDateChanged: (DateTime value) { print(value); },);
                  // DatePickerDialog(initialDate: DateTime.now(), firstDate: DateTime(2010,1,1), lastDate: DateTime.now(),);

                  if(picked!=null)
                  {
                    context.read<DatePickingAddGoalsCubit>().adjustDate(picked);

                  }
                  // print(picked);

                },
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                                child: FittedBox(
                                    child: Text(
                                      "${dateTimeState.day}-${AppUtils.getString(dateTimeState.month)}-${dateTimeState.year}",
                                      style: GoogleFonts.poppins(
                                          fontWeight:
                                          FontWeight
                                              .w400,
                                          color: AppColors
                                              .greyColor,
                                          fontSize:
                                          15.sp),
                                    ))),
                          ),
                          Icon(Icons.calendar_month_outlined,color: AppColors.greyColor,)
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ],
      );
//     return Row(
//       children: [
//         Expanded(
//           child:
//         ),
//          Expanded(
//            child: Padding(
//             padding: EdgeInsets.only(
//                 left: 1.0.sp,
//                 right: 20.sp),
//             child: InkWell(
//               onTap: () async {
//                 // BottomPicker.date(title: "Date Picked",onSubmit: (value){print(value);},).show(context);
//
//                 // DatePicker.showPicker(
//                 // context,
//                 // pickerModel:
//                 // CustomMonthPicker(
//                 // minTime: DateTime(
//                 // 2010, 1, 1),
//                 // maxTime:
//                 // DateTime.now(),
//                 // currentTime:
//                 // DateTime.now(),
//                 // ), onConfirm:
//                 // (dateValue) {
//                 // context
//                 //     .read<
//                 // DatePickingCubit>()
//                 //     .adjustDate(
//                 // dateValue);
//                 // print(dateValue);
//                 // });
//                 final DateTime? picked = await   showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2010,1,1), lastDate: DateTime(2050));
// //var l=          //  CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime(2010,1,1), lastDate: DateTime.now(), onDateChanged: (DateTime value) { print(value); },);
//                 // DatePickerDialog(initialDate: DateTime.now(), firstDate: DateTime(2010,1,1), lastDate: DateTime.now(),);
//
//                 if(picked!=null)
//                 {
//                   context.read<DatePickingAddGoalsCubit>().adjustDate(picked);
//
//                 }
//                 // print(picked);
//
//               },
//               child: Align(
//                   alignment: Alignment
//                       .centerRight,
//                   child: Container(
//                     height: 40.sp,
//                     decoration: BoxDecoration(
//                         color: AppColors
//                             .primaryColor,
//                         border: Border.all(
//                             color: AppColors
//                                 .greyColor2),
//                         borderRadius:
//                         BorderRadius
//                             .circular(
//                             10.sp)),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Center(
//                               child: FittedBox(
//                                   child: Text(
//                                     "${dateTimeState.day}-${AppUtils.getString(dateTimeState.month)}-${dateTimeState.year}",
//                                     style: GoogleFonts.poppins(
//                                         fontWeight:
//                                         FontWeight
//                                             .w400,
//                                         color: AppColors
//                                             .greyColor,
//                                         fontSize:
//                                         15.sp),
//                                   ))),
//                         ),
//                         Icon(Icons.calendar_month_outlined,color: AppColors.greyColor,)
//                       ],
//                     ),
//                   )),
//             ),
//         ),
//          ),
//       ],

    },
  ),
  SizedBox(height: 10.sp,),
  ///End Date
  BlocConsumer<DatePickingAddGoalsEndDateCubit, DateTime>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, dateTimeEndState) {
      return Row(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Align(

                alignment: Alignment.centerRight,
                child: Text("End Date",style: GoogleFonts.poppins(color: AppColors.greyColor,fontSize: 18.sp,fontWeight: FontWeight.w600),)),
          )),
          Expanded(
            flex:2,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20.0.sp,
                  right: 50.sp),
              child: InkWell(
                onTap: () async {
                  // BottomPicker.date(title: "Date Picked",onSubmit: (value){print(value);},).show(context);

                  // DatePicker.showPicker(
                  // context,
                  // pickerModel:
                  // CustomMonthPicker(
                  // minTime: DateTime(
                  // 2010, 1, 1),
                  // maxTime:
                  // DateTime.now(),
                  // currentTime:
                  // DateTime.now(),
                  // ), onConfirm:
                  // (dateValue) {
                  // context
                  //     .read<
                  // DatePickingCubit>()
                  //     .adjustDate(
                  // dateValue);
                  // print(dateValue);
                  // });
                  final DateTime? picked = await   showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2010,1,1), lastDate: DateTime(2050),
                      helpText: "End Date",
                      fieldHintText: "End Date",
                      fieldLabelText: "End Date");
//var l=          //  CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime(2010,1,1), lastDate: DateTime.now(), onDateChanged: (DateTime value) { print(value); },);
                  // DatePickerDialog(initialDate: DateTime.now(), firstDate: DateTime(2010,1,1), lastDate: DateTime.now(),);

                  if(picked!=null)
                  {
                    context.read<DatePickingAddGoalsEndDateCubit>().adjustDate(picked);

                  }
                  // print(picked);

                },
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                                child: FittedBox(
                                    child: Text(
                                      "${dateTimeEndState.day}-${AppUtils.getString(dateTimeEndState.month)}-${dateTimeEndState.year}",
                                      style: GoogleFonts.poppins(
                                          fontWeight:
                                          FontWeight
                                              .w400,
                                          color: AppColors
                                              .greyColor,
                                          fontSize:
                                          15.sp),
                                    ))),
                          ),
                          Icon(Icons.calendar_month_outlined,color: AppColors.greyColor,)
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ],
      );
    },
  ),
  SizedBox(height: 10.sp,),
  ///Goal Name
  Container(
    height: 55.sp,
    width: 38.sp,
    margin: EdgeInsets.symmetric(horizontal: 30.sp),
    color: Colors.transparent,
    child: TextFormField(

      controller: AppControllers.addGoalsGoalsTitleController,
      style: GoogleFonts.poppins(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.normal,
      //  color: AppColors.themeColorOne,
      ),
      //cursorColor: AppColors.themeColorOne,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          top: 5.sp,
          left: 10.sp,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColors.greyColor2, width: 1.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColors.borderColorGrey, width: 1.1.sp),
        ),
        hintText: 'Goal Name',
        hintStyle: GoogleFonts.poppins(
          fontSize: 12.0.sp,
          fontStyle: FontStyle.normal,
          color: AppColors.greyColor,
        ),
      ),
    ),
  ),

///Popup menu priority ///drop down


SizedBox(height: 10.sp,),
          Container(
            height: 55.sp,
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
              margin: EdgeInsets.symmetric(horizontal: 30.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.sp),
                border: Border.all(color: AppColors.borderColorGrey)

              ),

              child: const Center(child: CustomDropDown())),
//DatePicker.showPicker(context)
//
SizedBox(height: 10.sp,),

  ///Goal Description
  Container(
    height: 200.sp,
    width: 38.sp,
    margin: EdgeInsets.symmetric(horizontal: 30.sp),
    color: Colors.transparent,
    child: TextFormField(
      maxLines: 1000,

      controller: AppControllers.addGoalsDescriptionController,
      style: GoogleFonts.poppins(
        fontSize: 15.0.sp,
        fontWeight: FontWeight.normal,
        //  color: AppColors.themeColorOne,
      ),
      //cursorColor: AppColors.themeColorOne,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          top: 5.sp,
          left: 10.sp,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColors.borderColorGrey, width: 1.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColors.borderColorGrey, width: 1.1.sp),
        ),
        hintText: 'Goal Description',
        hintStyle: GoogleFonts.poppins(

          fontSize: 12.0.sp,
          fontStyle: FontStyle.normal,
          color: AppColors.greyColor,
        ),
      ),
    ),
  ),
SizedBox(height: 10.sp,),
  ///Submit Button
  ///
  Container(
    padding: EdgeInsets.symmetric(horizontal: 10.sp),
    child: MaterialButton(
      elevation: 15.0,


      onPressed: () {
        debugPrint('submit button is pressed');
        //context.read<RegisterCubit>().registerDevice(AppControllers.addNewDeviceDeviceNameController.text, AppControllers.addNewDeviceDeviceIdController.text, "63a4307cf75285ab970a4ffa", double.parse(AppControllers.addNewDeviceDeviceLongController.text) , double.parse(AppControllers.addNewDeviceDeviceLatController.text));


      },
      child: Container(
        height: 45.sp,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 50.sp),
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Text(
          'Submit',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 18.sp,
          ),
        ),
      ),
    ),
  ),

],

      ); }, itemCount: 1,



      ),

    );
  }
}

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      underline: const SizedBox(),
      hint:  Text("Choose Priority",style: GoogleFonts.poppins(color: AppColors.greyColor2),),
    // Step 3.
    value: dropdownValue,
    // Step 4.
    items: <String>[ 'High', 'Medium', 'Low']
        .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(
    value,
    style:  GoogleFonts.poppins(fontSize: 15.sp,color: AppColors.greyColor),
    ),
    );
    }).toList(),

    onChanged: (String? newValue) {
    setState(() {
    dropdownValue = newValue!;
    });
    },
    );
  }
}
