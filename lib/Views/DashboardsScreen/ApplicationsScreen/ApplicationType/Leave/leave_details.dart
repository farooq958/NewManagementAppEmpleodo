import 'package:empleado_development/Controller/Cubits/Application/ApplicationType/Leave/leave_detail_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Application/ApplicationType/Leave/leave_send_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Application/get_form_struct_cubit.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:path/path.dart' as path;

class LeaveDetails extends StatefulWidget {
  const LeaveDetails({Key? key}) : super(key: key);

  @override
  State<LeaveDetails> createState() => _LeaveDetailsState();
}

class _LeaveDetailsState extends State<LeaveDetails> {
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
          title: Text("Application Type",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
          leading:
          InkWell(

              onTap: (){
                clearControllers();
               context.read<LeaveDetailCubit>().setVisibiity(0);
                Navigator.pop(context);

              },
              child: Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,)))


      ),
      body:StickyFooterScrollView(footer: veevoCopyRightWidget(), itemBuilder: (BuildContext context, int index) {

        return ListView(shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 20.sp,),
            ///Subject Container
            Container(
              height: 55.sp,
              width: 38.sp,
              margin: EdgeInsets.symmetric(horizontal: 30.sp),
              color: Colors.transparent,
              child: TextFormField(



                controller: AppControllers.leaveSubjectController,
                style: GoogleFonts.poppins(
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.normal,
                  //  color: AppColors.themeColorOne,
                ),
                //cursorColor: AppColors.themeColorOne,
                decoration: InputDecoration(
                  label:  Text("Subject",style: GoogleFonts.poppins(fontSize: 15.sp),),
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
                  hintText: 'Subject',

                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12.0.sp,
                    fontStyle: FontStyle.normal,
                    color: AppColors.greyColor2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.sp,),
            ///Application Body
            Container(
              height: 150.sp,
              width: 38.sp,
              margin: EdgeInsets.symmetric(horizontal: 30.sp),
              color: Colors.transparent,
              child: TextFormField(
                maxLines: 1000,

                controller: AppControllers.leaveBodyController,
                style: GoogleFonts.poppins(
                  fontSize: 15.0.sp,
                  fontWeight: FontWeight.normal,
                  //  color: AppColors.themeColorOne,
                ),
                //cursorColor: AppColors.themeColorOne,
                decoration: InputDecoration(
                  label:  const Text("Application Body",),
                  contentPadding: EdgeInsets.only(
                    top: 30.sp,
                    left: 10.sp,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: AppColors.greyColor2, width: 1.sp),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: AppColors.borderColorGrey,width: 1.1.sp),
                  ),

                  hintText: 'Description...',
                  hintStyle: GoogleFonts.poppins(

                    fontSize: 12.0.sp,
                    fontStyle: FontStyle.normal,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.sp,),
            ///From Time Container
            Container(
              height: 55.sp,
              width: 38.sp,
              margin: EdgeInsets.symmetric(horizontal: 30.sp),
              color: Colors.transparent,
              child: TextFormField(
                onTap: () async {
                  await _selectDate(context,true);

                },

                readOnly: true,
                controller: AppControllers.leaveFromController,
                style: GoogleFonts.poppins(
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.normal,
                  //  color: AppColors.themeColorOne,
                ),

                //cursorColor: AppColors.themeColorOne,
                decoration: InputDecoration(
                  enabled: true,
                  label: const Text(" Leave From "),
                  contentPadding: EdgeInsets.only(
                    top: 15.sp,
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
            ///UpTo Time Container
            Container(
              height: 55.sp,
              width: 38.sp,
              margin: EdgeInsets.symmetric(horizontal: 30.sp),
              color: Colors.transparent,
              child: TextFormField(
                onTap: ()async {
                  //await _selectTime(context,false);
                  await _selectDate(context,false);
                },
                readOnly: true,
                controller: AppControllers.leaveUpToController,
                style: GoogleFonts.poppins(
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.normal,
                  //  color: AppColors.themeColorOne,
                ),
                //cursorColor: AppColors.themeColorOne,
                decoration: InputDecoration(
                  label: const Text("Leave UpTo "),
                  contentPadding: EdgeInsets.only(
                    top: 15.sp,
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
            SizedBox(height: 10.sp,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.0.sp),
              child: Text("Attachment",style: GoogleFonts.poppins(fontSize: 18.sp,color: AppColors.greyColor,fontWeight: FontWeight.w600),),
            ),
            SizedBox(height: 5.sp,),
            ///Attachment
            Container(
//margin: EdgeInsets.only(right: 200.sp),
              padding:  EdgeInsets.only(right: 230.sp,left: 20.sp),
              child: MaterialButton(
elevation: 0.1,
                color: AppColors.primaryColor.withOpacity(0.5),
                minWidth: 20.sp,
                height: 50.sp,
                onPressed: (){
                  _pickFiles();
                  //context.read<LeaveDetailCubit>().setVisibiity(1);

                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
                child: Center(child: Text("Choose File",style: GoogleFonts.poppins(color: AppColors.greyColor),),),
              ),
            ),
            AppUtils.selectedFilesLeaves.isNotEmpty?
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.sp),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: AppUtils.selectedFilesLeaves.length,
                itemBuilder: (context, index) {
                  String fileName = path.basename(AppUtils.selectedFilesLeaves[index]);
                  return ListTile(
                    leading: Text(index.toString()),
                    title: Text( fileName),
                    trailing: TouchableOpacity(
                        onTap: (){

                           removeFile(index);

                        },
                        child: Icon(Icons.remove,color: AppColors.redColor,)),
                  );
                },
              ),
            ):
                SizedBox(height: 0.sp,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.0.sp),
              child: Text("Adjustment",style: GoogleFonts.poppins(fontSize: 18.sp,color: AppColors.greyColor,fontWeight: FontWeight.w600),),
            ),
            ///Adjust Button
SizedBox(height: 10.sp,),
            Container(

              padding:  EdgeInsets.only(right: 220.sp,left: 20.sp),
              child: MaterialButton(
                elevation: 0.1,
                color: AppColors.primaryColor.withOpacity(0.5),
                minWidth: 20.sp,
                height: 55.sp,
                onPressed: (){
                var check=  validator();
                 if(check==true){ context.read<LeaveDetailCubit>().setVisibiity(1);
                   AppUtils.leaveData.clear();
                   AppUtils.leaveData=AppUtils.getDatesList();
                   setState(() {

                   });
                 // print("here");
                 }
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
              child: Center(child: Text("Adjust",style: GoogleFonts.poppins(color: AppColors.greyColor),),),
              ),
            ),
            SizedBox(height: 10.sp,),
            
            BlocConsumer<LeaveDetailCubit, int>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, visibilityState) {
    if(visibilityState==0)
      {
        return const SizedBox();
      }
    else {
      return Column(
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context,index){

                  return Container(
                    height: 200.sp,
                  margin: EdgeInsets.symmetric(horizontal: 20.sp),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp)
                  ,
                    border: Border.all(color: AppColors.greyColor2)
                  ),
                  child: ListView(shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),children: [

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.0.sp),
                      child: Text("Date",style: GoogleFonts.poppins(fontSize: 18.sp,color: AppColors.greyColor,fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(height: 5.sp,),
                   ///Date value
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.sp),
                      padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 2.sp),
                      height: 35.sp,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor
,
                        border: Border.all(color: AppColors.borderColorGrey)
                          ,
                        borderRadius: BorderRadius.circular(10.sp)
                      ),
                    child: Text("${AppUtils.leaveData[index].adjustData.year}-${AppUtils.leaveData[index].adjustData.month}-${AppUtils.leaveData[index].adjustData.day}",style: GoogleFonts.poppins(fontSize: 18.sp,color: AppColors.greyColor),),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.0.sp),
                      child: Text("Adjust In",style: GoogleFonts.poppins(fontSize: 18.sp,color: AppColors.greyColor,fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(height: 5.sp,),
                    Container(
                        height: 40.sp,
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        margin: EdgeInsets.symmetric(horizontal: 10.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(color: AppColors.borderColorGrey)

                        ),

                        child:  Center(child: CustomDropDown2(dropDownValue:AppUtils.leaveData[index].leaveType, index: index,))),

                    SizedBox(height: 10.sp,),
                    Container(height: 45.sp,
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      margin: EdgeInsets.symmetric(horizontal: 10.sp),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(color: AppColors.borderColorGrey)

                      ),
                      child:  CustomCheckBox(halfDayValue: AppUtils.leaveData[index].isHalfDay==1?true:false, index: index,)
                    )


                  ],),

                  );

                },itemCount:AppUtils.leaveData.length,
            separatorBuilder: (BuildContext context, int index) {

              return Image.asset("assets/images/dividerAttendanceHistory.png",height: 20.sp,);

          },),
          ///Submit Button
          SizedBox(height: 5.sp,),
          BlocBuilder<GetFormStructCubit, String>(
  builder: (context, formIdBuilder) {
    return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 50.sp),
            child: MaterialButton(
              color: AppColors.blueContainerColor,
              minWidth: 20.sp,
              height: 50.sp,
              onPressed: (){
                context.read<LeaveDetailCubit>().setVisibiity(1);
               // print(AppUtils.leaveData[0].isHalfDay);
context.read<LeaveSendCubit>().sendLeave(formIdBuilder, AppControllers.leaveSubjectController.text, AppControllers.leaveBodyController.text,
    AppControllers.leaveFromController.text, AppControllers.leaveUpToController.text, AppUtils.leaveData, AppUtils.selectedFilesLeaves);
               // print(formIdBuilder);


              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
              child: Center(child: Text("Submit",style: GoogleFonts.poppins(color: AppColors.whiteColor),),),
            ),
          );
  },
),
        ],
      );
    }
  },
),

            SizedBox(height: 20.sp,),
           
          ],
        );

      }, itemCount: 1,) ,


    );
  }
  void removeFile(int index) {
    setState(() {
      AppUtils.selectedFilesLeaves.removeAt(index);
    });
  }
  Future<void> _pickFiles() async {
    await _requestPermissions(); // Request the necessary permissions

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.any,
      );

      if (result != null) {
        List<String> newFiles = result.paths.map((path) => path!).toList();
        setState(() {
          AppUtils.selectedFilesLeaves.addAll(newFiles);
        });
      }
    } on PlatformException catch (e) {
      print("Unsupported operation: $e");
    } catch (e) {
      print(e);
    }
  }
  Future<void> _requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    if (statuses[Permission.storage] != PermissionStatus.granted) {
      // Handle the case where the user denies the permission

      AppUtils.showCustomSnackBar(context: context, message: "Please Provide Permission", color: AppColors.redColor);
    }
  }
  Future<void> _selectDate(BuildContext context,bool isFrom)
  async {

    final DateTime? picked = await
    showDatePicker(
      useRootNavigator: true,
        context: context, initialDate: DateTime.now(),
        firstDate: DateTime(2010,1,1), lastDate: DateTime(2050),
        helpText: "Select Date",
        fieldHintText: "Select Date",
        fieldLabelText: "Date",
    );
//var l=          //  CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime(2010,1,1), lastDate: DateTime.now(), onDateChanged: (DateTime value) { print(value); },);
    // DatePickerDialog(initialDate: DateTime.now(), firstDate: DateTime(2010,1,1), lastDate: DateTime.now(),);

    if(picked!=null)
    {
     //var check= validator();
      setState(() {
        isFrom==true?
        AppControllers.leaveFromController.text="${picked.year}-${AppUtils.formatStringForMonths(picked.month)}-${picked.day}":
        AppControllers.leaveUpToController.text="${picked.year}-${AppUtils.formatStringForMonths(picked.month)}-${picked.day}";
      });

    }

  }

  bool validator() {

    if(AppControllers.leaveFromController.text == "" || AppControllers.leaveUpToController.text == ""){

      AppUtils.showCustomSnackBar(context: context, message: "Error: Please Provide Leave From/UpTo Date ", color: AppColors.blueContainerColor);
      return false;
    }

    else if(
    (AppUtils.parseDateFromString(AppControllers.leaveUpToController.text).isBefore(AppUtils.parseDateFromString(AppControllers.leaveFromController.text)))==true){

      AppUtils.showCustomSnackBar(context: context, message: "Error: UpTo Date must be after the from date ", color: AppColors.redColor);
      return false;
    }
    else{return true;}

  }

  void clearControllers() {

    AppControllers.leaveFromController.clear();
    AppControllers.leaveSubjectController.clear();
    AppControllers.leaveUpToController.clear();
    AppControllers.leaveBodyController.clear();

  }

}

