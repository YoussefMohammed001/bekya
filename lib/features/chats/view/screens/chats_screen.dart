import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/features/chats/view/widgets/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.second,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          margin: EdgeInsets.all(13.sp),
          child: Text(
            "Chats",
            style: TextStyle(
                color: AppColors.offWhite,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return const ChatItem(image: 'M', name: 'Mohamed', message: '............', date: '24/11',);
            },
            itemCount: 12, separatorBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Divider(
                thickness: 1.sp,
                color: Colors.grey[200],
                ),
              );
              },
          ),
        ),
      ],),
    );
  }
}
