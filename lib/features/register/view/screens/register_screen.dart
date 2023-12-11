import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/widgets/app_button.dart';
import 'package:bekya/core/widgets/app_text_field.dart';
import 'package:bekya/features/login/view/screens/login_screen.dart';
import 'package:bekya/features/register/manager/register_cubit.dart';
import 'package:bekya/features/register/model/register_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController nameEditingController = TextEditingController();

  final TextEditingController emailEditingController = TextEditingController();

  final TextEditingController mobileEditingController = TextEditingController();

  final TextEditingController passEditingController = TextEditingController();

  final TextEditingController rePassEditingController = TextEditingController();

  final cubit = RegisterCubit();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Form(
        key:  _formKey,
        child: Scaffold(
            backgroundColor: AppColors.second,
            body: Container(
              margin: EdgeInsets.all(15.sp),
              child: LayoutBuilder(
                builder: (context, constrains) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constrains.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            "BEKYA",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.offWhite,
                              fontSize: 30.sp,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          AppTextField(
                            validators: (value) {
                              if(value!.isEmpty){
                                return "This field is Required";
                              }
                              return null;
                            },
                              hint: "Mohamed Salah",
                              keyboardType: TextInputType.name,
                              icon: Icons.person_outline_rounded,
                              controller: nameEditingController,
                              isPassword: false,
                              textInputAction: TextInputAction.next,
                              title: "Name"),
                          SizedBox(
                            height: 2.h,
                          ),
                          AppTextField(
                              validators: (value) {
                                if(value!.isEmpty){
                                  return "This field is Required";
                                }
                                return null;
                              },
                              hint: "example@email.com",
                              keyboardType: TextInputType.emailAddress,
                              icon: Icons.email_outlined,
                              controller: emailEditingController,
                              isPassword: false,
                              textInputAction: TextInputAction.next,
                              title: "Email"),
                          SizedBox(
                            height: 2.h,
                          ),
                          AppTextField(
                              validators: (value) {
                                if(value!.isEmpty){
                                  return "This field is Required";
                                }
                                return null;
                              },
                              hint: "01008451421",
                              keyboardType: TextInputType.number,
                              icon: Icons.phone_android_outlined,
                              controller: mobileEditingController,
                              isPassword: false,
                              textInputAction: TextInputAction.next,
                              title: "Mobile Number"),
                          SizedBox(
                            height: 2.h,
                          ),
                          AppTextField(
                              validators: (value) {
                                if(value!.isEmpty){
                                  return "This field is Required";
                                }

                                return null;
                              },
                              hint: "**************",
                              keyboardType: TextInputType.visiblePassword,
                              icon: Icons.password,
                              controller: passEditingController,
                              isPassword: true,
                              textInputAction: TextInputAction.next,
                              title: "Password"),
                          SizedBox(
                            height: 2.h,
                          ),
                          AppTextField(
                              validators: (value) {
                                if(value!.isEmpty){
                                  return "This field is Required";
                                }

                                return null;
                              },
                              hint: "**************",
                              keyboardType: TextInputType.visiblePassword,
                              icon: Icons.password,
                              controller: rePassEditingController,
                              isPassword: true,
                              textInputAction: TextInputAction.done,
                              title: "Re - Password"),
                          SizedBox(
                            height: 2.h,
                          ),

                          SizedBox(
                            height: 2.h,
                          ),
                          AppButton(
                              margin: const EdgeInsets.all(0),
                              padding: EdgeInsets.all(12.sp),
                              bgColor: AppColors.primary,
                              borderRadius: BorderRadius.circular(12.sp),
                              onPressed: () {
                          if(_formKey.currentState!.validate()){
                            cubit.register(
                                registerData: RegisterData(
                                  email: emailEditingController.text,
                                  pass: passEditingController.text,
                                  mobile: mobileEditingController.text,
                                  image: '',
                                  id: 0,
                                  name: nameEditingController.text,
                                ));
                          }
                              },
                              label: "Sign Up"),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have account?",
                                style: TextStyle(
                                  color: AppColors.offWhite,
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              InkWell(
                                onTap: () {
                                  push(context, LoginScreen());
                                },
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
