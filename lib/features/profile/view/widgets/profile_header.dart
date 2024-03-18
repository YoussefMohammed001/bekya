import 'package:bekya/core/shared/my_shared.dart';
import 'package:bekya/core/shared/my_shared_keys.dart';
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
            child: Text(name.substring(0,1).toUpperCase(),style: TextStyle(
                color: AppColors.offWhite,
                fontSize: 28.sp
            ),),
          ),
          SizedBox(width: 5.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(name,style: TextStyle(
                      color: AppColors.offWhite,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold
                  ),),
                   SizedBox(width: 1.w,),
                   MyShared.getBoolean(key: MySharedKeys.isVerified)  ?
                   Icon(Icons.verified_user_outlined,color: AppColors.primary,)
                       :
                Icon(Icons.error_outline,color: AppColors.primary,)
                ],
              ),
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
