import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/widgets/app_button.dart';
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
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class SoldProductDetails extends StatelessWidget {
  SoldProductDetails(
      {super.key,
      required this.image,
      required this.id,
      required this.category});

  final String image, id, category;

  TextEditingController priceEditingController = TextEditingController();
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController cityEditingController = TextEditingController();

  TextEditingController vehiclesNameEditingController = TextEditingController();
  TextEditingController vehiclesColorEditingController =
      TextEditingController();
  TextEditingController vehiclesModelEditingController =
      TextEditingController();
  TextEditingController vehiclesTypeEditingController = TextEditingController();

  SingleValueDropDownController propertyType = SingleValueDropDownController();
  TextEditingController bedRoomsEditingController = TextEditingController();
  TextEditingController bathRoomsEditingController = TextEditingController();
  TextEditingController areaEditingController = TextEditingController();

  TextEditingController mobileModelEditingController = TextEditingController();
  TextEditingController mobileConditionEditingController =
      TextEditingController();
  TextEditingController mobileRamEditingController = TextEditingController();
  TextEditingController mobileStorageEditingController =
      TextEditingController();

  TextEditingController appliancesModelEditingController =
      TextEditingController();
  TextEditingController appliancesConditionEditingController =
      TextEditingController();

  TextEditingController fashionModelEditingController = TextEditingController();
  TextEditingController fashionConditionEditingController =
      TextEditingController();

  TextEditingController petNameEditingController = TextEditingController();
  TextEditingController petAgeEditingController = TextEditingController();

  TextEditingController furnitureTypeEditingController =
      TextEditingController();
  TextEditingController furnitureConditionEditingController =
      TextEditingController();

  final cubit = SellProductCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        bottomNavigationBar: AppButton(
          bgColor: AppColors.primary,
          padding: EdgeInsets.all(10.sp),
          margin: EdgeInsets.all(15.sp),
          borderRadius: BorderRadius.circular(13.sp),
          onPressed: () {
            cubit.sellProduct(
                catId: id,
                vehiclesModel: VehiclesModel(
                  vehiclesNameEditingController.text,
                  vehiclesModelEditingController.text,
                  vehiclesColorEditingController.text,
                  vehiclesTypeEditingController.text,
                ),
                sellBaseModel:
                    SellBaseModel(titleEditingController.text,

                        category, priceEditingController.text,
                        descriptionEditingController.text,
                        cityEditingController.text , []),

            propertyModel: PropertyModel(areaEditingController.text,
                bathRoomsEditingController.text, bedRoomsEditingController.text,
                "" ),


              mobilesModel: MobilesModel(mobileModelEditingController.text,
                  mobileConditionEditingController.text,
                  mobileRamEditingController.text,
                  mobileStorageEditingController.text),

              appliancesModel: AppliancesModel(appliancesModelEditingController.text,
                  appliancesConditionEditingController.text),

              furnitureModel: FurnitureModel(furnitureTypeEditingController.text,
                  furnitureConditionEditingController.text
                  ),

              petsModel: PetsModel(petNameEditingController.text,
                  petAgeEditingController.text),

              fashionModel: FashionModel(fashionModelEditingController.text,
                  fashionConditionEditingController.text)

            );

          },
          label: 'Confirm',
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
                    MainSoldDetailsItem(
                      image: image,
                      priceEditingController: priceEditingController,
                      titleEditingController: titleEditingController,
                      descriptionEditingController: descriptionEditingController,
                      id: id,
                      category: category,
                    ),
                    id == '1' ?
                    VehiclesSellItem(
                      vehiclesNameEditingController: vehiclesNameEditingController,
                      vehiclesColorEditingController: vehiclesColorEditingController,
                      vehiclesModelEditingController: vehiclesModelEditingController,
                      vehiclesTypeEditingController: vehiclesTypeEditingController,
                    )
                        :
                    id == '2' ?
                      PropertySoldItem(
                        type: propertyType,
                        bedRoomsEditingController: bedRoomsEditingController,
                        bathRoomsEditingController: bathRoomsEditingController,
                        areaEditingController: areaEditingController,
                      )
                        :
                        id == "3" ?
                        MobileSellItem(
                          mobileModelEditingController: mobileModelEditingController,
                          mobileConditionEditingController: mobileConditionEditingController,
                          mobileRamEditingController: mobileRamEditingController,
                          mobileStorageEditingController: mobileStorageEditingController,

                        )
                            :
                            id == "4" ?
                            AppliancesFashionSell(
                              modelEditingController: appliancesModelEditingController,
                              conditionEditingController: appliancesConditionEditingController,

                            )

                                :
                                id == "5" ?
                                AppliancesFashionSell(
                                  modelEditingController: fashionModelEditingController,
                                  conditionEditingController: fashionConditionEditingController,

                                )

                                    :
                                    id == "6"?
                                    PetSell(
                                      ageEditingController: petAgeEditingController,
                                      nameEditingController: petNameEditingController,

                                    )
                                        :
                                    AppliancesFashionSell(
                                      modelEditingController:
                                      furnitureTypeEditingController,
                                      conditionEditingController: furnitureConditionEditingController,

                                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
