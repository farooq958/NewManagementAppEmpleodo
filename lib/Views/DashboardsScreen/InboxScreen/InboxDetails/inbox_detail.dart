
import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/PageTransitions/scale_page_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'application_info.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var check=true;
    return Scaffold(
      resizeToAvoidBottomInset: true,
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: AppColors.blueContainerColor,

              // Status bar brightness (optional)
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            backgroundColor: AppColors.primaryColor,
            // automaticallyImplyLeading: true,
            centerTitle: true,
            title: Text(
              "Chats",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, color: AppColors.greyColor),
            ),
            leading: InkWell(
              onTap: (){


                Navigator.pop(context);
              },
              child: Center(
                  child: Image.asset(
                AppImages.backButton,
                fit: BoxFit.fitHeight,
                height: 20.sp,
                width: 20.sp,
              )),
            )),
        body: SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: Column(
                // shrinkWrap: true,

                children: [
                  SizedBox(
//color: AppColors.purpleColor,
                    height: 50.sp,
                    width: 1.sw,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 2.sp,
                        ),

                        ///profile Pic
                        Expanded(
                          child: UnconstrainedBox(
                            child: Container(
                              height: 50.sp,
                              width: 50.sp,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.sp),
                                color: AppColors.blueContainerColor,
                              ),
                              child: CircleAvatar(
                                  backgroundColor: AppColors.greenColor,

                                  maxRadius: 30.sp,
                                  backgroundImage: const AssetImage(
                                      "assets/images/face3.jpeg"),


                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.sp,
                        ),

                        ///Name and Type
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: FittedBox(
                                          child: Text(
                                        "Muhammad Farooq ",
                                        style: GoogleFonts.poppins(
                                            color: AppColors.greyColor,
                                            fontWeight: FontWeight.w600),
                                      )))),
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: FittedBox(
                                          child: Text('Time Adjustment',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      AppColors.greyColor2,fontSize: 14.sp)))))
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 18.0.sp),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        "wed Feb 8 2023",
                                        style: GoogleFonts.poppins(
                                            color: AppColors.greyColor2,fontSize: 14.sp),
                                      ))),
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: InkWell(
                                          onTap: () {
                                           // print("eye tap");
                                            Navigator.push(context, ScalePageTransition.scalePageTransition(page: const ApplicationInfo(), alignment: Alignment.centerRight));


                                          },
                                          child: Icon(
                                            Icons.remove_red_eye_sharp,
                                            color: AppColors.yellowColor,
                                            size: 25.sp,
                                          )))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.greyColor,
                    thickness: 1.6,
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          bottom: 60,
                          width: 1.sw,
                          child: ListView.builder(

                           // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
//padding: EdgeInsets.only(  bottom: MediaQuery.of(context).viewInsets.bottom + 10,),
                           // controller: _controller,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            reverse: true,
                            cacheExtent: 1000,
                            //itemCount: MessagesModel.messages.length,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                             // var message = MessagesModel.messages[MessagesModel.messages.length - index - 1];
                            //  (message['sender'] == widget.user)
                              return check==true
                                  ? ChatBubble(
                                clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                                alignment: Alignment.topRight,
                                margin: const EdgeInsets.only(top: 5, bottom: 5),
                                backGroundColor: Colors.yellow[100],
                                child: Container(
                                  constraints: BoxConstraints(maxWidth: 1.sw * 0.7),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      // Text('@${message['time']}', style: TextStyle(color: Colors.grey, fontSize: 10)),
                                      // Text('${message['message']}', style: TextStyle(color: Colors.black, fontSize: 16))

                                      Text("From Sender Hi !")
                                    ],
                                  ),
                                ),
                              )
                                  : ChatBubble(
                                clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(top: 5, bottom: 5),
                                backGroundColor: Colors.grey[100],
                                child: Container(
                                  constraints: BoxConstraints(maxWidth: 1.sw * 0.7),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      // Text('${message['sender']} @${message['time']}', style: TextStyle(color: Colors.grey, fontSize: 10)),
                                      // Text('${message['message']}', style: TextStyle(color: Colors.black, fontSize: 16))

                                    Text("From Reciever Bye!")
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        Positioned(
                            bottom:  0,
                            child:  Container(
                              height: 65.sp,
                             decoration: BoxDecoration(
                               color: AppColors.primaryColor,
                               border: Border.all(color: AppColors.borderColorgrey)

                             ),
                              child: SingleChildScrollView(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 1.sw * 0.80,
                                      padding:
                                           EdgeInsets.only(left: 10.sp, right: 5.sp),
                                      child:  TextFormField(

                                      //  scrollPhysics: ClampingScrollPhysics(),

                                        controller: AppControllers.chatMessageController,
                                        cursorColor: AppColors.blueContainerColor,
                                        decoration: InputDecoration(
                                          hintText: "Message",
                                          labelStyle: TextStyle(
                                              fontSize: 15.sp, color: Colors.black),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: AppColors.borderColorgrey),
                                          ),
                                          focusedBorder: const UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          disabledBorder: const UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          counterText: '',
                                        ),
                                        style: GoogleFonts.poppins(fontSize: 15.sp),
                                        keyboardType: TextInputType.text,
                                        maxLength: 500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1.sw * 0.20,
                                      child: IconButton(
                                        icon:  Icon(Icons.send,
                                            color: AppColors.buttonColor),
                                        onPressed: () {
                                          ///send icon pressed
                                          // _sendMessage();
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ])));
  }
}