class CustomCheckBox extends StatefulWidget {
  bool halfDayValue;
  int index=0;
   CustomCheckBox({Key? key,required this.halfDayValue,required this.index}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? dropDownValue=false;
  @override
  Widget build(BuildContext context) {
   // print("half day from ui"+widget.halfDayValue.toString());
    var isHalfDay=widget.halfDayValue;
    AppUtils.leaveData[widget.index].isHalfDay=isHalfDay==true?1:0;
    // for(var i in AppUtils.leaveData) {
    //   print( i.leaveType+i.isHalfDay.toString()+i.adjustData.toString());
    // }
    return    Row(
      children: <Widget>[
        Checkbox(value: widget.halfDayValue, onChanged: (va){
          setState(() {
widget.halfDayValue =va!;
          });

        }),
         const Expanded(child: Text("Half Day "))

      ],
    );
  }
}

class CustomDropDown2 extends StatefulWidget {
   String dropDownValue="";
   int index=0;
   CustomDropDown2({
    Key? key, required this.dropDownValue,required this.index
  }) : super(key: key);

  @override
  State<CustomDropDown2> createState() => _CustomDropDown2State();
}

class _CustomDropDown2State extends State<CustomDropDown2> {
  //String? dropdownValue="Paid";
  @override
  Widget build(BuildContext context) {
    //print(AppUtils.getDatesList()[widget.index].leaveType);
    //print(widget.index);
    //print(dropdownValue);
    var leaveType=widget.dropDownValue;
    AppUtils.leaveData[widget.index].leaveType=leaveType;
    print(leaveType);
    // for(var i in AppUtils.leaveData) {
    //   print( i.leaveType+i.isHalfDay.toString()+i.adjustData.toString());
    // }
    return DropdownButton<String>(
      isExpanded: true,
      underline: const SizedBox(),
     // hint:  Text("Choose Plan ",style: GoogleFonts.poppins(color: AppColors.greyColor2),),
      // Step 3.
      value: widget.dropDownValue,
      // Step 4.
      items: Repository.dataToDropdown
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            Repository.dataForShow[value]!,
            style:  GoogleFonts.poppins(fontSize: 15.sp,color: AppColors.greyColor),
          ),
        );
      }).toList(),

      onChanged: (String? newValue) {
        setState(() {
          widget.dropDownValue = newValue!;

        });
      },
    );
  }
}
