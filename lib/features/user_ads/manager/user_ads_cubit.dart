import 'package:bekya/core/models/product_model.dart';
import 'package:bekya/core/utils/safe_print.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'user_ads_state.dart';

class UserAdsCubit extends Cubit<UserAdsState> {
  UserAdsCubit() : super(UserAdsInitial());
  List<ProductModel>  productModel= [];
  final firestore = FirebaseFirestore.instance;

  void geProducts({required String id}) {
    emit(UserAdsLoading());
    firestore.collection("users").doc(id).collection("ads").snapshots().listen((value) {
      safePrint("message");
      productModel.clear();
      for (var document in value.docs) {
        final category = ProductModel.fromMap(document.data());
        productModel.add(category);
        safePrint(productModel.length);
        emit(UserAdsSuccess());
      }
    }).onError((error) {

      emit(UserAdsFailure());
      safePrint("===============>$error");

    });
  }
}
