import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

import '../../Utils/Data/app_files.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //bool isExpanded;
    return  StickyFooterScrollView(footer: veevoCopyRightWidget(), itemBuilder: (context,index){


      return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ExpansionCustomWidget(titleExpansion: 'Performance Review Cycle No $index', index: index,),
          SizedBox(height: 5.sp,)
        ],
      );


    }, itemCount: 10);
  }
}
@immutable
class ExpansionCustomWidget extends StatelessWidget {
 final String titleExpansion;
//Map<int,bool> expansionCheck;
final int index;
   const ExpansionCustomWidget({
    Key? key,required this.titleExpansion,required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.sp),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
        ),
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        child: ExpansionTile(
         // tilePadding: EdgeInsets.symmetric(vertical: -10.sp),
          //maintainState: true,
          //tilePadding: EdgeInsets.symmetric(horizontal: 20.sp),
          //collapsedIconColor: Colors.pink,
          collapsedBackgroundColor: AppColors.primaryColor,

          // onExpansionChanged: (val){
          //   print(val);
          //    isExpanded = val;
          //   //  if(val == true)
          //   //    {
          //   //      print("heree${widget.expansionCheck[widget.index]}");
          //   //
          //   //        widget.expansionCheck.update(widget.index, (value) => value=true);
          //   //      print("heree${widget.expansionCheck[widget.index]}");
          //   //
          //   //    }
          //   //  else {
          //   //    print("heree3${widget.expansionCheck[widget.index]}");
          //   //    widget.expansionCheck.update(widget.index, (value) => value=false);
          //   //  }
          //   // setState(() {
          //   //
          //   // });
          //   // setState(() {
          //   //
          //   // });
          //
          // },
          backgroundColor: Colors.white,
          title: Padding(

              padding: EdgeInsets.only(left: 20.sp),
              child: Text(titleExpansion,style: GoogleFonts.poppins(fontSize: 15.sp,color:  AppColors.greyColor),)),children: [
Container(

  height: 200.sp,
  width: 1.sw,
  color: Colors.white,
  child: ListView(shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),

  children: [

SizedBox(
  height: 40.sp,
  //color: AppColors.purpleColor,
  child:   ListTile(leading: Text("Goals",style: GoogleFonts.poppins(fontWeight: FontWeight.w600),),
            title: Text("18",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,color: AppColors.greyColor2,fontSize: 17.sp) ,)),
),
    Image.asset("assets/images/dividerAttendanceHistory.png",height: 1.sp,),
    SizedBox(
      height: 40.sp,
      child: ListTile(leading: Text("Competency",style: GoogleFonts.poppins(fontWeight: FontWeight.w600),),
          title: Text("18",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,color: AppColors.greyColor2,fontSize: 17.sp) ,)),
    ),
    Image.asset("assets/images/dividerAttendanceHistory.png",height: 1.sp,),
    SizedBox(
      height: 55.sp,
      child: ListTile(
        minVerticalPadding: 0.3,
          leading: Text("FeedBack",style: GoogleFonts.poppins(fontWeight: FontWeight.w600),),
          title:
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Expanded(child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){
                  //  context.read<FeedBackButtonsCubit>().setIndexButtonPage(0);
                  },
                  child: CircleAvatar(

                      backgroundColor:  AppColors.greenColor,
                      child: SvgPicture.asset(AppIcons.performanceGreenLikeIcon,color:  AppColors.primaryColor,)),
                ),
              )),
              const Expanded(child: Text("20")),
              SizedBox(width: 10.sp,),
              Expanded(child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: (){
                   // context.read<FeedBackButtonsCubit>().setIndexButtonPage(1);
                  },
                  child: CircleAvatar(
                      backgroundColor: AppColors.redColor,
                      child: SvgPicture.asset(AppIcons.performanceRedDislikeIcon,color: AppColors.primaryColor)),
                ),
              )),
              const Expanded(child: Text("20")),
              SizedBox(width: 10.sp,),
              Expanded(
                  flex:1,child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: (){
                    //context.read<FeedBackButtonsCubit>().setIndexButtonPage(2);
                  },
                  child: CircleAvatar(
                    maxRadius: 20.sp,
                      backgroundColor:   AppColors.yellowColor,
                      child: SvgPicture.asset(AppIcons.performanceMedalIcon,color: AppColors.primaryColor)),
                ),
              )),
              const Expanded(
                  flex:4,child: Text("20")),


            ],
          ),
      ),
    ),
    Image.asset("assets/images/dividerAttendanceHistory.png",height: 1.sp,),
    SizedBox(
      height: 40.sp,
      child: ListTile(leading: Text("Total Score",style: GoogleFonts.poppins(fontWeight: FontWeight.w600),),
          title: Text("80",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,color: AppColors.greyColor2,fontSize: 17.sp) ,)),
    ),

  ],
  ),



)


        ],),
      ),
    );
  }
}
var isExpanded;
