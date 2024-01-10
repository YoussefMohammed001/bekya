import 'package:bekya/core/models/product_model.dart';
import 'package:bekya/core/utils/safe_print.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
 late ProductModel productModel;
  final firestore = FirebaseFirestore.instance;

  void geProducts({required String id,required String productId}) {
    emit(ProductDetailsLoading());
    firestore.collection("categories").doc(id).collection(id).doc(productId).snapshots().listen((value) {
      safePrint("message");
      productModel = ProductModel.fromMap(value.data()!);
      safePrint(value.data());
      safePrint(value.toString());
      emit(ProductDetailsSuccess());

    }).onError((error) {

      emit(ProductDetailsFailure());
      safePrint("===============>$error");

    });
  }
}
