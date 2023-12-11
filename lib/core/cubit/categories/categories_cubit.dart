import 'package:bekya/core/utils/safe_print.dart';
import 'package:bekya/features/home/manager/home_cubit.dart';
import 'package:bekya/features/home/model/categories_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  List<Categories> cats = [];
  final firestore = FirebaseFirestore.instance;

  void getCat() {
    emit(GetCatLoading());
    firestore.collection("categories").get().then((value) {
      cats.clear();
      for (var document in value.docs) {
        final category = Categories.fromMap(document.data());
        cats.add(category);
        emit(GetCatSuccess());
      }
    }).catchError((error) {
      emit(GetCatFailure());
      safePrint(error);
    });
  }
}
