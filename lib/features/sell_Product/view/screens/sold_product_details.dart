import 'dart:io';

import 'package:bekya/core/shared/my_shared.dart';
import 'package:bekya/core/shared/my_shared_keys.dart';
import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/utils/safe_print.dart';
import 'package:bekya/core/utils/snack_bar.dart';
import 'package:bekya/core/widgets/app_button.dart';
import 'package:bekya/core/widgets/congrats_screen.dart';
import 'package:bekya/features/sell_Product/manager/sell_product__cubit.dart';
import 'package:bekya/features/sell_Product/model/appliances_model.dart';
import 'package:bekya/features/sell_Product/model/fashion_mode.dart';
import 'package:bekya/features/sell_Product/model/furniture_model.dart';
import 'package:bekya/features/sell_Product/model/mobiles_model.dart';
import 'package:bekya/features/sell_Product/model/pets_model.dart';
import 'package:bekya/features/sell_Product/model/sell_base_model.dart';
import 'package:bekya/features/sell_Product/model/sell_property.dart';
import 'package:bekya/features/sell_Product/model/vehicles_model.dart';
import 'package:bekya/features/sell_Product/view/widgets/add_photos_widget.dart';
import 'package:bekya/features/sell_Product/view/widgets/appliances_fashion_sell.dart';
import 'package:bekya/features/sell_Product/view/widgets/main_sold_details_item.dart';
import 'package:bekya/features/sell_Product/view/widgets/mobile_sell_item.dart';
import 'package:bekya/features/sell_Product/view/widgets/pet_sell.dart';
import 'package:bekya/features/sell_Product/view/widgets/property_sold_item.dart';
import 'package:bekya/features/sell_Product/view/widgets/vehicles_sell_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class SoldProductDetails extends StatefulWidget {
  const SoldProductDetails(
      {super.key,
      required this.image,
      required this.id,
      required this.category});
  final String image, id, category;

  @override
  State<SoldProductDetails> createState() => _SoldProductDetailsState();
}

class _SoldProductDetailsState extends State<SoldProductDetails> {

List<String> downloadUrls = [];
  List<XFile> imageFileList = [];
  final cubit = SellProductCubit();

  Future<List<String>> uploadImages(List<XFile> imageFileList) async {
    showLoading(context);
    for (XFile image in imageFileList) {
      File file = File(image.path);
      String fileName = file.path.split('/').last;

      try {
        Reference storageReference = FirebaseStorage.instance.ref().child('images/$fileName');
        UploadTask uploadTask = storageReference.putFile(file);

        TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);

        // Get download URL
        String downloadUrl = await snapshot.ref.getDownloadURL();

        downloadUrls.add(downloadUrl);

        safePrint('Image uploaded: $downloadUrl');
      } catch (e) {
        safePrint('Error uploading image: $e');
      }
    }
    safePrint(downloadUrls);
    setState(() {

    });
    // ignore: use_build_context_synchronously
    pop(context);
    return downloadUrls;
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        bottomNavigationBar: BlocConsumer<SellProductCubit, SellProductState>(
          listener:  (context, state) {
            if(state is SellProductSuccess){
              pushReplacement(context, const AppCongrats(
                  title: "Product published!", icon: "done.png"));



            }
          },
  builder: (context, state) {
   if(state is SellProductLoading){
     return const Center(child: CircularProgressIndicator());
   } else{
     return AppButton(
       bgColor: AppColors.primary,
       padding: EdgeInsets.all(10.sp),
       margin: EdgeInsets.all(15.sp),
       borderRadius: BorderRadius.circular(13.sp),
       onPressed: () {
         if(context.read<SellProductCubit>().mainFormKey.currentState!.validate()){
           safePrint(imageFileList);

           if(imageFileList.isNotEmpty){
             uploadImages(imageFileList).then((value) {
               DateTime currentDate = DateTime.now();

               cubit.sellProduct(
                   catId: widget.id,
                   vehiclesModel: VehiclesModel(
                     context.read<SellProductCubit>().vehiclesNameEditingController.text,
                     context.read<SellProductCubit>().vehiclesModelEditingController.text,
                     context.read<SellProductCubit>().vehiclesColorEditingController.text,
                     context.read<SellProductCubit>().vehiclesTypeEditingController.text,
                   ),
                   sellBaseModel:
                   SellBaseModel(context.read<SellProductCubit>().titleEditingController.text,
                     widget.category, context.read<SellProductCubit>().priceEditingController.text,
                     context.read<SellProductCubit>().descriptionEditingController.text,
                     context.read<SellProductCubit>().location.dropDownValue!.value ,
                     downloadUrls,
                     MyShared.getString(
                       key: MySharedKeys.userid,),
                     MyShared.getString(
                       key: MySharedKeys.username,),
                     MyShared.getString(
                       key: MySharedKeys.userImage),
                       widget.id,currentDate.toString()

                   ),
                   propertyModel: PropertyModel(
                       context.read<SellProductCubit>().areaEditingController.text,
                       context.read<SellProductCubit>().bathRoomsEditingController.text,
                       context.read<SellProductCubit>().bedRoomsEditingController.text,
                       context.read<SellProductCubit>().propertyType.dropDownValue?.value
                       ?? ""
                   ),


                   mobilesModel: MobilesModel(context.read<SellProductCubit>().mobileModelEditingController.text,
                       context.read<SellProductCubit>().mobileConditionEditingController.text,
                       context.read<SellProductCubit>().mobileRamEditingController.dropDownValue?.value ?? ""
                       ,

                       context.read<SellProductCubit>().mobileStorageEditingController.dropDownValue?.value ?? ""),
                   appliancesModel: AppliancesModel(context.read<SellProductCubit>().appliancesModelEditingController.text,
                       context.read<SellProductCubit>().appliancesConditionEditingController.text),
                   furnitureModel: FurnitureModel(context.read<SellProductCubit>().appliancesModelEditingController.text,
                       context.read<SellProductCubit>().appliancesConditionEditingController.text
                   ),
                   petsModel: PetsModel(context.read<SellProductCubit>().petNameEditingController.text,
                       context.read<SellProductCubit>().petAgeEditingController.text),
                   fashionModel: FashionModel(context.read<SellProductCubit>().appliancesModelEditingController.text,
                       context.read<SellProductCubit>().appliancesConditionEditingController.text)

               );
             });
           }else{
             snackBar(context, "Please choose at least 1 image", Colors.red);

           }

         }


       },
       label: 'Confirm',
     );
   }

  },
),
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
                child: Form(
                  key: cubit.mainFormKey,
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
                       AddPhotosWidgets(imageFileList: imageFileList,),
                      MainSoldDetailsItem(
                        image: widget.image,
                        id: widget.id,
                        category: widget.category,
                      ),


                      widget.id == '1' ?
                      const VehiclesSellItem(

                      )
                          :
                      widget.id == '2' ?
                        const PropertySoldItem(
                        )
                          :
                          widget.id == "3" ?
                          const MobileSellItem(

                          )
                              :
                              widget.id == "4" ?
                              const AppliancesFashionSell(

                              )
                                  :
                                  widget.id == "5" ?
                                  const AppliancesFashionSell()
                                      :
                                      widget.id == "6"?
                                      const PetSell(

                                      )
                                          :
                                      const AppliancesFashionSell()

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future showLoading(BuildContext context){
    return showDialog(context: context, builder: (context) => const Stack(
      alignment: AlignmentDirectional.center,
      children: [CircularProgressIndicator()],),);

  }
}
