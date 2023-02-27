import 'dart:ffi';

import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
///todo " when back button on called all controllers shall be clear "
class TimeAdjustmentScreen extends StatefulWidget {
  const TimeAdjustmentScreen({Key? key}) : super(key: key);

  @override
  State<TimeAdjustmentScreen> createState() => _TimeAdjustmentScreenState();
}
TimeOfDay selectedTime = TimeOfDay.now();
class _TimeAdjustmentScreenState extends State<TimeAdjustmentScreen> {
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
          title: Text("Time Adjustment",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
          leading:
          InkWell(
              onTap: (){
clearController();
                Navigator.pop(context);
              },
              child: Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,)))


      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
children: [
SizedBox(height: 20.sp,),
  ///Date Container
  Container(
    height: 55.sp,
    width: 38.sp,
    margin: EdgeInsets.symmetric(horizontal: 30.sp),
    color: Colors.transparent,
    child: TextFormField(
      onTap: (){

        _selectDate(context);

      },
readOnly: true,

     controller: AppControllers.timeAdjustmentDateTimeController,
      style: GoogleFonts.poppins(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.normal,
        //  color: AppColors.themeColorOne,
      ),
      //cursorColor: AppColors.themeColorOne,
      decoration: InputDecoration(
        label: const Text("Date"),
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
        hintText: 'yyyy/mm/dd',

        hintStyle: GoogleFonts.poppins(
          fontSize: 12.0.sp,
          fontStyle: FontStyle.normal,
          color: AppColors.greyColor2,
        ),
      ),
    ),
  ),
  SizedBox(height: 20.sp,),
  ///InTime Container
  Container(
    height: 55.sp,
    width: 38.sp,
    margin: EdgeInsets.symmetric(horizontal: 30.sp),
    color: Colors.transparent,
    child: TextFormField(
      onTap: () async {
        await _selectTime(context,true);

      },

      readOnly: true,
         controller: AppControllers.timeAdjustmentInTimeController,
      style: GoogleFonts.poppins(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.normal,
        //  color: AppColors.themeColorOne,
      ),

      //cursorColor: AppColors.themeColorOne,
      decoration: InputDecoration(
        enabled: true,
        label: const Text("In Time "),
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
        hintText: 'Choose In Time',

        hintStyle: GoogleFonts.poppins(
          fontSize: 12.0.sp,
          fontStyle: FontStyle.normal,
          color: AppColors.greyColor2,
        ),
      ),
    ),
  ),
  SizedBox(height: 20.sp,),
  ///OutTime Container
  Container(
    height: 55.sp,
    width: 38.sp,
    margin: EdgeInsets.symmetric(horizontal: 30.sp),
    color: Colors.transparent,
    child: TextFormField(
      onTap: ()async {
    await _selectTime(context,false);

    },
      readOnly: true,
         controller: AppControllers.timeAdjustmentOutTimeController,
      style: GoogleFonts.poppins(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.normal,
        //  color: AppColors.themeColorOne,
      ),
      //cursorColor: AppColors.themeColorOne,
      decoration: InputDecoration(
        label: const Text("Out Time "),
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
        hintText: 'Choose Out Time',

        hintStyle: GoogleFonts.poppins(
          fontSize: 12.0.sp,
          fontStyle: FontStyle.normal,
          color: AppColors.greyColor2,
        ),
      ),
    ),
  ),
  SizedBox(height: 20.sp,),
///Description
  Container(
    height: 200.sp,
    width: 38.sp,
    margin: EdgeInsets.symmetric(horizontal: 30.sp),
    color: Colors.transparent,
    child: TextFormField(
      maxLines: 1000,

      controller: AppControllers.timeAdjustmentDescriptionController,
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
          BorderSide(color: AppColors.greyColor2, width: 1.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColors.borderColorGrey, width: 1.1.sp),
        ),
        hintText: 'Reason Description..',
        hintStyle: GoogleFonts.poppins(

          fontSize: 12.0.sp,
          fontStyle: FontStyle.normal,
          color: AppColors.greyColor,
        ),
      ),
    ),
  ),
  SizedBox(height: 20.sp,),
  ///Submit button
  Container(
    margin: EdgeInsets.symmetric(horizontal: 60.sp),
   // padding: EdgeInsets.symmetric(horizontal: 20.sp),
    child: ElevatedButton(
style: ButtonStyle(
  backgroundColor: MaterialStateProperty.all(AppColors.buttonColor),

),
      onPressed: () {
        debugPrint('submit button is pressed');
        //context.read<RegisterCubit>().registerDevice(AppControllers.addNewDeviceDeviceNameController.text, AppControllers.addNewDeviceDeviceIdController.text, "63a4307cf75285ab970a4ffa", double.parse(AppControllers.addNewDeviceDeviceLongController.text) , double.parse(AppControllers.addNewDeviceDeviceLatController.text));


      },
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
],




      ),
    );
  }

  Future<void> _selectTime(BuildContext context,bool isInTime) async {
    final TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime, builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child!,
      );});
  //picked_s  != selectedTime
    if (picked_s != null ) {
      setState(() {
      isInTime==true?  AppControllers.timeAdjustmentInTimeController.text = "${picked_s.hour}:${picked_s.minute}":
        AppControllers.timeAdjustmentOutTimeController.text="${picked_s.hour}:${picked_s.minute}";
      });
    }
  }
  Future<void> _selectDate(BuildContext context)
  async {

    final DateTime? picked = await
    showDatePicker(
        context: context, initialDate: DateTime.now(),
        firstDate: DateTime(2010,1,1), lastDate: DateTime(2050),
        helpText: "Select Date",
        fieldHintText: "Select Date",
        fieldLabelText: "Date");
//var l=          //  CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime(2010,1,1), lastDate: DateTime.now(), onDateChanged: (DateTime value) { print(value); },);
    // DatePickerDialog(initialDate: DateTime.now(), firstDate: DateTime(2010,1,1), lastDate: DateTime.now(),);

    if(picked!=null)
    {
     setState(() {
      AppControllers.timeAdjustmentDateTimeController.text="${picked.year}-${picked.month}-${picked.day}";
     });

    }

  }

  void clearController() {

    AppControllers.timeAdjustmentDateTimeController.clear();
    AppControllers.timeAdjustmentOutTimeController.clear();
    AppControllers.timeAdjustmentInTimeController.clear();
    AppControllers.timeAdjustmentDescriptionController.clear();

  }
}
class TimePickerCustom extends StatefulWidget {
  const TimePickerCustom({Key? key}) : super(key: key);

  @override
  State<TimePickerCustom> createState() => _TimePickerCustomState();
}

class _TimePickerCustomState extends State<TimePickerCustom> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }




}

