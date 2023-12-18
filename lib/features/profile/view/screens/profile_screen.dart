import 'package:bekya/core/shared/my_shared.dart';
import 'package:bekya/core/shared/my_shared_keys.dart';
import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/widgets/app_button.dart';
import 'package:bekya/features/favourites/view/screens/fav_screen.dart';
import 'package:bekya/features/login/view/screens/login_screen.dart';
import 'package:bekya/features/profile/view/widgets/item.dart';
import 'package:bekya/features/profile/view/widgets/profile_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                 ProfileHeader(
                  name: MyShared.getString(key: MySharedKeys.username),
                ),
                Item(
                  title: 'Favourites',
                  body: 'Al of your favourite ads',
                  icon: Icons.favorite_outline,
                  onTap: () {
                    push(context, const FavScreen());
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
                const Spacer(),
                AppButton(onPressed: (){
                  FirebaseAuth.instance.signOut().then((value) {
                    MyShared.clear().then((value) {
                      pushReplacement(context, LoginScreen());
                    });
                  });
                },
                label: "Sign Out",
                bgColor: AppColors.primary,
                margin: EdgeInsets.all(14.sp),
                padding: EdgeInsets.all(14.sp),
                borderRadius: BorderRadius.circular(13.sp),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
