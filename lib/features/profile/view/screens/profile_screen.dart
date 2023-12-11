import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/features/favourites/view/screens/fav_screen.dart';
import 'package:bekya/features/profile/view/widgets/item.dart';
import 'package:bekya/features/profile/view/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.second,
      body: LayoutBuilder(
        builder: (context, constrains) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constrains.maxHeight,
            ),
            child: IntrinsicHeight(
                child: Column(
              children: [
                const ProfileHeader(
                  name: 'Youssef',
                ),
                Item(
                  title: 'Favourites',
                  body: 'Al of your favourite ads',
                  icon: Icons.favorite_outline,
                  onTap: () {
                    push(context, FavScreen());
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Divider(
                    color: AppColors.offWhite,
                    thickness: 2.5.sp,
                  ),
                ),
                Item(
                  title: 'Settings',
                  body: 'Languages, Themes, Privacy',
                  icon: Icons.settings,
                  onTap: () {},
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Divider(
                    color: AppColors.offWhite,
                    thickness: 1.5.sp,
                  ),
                ),
                Item(
                  title: 'Help & Support',
                  body: 'Help Center and legal terms',
                  icon: Icons.help_outline,
                  onTap: () {},
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Divider(
                    color: AppColors.offWhite,
                    thickness: 1.2.sp,
                  ),
                ),
                Item(
                  title: 'Contact Us',
                  body: 'Contact us & add your complain',
                  icon: Icons.contacts_outlined,
                  onTap: () {},
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
