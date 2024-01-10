import 'package:bekya/core/shared/my_shared.dart';
import 'package:bekya/core/shared/my_shared_keys.dart';
import 'package:bekya/core/utils/safe_print.dart';
import 'package:bekya/features/sell_Product/model/appliances_model.dart';
import 'package:bekya/features/sell_Product/model/fashion_mode.dart';
import 'package:bekya/features/sell_Product/model/furniture_model.dart';
import 'package:bekya/features/sell_Product/model/mobiles_model.dart';
import 'package:bekya/features/sell_Product/model/pets_model.dart';
import 'package:bekya/features/sell_Product/model/sell_base_model.dart';
import 'package:bekya/features/sell_Product/model/sell_property.dart';
import 'package:bekya/features/sell_Product/model/vehicles_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
part 'sell_product__state.dart';

class SellProductCubit extends Cubit<SellProductState> {
  SellProductCubit() : super(SellProductInitial());
  final mainFormKey = GlobalKey<FormState>();


  TextEditingController priceEditingController = TextEditingController();

  TextEditingController titleEditingController = TextEditingController();

  TextEditingController descriptionEditingController = TextEditingController();


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

  SingleValueDropDownController mobileRamEditingController = SingleValueDropDownController();
  SingleValueDropDownController location = SingleValueDropDownController();

  SingleValueDropDownController mobileStorageEditingController =
  SingleValueDropDownController();

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




  void sellProduct({required String catId, SellBaseModel? sellBaseModel,
VehiclesModel? vehiclesModel,PropertyModel? propertyModel,
  MobilesModel? mobilesModel,AppliancesModel? appliancesModel,
FashionModel? fashionModel,
  FurnitureModel? furnitureModel,
  PetsModel? petsModel
}){
  emit(SellProductLoading());
  String id = DateTime.now().millisecond.toString();
  FirebaseFirestore.instance.collection("categories").doc(catId).collection(catId).doc(id).set(sellBaseModel!.toJson()).then((value)  {
    FirebaseFirestore.instance.collection("categories").doc(catId).collection(catId).doc(id).update({
      "id":id
    }).then((value) {
      FirebaseFirestore.instance.collection('users').doc(MyShared.getString(key: MySharedKeys.userid)).collection("ads").doc(id).set(sellBaseModel.toJson());
    }).then((value) {
      if(catId == "1"){
        sellVehicles(vehiclesModel: vehiclesModel, id: id);

        FirebaseFirestore.instance.collection('users').doc(MyShared.getString(key: MySharedKeys.userid)).collection("ads").doc(id).update(vehiclesModel!.toJson());
        emit(SellProductSuccess());
      }
      else if(catId == '2'){
        sellProperty(id: id,propertyModel: propertyModel);
        FirebaseFirestore.instance.collection('users').doc(MyShared.getString(key: MySharedKeys.userid)).collection("ads").doc(id).update(propertyModel!.toJson());
emit(SellProductSuccess());

      }
      else if(catId == '3'){
        sellMobile(id: id,mobilesModel: mobilesModel);
      FirebaseFirestore.instance.collection('users').doc(MyShared.getString(key: MySharedKeys.userid)).collection("ads").doc(id).update(mobilesModel!.toJson());
        emit(SellProductSuccess());

      }
      else if(catId == "4"){
        sellAppliances(id: id,appliancesModel: appliancesModel);
        FirebaseFirestore.instance.collection('users').doc(MyShared.getString(key: MySharedKeys.userid)).collection("ads").doc(id).update(appliancesModel!.toJson());

        emit(SellProductSuccess());

      }
      else if(catId == "5"){
        sellFashion(id: id,fashionModel: fashionModel);
        FirebaseFirestore.instance.collection('users').doc(MyShared.getString(key: MySharedKeys.userid)).collection("ads").doc(id).update(fashionModel!.toJson());

        emit(SellProductSuccess());

      }
      else if(catId == "6"){
        sellPet(id: id,petsModel: petsModel);
        FirebaseFirestore.instance.collection('users').doc(MyShared.getString(key: MySharedKeys.userid)).collection("ads").doc(id).update(petsModel!.toJson());

        emit(SellProductSuccess());

      }
      else if(catId == "7"){
sellFurniture(id: id,furnitureModel: furnitureModel);
FirebaseFirestore.instance.collection('users').doc(MyShared.getString(key: MySharedKeys.userid)).collection("ads").doc(id).update(furnitureModel!.toJson());

emit(SellProductSuccess());
      }
      
    });
    safePrint("done");
  }).catchError((error){
    safePrint(error.toString());
  });



}

void sellVehicles({VehiclesModel? vehiclesModel,required String id}){
  FirebaseFirestore.instance.collection("categories").doc("1").collection('1').doc(id).update(vehiclesModel!.toJson()).then((value) {
  });
}

void sellProperty({PropertyModel? propertyModel,required String id}){
  FirebaseFirestore.instance.collection("categories").doc("2").collection('2').doc(id).update(propertyModel!.toJson()).then((value) {
  });
}

void sellMobile({MobilesModel? mobilesModel,required String id}){
  FirebaseFirestore.instance.collection("categories").doc("3").collection('3')
      .doc(id).update(mobilesModel!.toJson()).then((value) {
  });
}








void sellAppliances({AppliancesModel? appliancesModel,required String id}){
  FirebaseFirestore.instance.collection("categories").doc("4").collection('4')
      .doc(id).update(appliancesModel!.toJson()).then((value) {
  });
}

void sellFashion({FashionModel? fashionModel,required String id}){
  FirebaseFirestore.instance.collection("categories").doc("5").collection('5')
      .doc(id).update(fashionModel!.toJson()).then((value) {
  });
}
void sellPet({PetsModel? petsModel,required String id}){
  FirebaseFirestore.instance.collection("categories").doc("6").collection('6')
      .doc(id).update(petsModel!.toJson()).then((value) {
  });
}
void sellFurniture({FurnitureModel? furnitureModel,required String id}){
  FirebaseFirestore.instance.collection("categories").doc("7").collection('7')
      .doc(id).update(furnitureModel!.toJson()).then((value) {
  });
}

}
