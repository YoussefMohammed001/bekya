import 'package:bekya/core/shared/my_shared.dart';
import 'package:bekya/core/shared/my_shared_keys.dart';
import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/features/chats/manager/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatScreen extends StatefulWidget {
    ChatScreen({super.key, required this.receiverId, required this.receiverName, required this.userName});
final String receiverId;
final String receiverName;
final String userName;
final cubit = ChatsCubit();
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => widget.cubit..getChat(chatId: widget.receiverId),
  child: BlocBuilder<ChatsCubit, ChatsState>(
  builder: (context, state) {
    return SafeArea(
      child:  Scaffold(

        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(14.sp),
              color: Colors.black,
              child: Row(
                children: [
                  const Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                  SizedBox(width: 2.w,),
                  Text(widget.userName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                  ),
                  const Spacer(),

                  const Icon(Icons.call,
                  color: Colors.white,
                  ),
                  SizedBox(width: 2.w,),
                  const Icon(Icons.more_vert_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[900],
                child: ListView.builder(
                  itemCount: widget.cubit.messages.length,
                  itemBuilder: (context, index) {
                  return Container(
                  width: 1.w,
                    alignment: widget.cubit.messages[index].senderId == MyShared.getString(key: MySharedKeys.userid)?
                    AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
                      child: Container(
                        margin: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                            color:   widget.cubit.messages[index].senderId ==  MyShared.getString(key: MySharedKeys.userid)?
                            Colors.red :
                            Colors.grey[800],
                            borderRadius:
                            BorderRadius.only(
                                topLeft: Radius.circular(12.sp),
                                topRight:   Radius.circular(12.sp),
                                bottomLeft:  widget.cubit.messages[index].senderId ==  MyShared.getString(key: MySharedKeys.userid)?  Radius.circular(12.sp) : Radius.circular(0.sp),
                                bottomRight:widget.cubit.messages[index].senderId ==  MyShared.getString(key: MySharedKeys.userid)?  Radius.circular(0.sp) : Radius.circular(12.sp)
                            )
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.sp,
                          vertical: 10.sp
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cubit.messages[index].message,
                            style:  TextStyle(
                              fontSize: 14.sp,


                              color: Colors.white
                            ),
                            ),
                            SizedBox(height: 1.h,),
                            Text(
                              widget.cubit.messages[index].dateTime  ,
                            style:  TextStyle(
                                fontSize: 12.sp,
                              color: Colors.grey[300]
                            ),
                            ),
                          ],
                        ),
                      ));
                },),
              ),
            ),
            Container(
              color: Colors.black,
              child: Row(
                children: [
                  const Icon(Icons.add,color: Colors.red,),
                  SizedBox(width: 3.w,),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 14.sp
                      ),
                      child: TextFormField(
                        onChanged: (value) {
setState(() {

});
                        },
                        maxLines: 10,
                        minLines: 1,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        style: const TextStyle(

                          color: Colors.white
                        ),
                        controller: widget.cubit.messageController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(

                            horizontal: 16.sp,
                            vertical: 10.sp
                          ),
                          disabledBorder: OutlineInputBorder(
                              gapPadding: 0,
                              borderRadius: BorderRadius.circular(18.sp)
                          ),
                          enabledBorder: OutlineInputBorder(
                              gapPadding: 0,
                              borderRadius: BorderRadius.circular(18.sp)
                          ),

                          border: OutlineInputBorder(
                            gapPadding: 0,
                            borderRadius: BorderRadius.circular(18.sp)
                          ),
                        hintText: "",
                          filled: true,
                          fillColor: Colors.grey.shade900,
                          focusedBorder: OutlineInputBorder(
                              gapPadding: 0,
                              borderRadius: BorderRadius.circular(18.sp)
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 3.w,),
                  CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 16.sp,
                  child:
                      widget.cubit.messageController.text.trim().isEmpty ?
                      IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_voice_outlined,
                        color: Colors.white,
                        size: 16.sp,
                      ))
                          :

                  IconButton(onPressed: (){
                    widget.cubit.sendMessage(receiverId: widget.receiverId, senderName: widget.receiverName);
setState(() {

});

                  }, icon: Icon(Icons.send,
                    color: Colors.white,
                    size: 16.sp,
                  )),
                )
                ],
              ),
            ),
          ],
        ),
      ),

    );
  },
),
);
  }
}
