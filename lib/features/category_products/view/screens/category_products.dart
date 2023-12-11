import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/widgets/main_product_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        toolbarHeight: 0,
      ),
      backgroundColor: AppColors.second,
      body: Column(
        children: [
          Container(
            color: Colors.grey[900],
            padding: EdgeInsets.all(13.sp),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.offWhite,
                    )),
                Text(
                  "Mobiles",
                  style: TextStyle(
                      color: AppColors.offWhite,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
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
