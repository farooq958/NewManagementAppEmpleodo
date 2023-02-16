import 'package:empleado_development/Controller/Cubits/Application/ApplicationType/Leave/leave_detail_cubit.dart';
import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

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
                    BorderSide(color: AppColors.borderColorgrey, width: 1.1.sp),
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
                  label:  Text("Application Body",style: GoogleFonts.poppins(fontSize: 20.sp,color: AppColors.greyColor2),),
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
                    BorderSide(color: AppColors.borderColorgrey, width: 1.1.sp),
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
                    BorderSide(color: AppColors.borderColorgrey, width: 1.1.sp),
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
                    BorderSide(color: AppColors.borderColorgrey, width: 1.1.sp),
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
                  //context.read<LeaveDetailCubit>().setVisibiity(1);

                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
                child: Center(child: Text("Choose File",style: GoogleFonts.poppins(color: AppColors.greyColor),),),
              ),
            ),
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
                  context.read<LeaveDetailCubit>().setVisibiity(1);
                  
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
                        border: Border.all(color: AppColors.borderColorgrey)
                          ,
                        borderRadius: BorderRadius.circular(10.sp)
                      ),
                    child: Text("${AppUtils.getDatesList()[index].year}-${AppUtils.getDatesList()[index].month}-${AppUtils.getDatesList()[index].day}",style: GoogleFonts.poppins(fontSize: 18.sp,color: AppColors.greyColor),),
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
                            border: Border.all(color: AppColors.borderColorgrey)

                        ),

                        child: const Center(child: CustomDropDown2())),

                    SizedBox(height: 10.sp,),
                    Container(height: 45.sp,
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      margin: EdgeInsets.symmetric(horizontal: 10.sp),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(color: AppColors.borderColorgrey)

                      ),
                      child: const CustomCheckBox()
                    )


                  ],),

                  );

                },itemCount:AppUtils.getDatesList().length,
            separatorBuilder: (BuildContext context, int index) {

              return Image.asset("assets/images/dividerAttendanceHistory.png",height: 20.sp,);

          },),
          ///Submit Button
          SizedBox(height: 5.sp,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 50.sp),
            child: MaterialButton(
              color: AppColors.blueContainerColor,
              minWidth: 20.sp,
              height: 50.sp,
              onPressed: (){
                context.read<LeaveDetailCubit>().setVisibiity(1);

              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
              child: Center(child: Text("Submit",style: GoogleFonts.poppins(color: AppColors.greyColor),),),
            ),
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
  Future<void> _selectDate(BuildContext context,bool isFrom)
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
        isFrom==true?
        AppControllers.leaveFromController.text="${picked.year}-${AppUtils.formatStringForMonths(picked.month)}-${picked.day}":
        AppControllers.leaveUpToController.text="${picked.year}-${AppUtils.formatStringForMonths(picked.month)}-${picked.day}";
      });

    }

  }

}

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({Key? key}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? dropDownValue=false;
  @override
  Widget build(BuildContext context) {

    return    Row(
      children: <Widget>[
        Checkbox(value: dropDownValue, onChanged: (va){
          setState(() {
dropDownValue =va;
          });

        }),
         const Expanded(child: Text("Half Day "))

      ],
    );
  }
}

class CustomDropDown2 extends StatefulWidget {
  const CustomDropDown2({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDropDown2> createState() => _CustomDropDown2State();
}

class _CustomDropDown2State extends State<CustomDropDown2> {
  String? dropdownValue="Paid";
  @override
  Widget build(BuildContext context) {
    print(dropdownValue);
    return DropdownButton<String>(
      isExpanded: true,
      underline: const SizedBox(),
     // hint:  Text("Choose Plan ",style: GoogleFonts.poppins(color: AppColors.greyColor2),),
      // Step 3.
      value: dropdownValue,
      // Step 4.
      items: <String>[ 'Paid', 'UnPaid', 'Annual Leaves']
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
