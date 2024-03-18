import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/safe_print.dart';
import 'package:bekya/features/chats/manager/chats_cubit.dart';
import 'package:bekya/features/chats/view/widgets/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});

  final cubit = ChatsCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getChats(),
      child: Scaffold(

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


              child: BlocBuilder<ChatsCubit, ChatsState>(
                builder: (context, state) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      safePrint("======> ${cubit.chats.length}");
                      return ChatItem(
                        image: 'M', name: cubit.chats[index].name,
                        message: '............',
                        date: '24/11', receiverId: cubit.chats[index].id,);
                    },


                    itemCount: cubit.chats.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Divider(


                          thickness: 1.sp,


                          color: Colors.grey[200],
                        ),

                      );
                    },
                  );
                },
              ),
            ),
          ],),
      ),
    );
  }
}
