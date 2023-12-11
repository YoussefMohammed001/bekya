import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/widgets/main_product_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.offWhite),
        backgroundColor: AppColors.second,
      ),
      backgroundColor: AppColors.second,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(13.sp),
            child: Text(
              "Favourites",
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
                  isFav: true,
                  image:

                      'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dmlsbGF8ZW58MHx8MHx8fDA%3D',
                  onFavTap: () {},
                );
              },
              itemCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
