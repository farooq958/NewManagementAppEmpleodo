import 'package:empleado_development/Controller/Cubits/loginCubits/login_radiobutton_cubit.dart';
import 'package:empleado_development/Controller/Repository/repo.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyRadioGroup extends StatelessWidget {
  final int? radioState;
  final BuildContext context;
   const MyRadioGroup( {super.key, this.radioState, required this.context});

  @override
  Widget build(BuildContext context1) {

    return SizedBox(
      height: 60.sp,
      width: 1.sw,
      child: Row(
        children: [
          Expanded(
            child: RadioListTile(
              contentPadding: EdgeInsets.only(left: 30.sp),
              value: 0,
              groupValue:  radioState,
              onChanged: _handleRadioValueChange,
              title:  Text('Password',style: GoogleFonts.poppins(fontSize: 14.sp,color: AppColors.greyColor,fontWeight: FontWeight.w600),),

            ),
          ),
           Expanded(
             flex: 1,
             child: RadioListTile(
               contentPadding: EdgeInsets.only(right: 30.sp),
              value: 1,
              groupValue:  radioState,
              onChanged: _handleRadioValueChange,
              title:  Text('Otp',style: GoogleFonts.poppins(fontSize: 14.sp,color: AppColors.greyColor,fontWeight: FontWeight.w600),),
          ),
           ),

        ],
      ),
    );
  }

  void _handleRadioValueChange(int? value) {
    context.read<LoginRadiobuttonCubit>().changeRadio(value);


  }
}
