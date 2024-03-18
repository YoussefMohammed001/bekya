import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/features/chats/view/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.image, required this.name, required this.message, required this.date, required this.receiverId});
final String image,name,message,date,receiverId;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => push(context,  ChatScreen(receiverId: receiverId, receiverName: name, userName: name,)),
      child: Container(
        margin: EdgeInsets.all(13.sp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.
          center,
          children: [
            CircleAvatar(
              radius: 20.sp,
              backgroundColor: AppColors.primary,
              child: Text(name.substring(0,1).toUpperCase(),style: TextStyle(
                  color: AppColors.offWhite,
                  fontSize: 15.sp
              ),),
            ),
            SizedBox(width: 2.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: AppColors.offWhite,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold),
                  ),

                  Text(
                    message,
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              date,
              style: TextStyle(
                color: AppColors.offWhite,
                fontSize: 15.sp,
              ),
            ),
          ],),
      ),
    );
  }
}
