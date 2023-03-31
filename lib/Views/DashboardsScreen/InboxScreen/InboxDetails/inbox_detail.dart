
import 'package:cached_network_image/cached_network_image.dart';
import 'package:empleado_development/Controller/Cubits/Inbox/chat_socket_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Inbox/inbox_application_detail_page_view_cubit.dart';
import 'package:empleado_development/Controller/Cubits/Inbox/inbox_application_details_cubit.dart';
import 'package:empleado_development/Controller/Repository/inbox_repo.dart';
import 'package:empleado_development/Controller/UtilsData/app_controllers.dart';
import 'package:empleado_development/Model/DashboardModel/dashboard_controller.dart';
import 'package:empleado_development/Model/InboxModel/inbox_stories_model_controller.dart';
import 'package:empleado_development/Views/Utils/Data/app_colors.dart';
import 'package:empleado_development/Views/Utils/Data/app_files.dart';
import 'package:empleado_development/Views/Utils/Data/utils.dart';
import 'package:empleado_development/Views/Utils/PageTransitions/scale_page_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'application_info.dart';

class ChatScreen extends StatefulWidget {
  final int ind;
  const ChatScreen({Key? key, required this.ind}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {

    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) => {

    context.read<ChatSocketCubit>().loadInboxChat(inboxStoriesController.stories[widget.ind].storyId)


    });
    InboxRepo().initSocket(context, inboxStoriesController.stories[widget.ind].storyId);
   socketStart();
//BlocProvider.of<ChatSocketCubit>(context,listen: false).loadInboxChat(inboxStoriesController.stories[widget.ind].storyId);

    super.initState();

  }

  void socketStart() {
    InboxRepo.socket.on("message received", (data)  async {



      await InboxRepo().getChatsData(inboxStoriesController.stories[widget.ind].storyId);
       if (mounted) {
         setState(() {

         });
       }

       //context.read<ChatSocketCubit>().loadInboxChat(storyId);
       //BlocProvider.of<ChatSocketCubit>(context,listen: false).loadInboxChat(storyId);

     });
  }
  // @override
  // void didUpdateWidget(covariant ChatScreen oldWidget) {
  //
  //   // TODO: implement didUpdateWidget
  //   super.didUpdateWidget(oldWidget);
  // }


  // @override
  // void didChangeDependencies() {
  //
  //
  //
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }
  @override
  void dispose() {

   // AppControllers.chatMessageController.dispose();
    InboxRepo.socket.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        InboxRepo.socket.disconnect();
        return true;
      },
      child: Scaffold(
        key: AppControllers.scaffoldKey,
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
                  InboxRepo.socket.disconnect();


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
                            child:UnconstrainedBox(
                              child: Container(
                                  height: 50.sp,
                                  width: 50.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.sp),
                                    color: AppColors.blueContainerColor,
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.greenColor,
                                    //backgroundImage:  NetworkImage(dashboardData.personalInfo.dp),
                                    //maxRadius: 100.sp,
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        //dashboardData.personalInfo.dp,
                                        fit: BoxFit.cover,
                                        width: 127.sp,
                                        height: 127.sp,
                                        placeholder: (context, url) => Image.asset('assets/images/placeholder.jpeg'),
                                        errorWidget: (context, url,dynamic) => Image.asset('assets/images/placeholder.jpeg'),
                                        // errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                        //   return Image.asset('assets/images/placeholder.jpeg');
                                        // },
                                        imageUrl: AppUtils.addThumbToImageUrl(dashboardData.personalInfo.dp),
                                      ),
                                    ),
                                  )
                              ),
                            )
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
                                              inboxStoriesController.stories[widget.ind].userInfo.dbData.fullName,
                                          style: GoogleFonts.poppins(
                                              color: AppColors.greyColor,
                                              fontWeight: FontWeight.w600),
                                        )))),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: FittedBox(
                                            child: Text(inboxStoriesController.stories[widget.ind].type!="LEAVE_REQUEST"?"Time Adjustment":"Leave Request",
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
                                          AppUtils.formatDateForInbox(inboxStoriesController.stories[widget.ind].entryTime),
                                          style: GoogleFonts.poppins(
                                              color: AppColors.greyColor2,fontSize: 14.sp),
                                        ))),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: InkWell(
                                            onTap: () {
                                             // print("eye tap");
                                              Navigator.push(context, ScalePageTransition.scalePageTransition(page:  ApplicationInfo(type: inboxStoriesController.stories[widget.ind].type=="LEAVE_REQUEST"?false:true,), alignment: Alignment.centerRight));
  context.read<InboxApplicationDetailsCubit>().loadInboxApplicationDetails(inboxStoriesController.stories[widget.ind].typeRef, inboxStoriesController.stories[widget.ind].type=="LEAVE_REQUEST"?false:true);
context.read<InboxApplicationDetailPageViewCubit>().setPageIndex(0);
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
                      child:

       BlocConsumer<ChatSocketCubit, ChatSocketState>(
  listener: (context, state) {
      // TODO: implement listener
  },
  builder: (context, state) {
      return Stack(
                        children: [
                          Positioned(
                            top: 0,
                            bottom: 60,
                            width: 1.sw,
                            child: state is ChatSocketLoaded?
        ListView.builder(
          controller: AppControllers.chatScrollController,

                             // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
//padding: EdgeInsets.only(  bottom: MediaQuery.of(context).viewInsets.bottom + 10,),
                             // controller: _controller,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              reverse: true,
                              cacheExtent: 1000,
                              //itemCount: MessagesModel.messages.length,
                              itemCount: inboxChatController.messages.length,
                              itemBuilder: (BuildContext context, int index) {
                               // var message = MessagesModel.messages[MessagesModel.messages.length - index - 1];
                              //  (message['sender'] == widget.user)
                                return  inboxChatController.messages[index].type=="GENERAL"
                                    ? ChatBubble(
                                  clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                                  alignment: Alignment.topRight,
                                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                                  backGroundColor: Colors.yellow[100],
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: 1.sw * 0.7),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  [
                                        // Text('@${message['time']}', style: TextStyle(color: Colors.grey, fontSize: 10)),
                                        // Text('${message['message']}', style: TextStyle(color: Colors.black, fontSize: 16))

                                        Text(inboxChatController.messages[index].message)
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
                                      children:  [
                                        // Text('${message['sender']} @${message['time']}', style: TextStyle(color: Colors.grey, fontSize: 10)),
                                        // Text('${message['message']}', style: TextStyle(color: Colors.black, fontSize: 16))

                                        Text(inboxChatController.messages[index].message)
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ):
                                const SizedBox()
                          ),

                          Positioned(
                              bottom:  0,
                              child:  Container(
                                height: 65.sp,
                               margin:EdgeInsets.only(left: 10.sp,right: 10.sp),
                               decoration: BoxDecoration(
                                 color: AppColors.primaryColor,
                                 border: Border.all(color: AppColors.borderColorGrey),
                                 borderRadius: BorderRadius.circular(12.sp)

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
                                                  BorderSide(color: AppColors.borderColorGrey),
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
                                       // width: 1.sw * 0.20,
                                        child: IconButton(
                                          icon:  Icon(Icons.send,
                                              color: AppColors.buttonColor),
                                          onPressed: () {
                                            ///send icon pressed
         InboxRepo().sendChatsData(inboxChatController.story.id,context);

                                            // _sendMessage();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      );


  },)

                    ),
                  ]))),
    );
  }
}
