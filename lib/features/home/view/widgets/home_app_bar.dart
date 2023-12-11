import 'package:bekya/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text('BEKYA',
            style: TextStyle(
              color: AppColors.offWhite,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 1.h,),
            Row(
              children: [
                Icon(Icons.location_on_outlined,color: AppColors.primary,),
                SizedBox(width: 2.w,),
                Text("Cairo,Egypt",style:  TextStyle(color: AppColors.offWhite),),
                Icon(Icons.keyboard_arrow_down_outlined,color: AppColors.offWhite,),
                Spacer(),
                IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none,color: AppColors.offWhite,)),
              ],
            ),
            SizedBox(height: 1.h,)
          ],
        ),
        Container(
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(13.sp),
             border: Border.all(
    color: AppColors.offWhite
    )),
       padding: EdgeInsets.all(18.sp),
          child: Row(children: [
            const Icon(Icons.search,color: AppColors.offWhite,),
            SizedBox(width: 3.w,),
            const Text("Search For Bekya",style: TextStyle(color: AppColors.offWhite, fontWeight:
            FontWeight.bold),
            )
          ],),
        )

      ],
    );
  }
}
