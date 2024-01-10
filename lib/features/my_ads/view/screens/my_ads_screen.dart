import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/widgets/main_product_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(13.sp),
          child: Text(
            "My Ads",
            style: TextStyle(
                color: AppColors.offWhite,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return MainProductItem(
                price: 'EGP 1,000,000',
                title:
                    'sdf sdfsdf sdf sdfsd fsd f sdf dsf sdf sd fds fsd f sdf dsf dsf sd fsd fsdf s',
                date: '3 days ago.',
                city: 'Cairo, Future City',
                bed: 5,
                bath: 7,
                area: 500,
                isFav: false,
                image:
                    'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dmlsbGF8ZW58MHx8MHx8fDA%3D',
                onFavTap: () {},
                productId: '',
                catId: '',
              );
            },
            itemCount: 2,
          ),
        ),
      ],
    );
  }
}
