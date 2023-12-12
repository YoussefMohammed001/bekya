import 'package:bekya/core/utils/safe_print.dart';
import 'package:bekya/features/home/model/categories_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Categories> cats = [];
  final firestore = FirebaseFirestore.instance;

  void getCat() {
    emit(HomeGetCatLoading());
    firestore.collection("categories").get().then((value) {
      cats.clear();
      for (var document in value.docs) {
        final category = Categories.fromMap(document.data());
        cats.add(category);
        emit(HomeGetCatSuccess());
      }
    }).catchError((error) {
      emit(HomeGetCatFailure());
      safePrint(error);
    });
  }
}
