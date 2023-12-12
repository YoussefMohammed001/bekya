import 'package:bekya/core/utils/safe_print.dart';
import 'package:bekya/features/cities/model/cities_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  CitiesCubit() : super(CitiesInitial());

  List<Cities> cities = [];
  final firestore = FirebaseFirestore.instance;


  void getCities() {
    emit(CitiesLoading());
    firestore.collection("cites").get().then((value) {
      cities.clear();
      for (var document in value.docs) {
        final category = Cities.fromMap(document.data());
        cities.add(category);
        emit(CitiesSuccess());
        print(cities[0].city);
      }
    }).catchError((error) {
      emit(CitiesFailure());
      safePrint(error);
    });
  }

}
