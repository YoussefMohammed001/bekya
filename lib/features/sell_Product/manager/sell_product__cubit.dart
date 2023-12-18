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
part 'sell_product__state.dart';

class SellProductCubit extends Cubit<SellProductState> {
  SellProductCubit() : super(SellProductInitial());

void sellProduct({required String catId, SellBaseModel? sellBaseModel,
VehiclesModel? vehiclesModel,PropertyModel? propertyModel,
  MobilesModel? mobilesModel,AppliancesModel? appliancesModel,
FashionModel? fashionModel,
  FurnitureModel? furnitureModel,
  PetsModel? petsModel
}){
  String id = DateTime.now().millisecond.toString();
  FirebaseFirestore.instance.collection("categories").doc(catId).collection(catId).doc(id).set(sellBaseModel!.toJson()).then((value)  {
    FirebaseFirestore.instance.collection("categories").doc(catId).collection(catId).doc(id).update({
      "id":id
    }).then((value) {
      if(catId == "1"){
        sellVehicles(vehiclesModel: vehiclesModel, id: id);
      }
      else if(catId == '2'){
sellProperty(id: id,propertyModel: propertyModel);
      }
      else if(catId == '3'){
        sellMobile(id: id,mobilesModel: mobilesModel);

      }
      else if(catId == "4"){
        sellAppliances(id: id,appliancesModel: appliancesModel);

      }
      else if(catId == "5"){
        sellFashion(id: id,fashionModel: fashionModel);
      }
      else if(catId == "6"){
        sellPet(id: id,petsModel: petsModel);
      }
      else if(catId == "7"){
sellFurniture(id: id,furnitureModel: furnitureModel);
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
