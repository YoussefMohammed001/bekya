import 'package:bekya/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.name});
final String name;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  EdgeInsets.all(15.sp),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primary,
            radius: 25.sp,
            child: Text("Y",style: TextStyle(
                color: AppColors.offWhite,
                fontSize: 28.sp
            ),),
          ),
          SizedBox(width: 5.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,style: TextStyle(
                  color: AppColors.offWhite,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold
              ),),
              Text("View and edit profile",style: TextStyle(
                color: AppColors.offWhite,
                fontSize: 17.sp,

              ),),
            ],
          ),
        ],
      ),
    );
  }
}
