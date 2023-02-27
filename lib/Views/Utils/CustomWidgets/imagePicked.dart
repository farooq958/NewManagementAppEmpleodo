import 'dart:io';

import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: SizedBox(
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
                child: Image.file(_imageFile!,fit: BoxFit.fitWidth,height: (320).sp,

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
               child: Image.network(widget.imagePath,fit: BoxFit.fitHeight,height: (400).sp,width: 400.sp,)):SizedBox(height: 1.sp,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.camera),
                  child: const Text('Take Photo'),
                ),
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  child: const Text('Choose From Gallery'),
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
                    AppUtils.showCustomSnackBar(context: context, message: "to be evaluated with backend");
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
      final pickedFile = await ImagePicker().pickImage(source: source);
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
      AppUtils.showCustomSnackBar(context: context, message: "Please Grant Permission ");
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
