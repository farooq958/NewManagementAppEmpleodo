import 'package:empleado_development/Controller/Cubits/PerformanceCubit/FeedBack/performance_page_view_cubit.dart';
import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:empleado_development/Views/Utils/CustomWidgets/PerformanceWidgets/performanceDropDownSearch.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> items=["Farooq","Administrator","Sir Shehzad","Sarmad","Asad"];
    return  StickyFooterScrollView(footer: veevoCopyRightWidget(), itemBuilder: (context,index){
      
     return BlocConsumer<FeedBackButtonsCubit, int>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, buttonState) {
    return ListView(shrinkWrap: true,padding: EdgeInsets.zero,physics:const NeverScrollableScrollPhysics(),
     children: [
       SizedBox(height: 10.sp,),

       Row(
         mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  
                   Expanded(child: Align(
                     alignment: Alignment.centerRight,
                     child: InkWell(
                       onTap: (){
                         context.read<FeedBackButtonsCubit>().setIndexButtonPage(0);
                       },
                       child: CircleAvatar(

                           backgroundColor: buttonState==0? AppColors.greenColor:AppColors.greenColor.withOpacity(0.1),
                           child: SvgPicture.asset(AppIcons.performanceGreenLikeIcon,color:  buttonState==0? AppColors.primaryColor:AppColors.greenColor,)),
                     ),
                   )),
                  SizedBox(width: 10.sp,),
                  Expanded(child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: (){
                        context.read<FeedBackButtonsCubit>().setIndexButtonPage(1);
                      },
                      child: CircleAvatar(
                          backgroundColor: buttonState==1? AppColors.redColor:AppColors.redColor.withOpacity(0.1),
                          child: SvgPicture.asset(AppIcons.performanceRedDislikeIcon,color:buttonState==1? AppColors.primaryColor:AppColors.redColor,)),
                    ),
                  )),
                  Expanded(
                      flex:5,child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: (){
                        context.read<FeedBackButtonsCubit>().setIndexButtonPage(2);
                      },
                      child: CircleAvatar(
                          backgroundColor:  buttonState==2? AppColors.yellowColor:AppColors.yellowColor.withOpacity(0.1),
                          child: SvgPicture.asset(AppIcons.performanceMedalIcon,color: buttonState==2? AppColors.primaryColor:AppColors.yellowColor,)),
                    ),
                  )),
                  
                  
                ],
              ),
       SizedBox(height: 10.sp,),
       Container(height: 200.sp,margin: EdgeInsets.symmetric(horizontal: 20.sp),
       
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)
       ,
         border: Border.all(color: AppColors.greyColor2)
       ),

         child: ListView(shrinkWrap: true,
         physics: const NeverScrollableScrollPhysics(),
         children: [
           Container(
             height: 200.sp,
             width: 38.sp,
             margin: EdgeInsets.symmetric(horizontal: 1.sp),
             color: Colors.transparent,
             child: TextFormField(
               maxLines: 1000,

               controller: AppControllers.feedBackDescriptionController,
               style:    GoogleFonts.poppins(
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
                 // focusedBorder: OutlineInputBorder(
                 //   borderSide:
                 //   BorderSide(color: AppColors.greyColor2, width: 1.sp),
                 // ),
                 // enabledBorder: OutlineInputBorder(
                 //   borderSide:
                 //   BorderSide(color: AppColors.greyColor2, width: 1.1.sp),
                 // ),
                 hintText: 'FeedBack Description',
                 hintStyle: GoogleFonts.poppins(

                   fontSize: 12.0.sp,
                   fontStyle: FontStyle.normal,
                   color: AppColors.greyColor,
                 ),
               ),
             ),
           ),
           // SizedBox(
           //   height: 200.sp,
           //   width: 100.sp,
           //   child: Row(
           //
           //
           //                  children: <Widget>[
           //                    ///drop down choose revie cycle search
           //                     Expanded(
           //                       flex:2,
           //                       child: FlutterDropdownSearch(
           //                           textFieldBorder: InputBorder.none,
           //                           hintText: "Choose Employee",
           //                           textController: AppControllers.feedBackDropDownReviewCycleController,
           //                           items: items,
           //                           dropdownHeight: 200.sp,
           //                           style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w600)
           //
           //                       ),
           //                     ),
           //                    Material(
           //                      child: InkWell(
           //                        splashFactory: InkSparkle.splashFactory,
           //                        highlightColor: Colors.transparent,
           //                        splashColor: AppColors.primaryColor,
           //                        onTap: () {
           //                          debugPrint('submit button is pressed');
           //                          //context.read<RegisterCubit>().registerDevice(AppControllers.addNewDeviceDeviceNameController.text, AppControllers.addNewDeviceDeviceIdController.text, "63a4307cf75285ab970a4ffa", double.parse(AppControllers.addNewDeviceDeviceLongController.text) , double.parse(AppControllers.addNewDeviceDeviceLatController.text));
           //
           //
           //                        },
           //                        child: Container(
           //                          height: 45.sp,
           //                          alignment: Alignment.center,
           //                         // margin: EdgeInsets.symmetric(horizontal: 50.sp),
           //                          decoration: BoxDecoration(
           //                            color: AppColors.buttonColor,
           //                            borderRadius: BorderRadius.circular(10.sp),
           //                          ),
           //                          child: Text(
           //                            'Submit',
           //                            style: GoogleFonts.poppins(
           //                              color: Colors.white,
           //                              fontWeight: FontWeight.normal,
           //                              fontSize: 18.sp,
           //                            ),
           //                          ),
           //                        ),
           //                      ),
           //                    ),
           //
           //
           //
           //                  ],
           //                ),
           // ),
                      ],
         ),
       ),
       Row(


         children: <Widget>[
           ///drop down choose revie cycle search
           Expanded(
             flex:1,
             child: Padding(
               padding:  EdgeInsets.only(left: 18.0.sp),
               child: FlutterDropdownSearch(
                   textFieldBorder: InputBorder.none,
                   hintText: "Choose Employee",
                   textController: AppControllers.feedBackDropDownReviewCycleController,
                   items: items,
                   dropdownHeight: 200.sp,
                   style: GoogleFonts.poppins(color: AppColors.greyColor,fontWeight: FontWeight.w600)

               ),
             ),
           ),
           Material(
             child: InkWell(
               splashFactory: InkSparkle.splashFactory,
               highlightColor: Colors.transparent,
               splashColor: AppColors.primaryColor,
               onTap: () {
                 debugPrint('submit button is pressed');
                 //context.read<RegisterCubit>().registerDevice(AppControllers.addNewDeviceDeviceNameController.text, AppControllers.addNewDeviceDeviceIdController.text, "63a4307cf75285ab970a4ffa", double.parse(AppControllers.addNewDeviceDeviceLongController.text) , double.parse(AppControllers.addNewDeviceDeviceLatController.text));


               },
               child: UnconstrainedBox(
                 child: Container(
                   height: 45.sp,
                   width: 100.sp,
                   alignment: Alignment.center,
                   // margin: EdgeInsets.symmetric(horizontal: 50.sp),
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
           ),



         ],
       )
            ],
     );
  },
);
      
      
    }, itemCount: 1);
  }
}
