import 'package:bekya/core/shared/my_shared.dart';
import 'package:bekya/core/shared/my_shared_keys.dart';
import 'package:bekya/core/utils/safe_print.dart';
import 'package:bekya/features/register/model/register_data.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void register({required RegisterData registerData}){
    emit(RegisterLoading());
    firebaseAuth.createUserWithEmailAndPassword(email: registerData.email, password: registerData.pass).then((value) {
      firestore.collection("users").doc(firebaseAuth.currentUser!.uid).set({
        "id":firebaseAuth.currentUser!.uid,
        "name": registerData.name,
        "email":registerData.email,
        "image":"",
        "phone":registerData.mobile,
      }).then((value) {
        MyShared.putString(key: MySharedKeys.email, value:registerData.email);
        MyShared.putBoolean(key: MySharedKeys.isVerified, value:firebaseAuth.currentUser!.emailVerified);
        MyShared.putString(key: MySharedKeys.userid, value: firebaseAuth.currentUser!.uid);
        MyShared.putString(key: MySharedKeys.username, value:registerData.name);
        MyShared.putString(key: MySharedKeys.email, value: registerData.mobile);
        MyShared.putString(key: MySharedKeys.imageUrl, value: registerData.email);
        firestore.collection("users").doc(firebaseAuth.currentUser!.uid).collection("chats");
        firestore.collection("users").doc(firebaseAuth.currentUser!.uid).collection("favourites");

      });
      emit(RegisterSuccess());
    }).catchError((error){
      safePrint("error============> ${error.toString()}");
      emit(RegisterFailure());
    });
  }

}
