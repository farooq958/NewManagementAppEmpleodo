import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/copyrights_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

class CompetencyScreen extends StatelessWidget {
  const CompetencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StickyFooterScrollView(footer: veevoCopyRightWidget(), itemBuilder: (context,index){

      return SizedBox(
          height: 40.sp,
          child: ListTile(

            leading: const Icon(Icons.verified_user_rounded),
            title: FittedBox(child: Text("FrontEndDevelopment",style: GoogleFonts.poppins(color: AppColors.greyColor2),)),
            trailing:  SizedBox(
              height: 40.sp,
              width: 150.sp,
              child: FittedBox(
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding:  EdgeInsets.symmetric(horizontal: 0.0.sp),
                  itemBuilder: (context, _) =>  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 10.sp,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
            ),

          ));

    }, itemCount: 10);
  }
}
