import 'package:bekya/core/models/product_model.dart';
import 'package:bekya/core/utils/safe_print.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'categories_product_state.dart';
class CategoriesProductCubit extends Cubit<CategoriesProductState> {
  CategoriesProductCubit() : super(CategoriesProductInitial());

List<ProductModel>  productModel= [];
  final firestore = FirebaseFirestore.instance;

  void geProducts({required String id}) {
    emit(CategoriesProductLoading());
    firestore.collection("categories").doc(id).collection(id).snapshots().listen((value) {
      safePrint("message");
      productModel.clear();
      for (var document in value.docs) {
        final category = ProductModel.fromMap(document.data());
         productModel.add(category);
        safePrint(productModel.length);
        emit(CategoriesProductSuccess());
      }
    }).onError((error) {

      emit(CategoriesProductFailure());
      safePrint("===============>$error");

    });
  }
}
