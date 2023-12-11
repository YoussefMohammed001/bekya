import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/widgets/app_button.dart';
import 'package:bekya/core/widgets/app_text_field.dart';
import 'package:bekya/features/main/view/screens/main_screen.dart';
import 'package:bekya/features/register/view/screens/register_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
final TextEditingController emailEditingController = TextEditingController();
final TextEditingController passEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.second,
      body:   Container(
        margin: EdgeInsets.all(15.sp),
        child: LayoutBuilder(
          builder: (context, constrains) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constrains.maxHeight,
              ),
              child:    IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                     Text("BEKYA",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.offWhite,
                        fontSize: 30.sp,
                      ),),
                    SizedBox(height: 2.h,),
                    AppTextField(hint: "example@email.com",
                        keyboardType: TextInputType.emailAddress,
                        icon: Icons.email_outlined,
                        controller: emailEditingController,
                        isPassword: false,
                        textInputAction: TextInputAction.next,
                        title: "Email"),
                    SizedBox(height: 2.h,),
                    AppTextField(hint: "**************",
                        keyboardType: TextInputType.visiblePassword,
                        icon: Icons.password,
                        controller: passEditingController,
                        isPassword: true,
                        textInputAction: TextInputAction.done,
                        title: "Password"),
                    SizedBox(height: 2.h,),
                    InkWell(
                      onTap: () {
                        /// /// /// /// /// /// /// /// /// ///
                      },
                      child: Container(
                        alignment: AlignmentDirectional.centerEnd,
                        child: const Text("Forget Password",
                          style: TextStyle(
                              color: AppColors.offWhite,
                          ),),
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    AppButton(
                      margin: const EdgeInsets.all(0),
                        padding: EdgeInsets.all(12.sp),
                        bgColor: AppColors.primary,
                        borderRadius: BorderRadius.circular(12.sp),
                        onPressed: (){

                        push(context, MainScreen());
                        },
                        label: "Sign In"),
                    SizedBox(height: 2.h,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const Text("Don't have account?",
                        style: TextStyle(
                          color: AppColors.offWhite,
                        ),),
                        SizedBox(width: 1.w,),
                        InkWell(
                          onTap: () {
                            push(context, RegisterScreen());
                          },
                          child: const Text("Sign Up",
                          style: TextStyle(
                            color: AppColors.primary,
                          ),),
                        ),

                    ],)

                  ],),
              ),
            ),
          ),
        ),
      )
    );
  }
}
