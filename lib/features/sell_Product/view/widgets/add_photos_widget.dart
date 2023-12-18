import 'dart:io';
import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/safe_print.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddPhotosWidgets extends StatefulWidget {
  const AddPhotosWidgets({super.key});

  @override
  State<AddPhotosWidgets> createState() => _AddPhotosWidgetsState();
}

class _AddPhotosWidgetsState extends State<AddPhotosWidgets> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile> selectedImages = await
    imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    safePrint("Image List Length:${imageFileList!.length}");
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      margin: EdgeInsets.all(15.sp),
      child: Column(
        children: [
          Container(
            color: Colors.grey[800],
            child: Row(
              children: [
                Text(
                  "  Upload up to 20 images",
                  style: TextStyle(
                      color: AppColors.offWhite,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(onPressed:selectImages,
                  icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.offWhite,
                ))

              ],
            ),
          ),

          Container(
            width: double.infinity,
            color: Colors.grey[900],
            height: 20.h,
            child: imageFileList!.isNotEmpty ?SizedBox(
              height: 5.h,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(imageFileList!.length, (index) {
                    return Container(
                      margin: EdgeInsets.all(12.sp),
                      child: Image.file(File(imageFileList![index].path),
                        height: 10.h,
                        width: 20.w,
                      ),
                    );
                  })),
            ) :


            InkWell(
              onTap: selectImages,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.camera_alt_outlined,color: AppColors.primary,),
                  Text(
                    "Add Photos",

                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
