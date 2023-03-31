import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:empleado_development/Controller/Cubits/DashboardCubits/dashboard_data_cubit.dart';
import 'package:empleado_development/Controller/Cubits/change_dp_cubit.dart';
import 'package:empleado_development/Controller/UtilsData/app_preferences.dart';
import 'package:empleado_development/Model/imageController.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerWidget extends StatefulWidget {
  final String imagePath;
  const ImagePickerWidget({super.key, required this.imagePath});

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
   File? _imageFile;
bool visibilityChangeButton=false;
  @override
  void initState() {
    super.initState();
    //loadFile();
 //_imageFile=  File(widget.imagePath);

    _requestPermission();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
       // titleSpacing: 1.sp,
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
          title: Text("Change Picture",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColors.greyColor),),
          leading:
          InkWell(
              onTap: (){

                Navigator.pop(context);
              },
              child: Center(child: Image.asset(AppImages.backButton,fit: BoxFit.fitHeight,height: 20.sp,width: 20.sp,)))


      ),
      body: BlocListener<ChangeDpCubit, ChangeDpState>(
  listener: (context, state) {
    if(state is ChangeDpLoaded)
      {
        if(changerPic.status=="ok")
          {

            AppUtils.showCustomSnackBar(context: context, message: "Successfully Change Profile Picture ", color: AppColors.greenColor);
            context.read<DashboardDataCubit>().loadDashboardData(SharedPrefs.generalGetEmpId(), DateTime.now().month.toString(), DateTime.now().year.toString());


            Navigator.pop(context);
          }}
        else if (state is ChangeDpInternetError)
          {
            AppUtils.showCustomSnackBar(context: context, message: "No Internet ", color: AppColors.redColor);

          }
        else{

      AppUtils.showCustomSnackBar(context: context, message: "Error Server ", color: AppColors.redColor);
    }


    // TODO: implement listener
  },
  child: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: ListView(
          //reverse: true,
          shrinkWrap: true,

          children: [
            SizedBox(height: 110.sp,),
            if (_imageFile != null) ...[
              Container(
                padding:  EdgeInsets.symmetric(horizontal: 18.0.sp),
                decoration: BoxDecoration(
                   color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Image.file(_imageFile!,fit: BoxFit.fitWidth,height: (400).sp,

                  filterQuality: FilterQuality.high,
                ),
              ),
               SizedBox(height: 20.sp),
            ],
           _imageFile==null? Container(
               padding:  EdgeInsets.symmetric(horizontal: 18.0.sp),
               decoration: BoxDecoration(
                   color: AppColors.primaryColor,
                   borderRadius: BorderRadius.circular(20)),
               child: CachedNetworkImage(
                 //dashboardData.personalInfo.dp,
                 fit: BoxFit.cover,
                 width: 400.sp,
                 height: 400.sp,
                 placeholder: (context, url) => Image.asset('assets/images/placeholder.jpeg'),
                 errorWidget: (context, url,dynamic) => Image.asset('assets/images/placeholder.jpeg'),
                 // errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                 //   return Image.asset('assets/images/placeholder.jpeg');
                 // },
                 imageUrl: widget.imagePath,
               )):SizedBox(height: 1.sp,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.camera),
                  child:  Text('Take Photo',style: GoogleFonts.poppins(color: AppColors.blueContainerColor,fontWeight: FontWeight.w600),),
                ),
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  child:  Text('Choose From Gallery',style: GoogleFonts.poppins(color: AppColors.blueContainerColor,fontWeight: FontWeight.w600),),
                ),
              ],
            ),
            SizedBox(height: 10.sp,),
            UnconstrainedBox(
              child: SizedBox(
                height: 50.sp,
                width: 125.sp,
                child:  Visibility(
                  visible: visibilityChangeButton,
                  child: ElevatedButton(onPressed: () {
                    //print(_imageFile?.absolute);
                 //   AppUtils.showCustomSnackBar(context: context, message: "to be evaluated with backend");
                    context.read<ChangeDpCubit>().changeDp(SharedPrefs.generalGetEmpId(), _imageFile?.path);

                  }, child: Row(
      children: [
        Expanded(child: Center(child: FittedBox(child: Text("Confirm",style: GoogleFonts.poppins(color: AppColors.blueContainerColor,fontWeight: FontWeight.w600),)))),
        Icon(Icons.done,color: AppColors.greenColor,)

      ],)
                ),
              ),
              ))
          ],
        ),
      ),
),
    );
  }

  Future<void> _requestPermission() async {
    final permissionStatus = await Permission.camera.request();
    if (permissionStatus != PermissionStatus.granted) {
      // Handle permission denied
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final permissionStatus = await Permission.storage.request();
    if (permissionStatus == PermissionStatus.granted) {
      final pickedFile = await ImagePicker().pickImage(

          source: source);
      if(pickedFile!=null) {

        final croppedFile = await _cropImage(File(pickedFile.path));
        if (croppedFile != null) {
          setState(() {
            _imageFile=File(croppedFile.path);
          });
        }

        visibilityChangeButton =true;
      }

      // setState(() {
      //
      // });
      // ...
    } else {
      AppUtils.showCustomSnackBar(context: context, message: "Please Grant Permission ",color: AppColors.redColor);
      // Handle permission denied
    }
  }

  Future<void> loadFile() async {
    _imageFile= (await rootBundle.loadString(widget.imagePath)) as File;

  }
   Future<CroppedFile?> _cropImage(File imageFile) async {
     final croppedFile = await ImageCropper().cropImage(
       maxHeight: 320,
       maxWidth: 320,
       sourcePath: imageFile.path,
       aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
       compressQuality: 100,
       compressFormat: ImageCompressFormat.png,


       uiSettings: [
         IOSUiSettings(
           title: 'Crop Image',
         ),
         AndroidUiSettings(
           toolbarTitle: 'Crop Image',
           toolbarColor: Colors.deepOrange,
           toolbarWidgetColor: Colors.white,
           initAspectRatio: CropAspectRatioPreset.square,
           lockAspectRatio: true,
         )
       ]
     );
     return croppedFile;
   }

// ...
}
