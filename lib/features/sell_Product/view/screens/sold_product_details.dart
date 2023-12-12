import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/utils/safe_print.dart';
import 'package:bekya/core/widgets/app_button.dart';
import 'package:bekya/features/sell_Product/view/widgets/add_photos_widget.dart';
import 'package:bekya/features/sell_Product/view/widgets/main_sold_details_item.dart';
import 'package:bekya/features/sell_Product/view/widgets/property_sold_item.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SoldProductDetails extends StatelessWidget {
  SoldProductDetails({super.key, required this.image, required this.id, required this.category});
final String image,id,category;

TextEditingController priceEditingController = TextEditingController();

TextEditingController titleEditingController = TextEditingController();

TextEditingController descriptionEditingController = TextEditingController();

SingleValueDropDownController type = SingleValueDropDownController();

  TextEditingController bedRoomsEditingController = TextEditingController();

  TextEditingController bathRoomsEditingController = TextEditingController();

  TextEditingController areaEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppButton(
        bgColor: AppColors.primary,
        padding: EdgeInsets.all(10.sp),
        margin: EdgeInsets.all(15.sp),
        borderRadius: BorderRadius.circular(13.sp),
        onPressed: () {safePrint(id);
        },
        label: 'Confirm',),
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        toolbarHeight: 0,
      ),
      backgroundColor: AppColors.second,
      body: LayoutBuilder(

      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,

          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            Icons.close,
                            color: AppColors.offWhite,
                          )),
                      Text(
                        "Include some details",
                        style: TextStyle(
                            color: AppColors.offWhite,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const AddPhotosWidgets(),
                MainSoldDetailsItem(image: image,
                  priceEditingController: priceEditingController,
                  titleEditingController: titleEditingController,
                  descriptionEditingController: descriptionEditingController,
                  id: id,
                  category:category,
                ),
              if (id == '2') PropertySoldItem(type: type,
                  bedRoomsEditingController: bedRoomsEditingController,
                  bathRoomsEditingController: bathRoomsEditingController,
                  areaEditingController: areaEditingController,) else const SizedBox(),






              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
