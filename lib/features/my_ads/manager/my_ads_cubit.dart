import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'my_ads_state.dart';

class MyAdsCubit extends Cubit<MyAdsState> {
  MyAdsCubit() : super(MyAdsInitial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;



}


