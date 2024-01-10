import 'package:bekya/core/shared/my_shared.dart';
import 'package:bekya/core/shared/my_shared_keys.dart';
import 'package:bekya/core/utils/safe_print.dart';
import 'package:bekya/features/login/model/login_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  login({required LoginModel loginModel}){
    emit(LoginLoading());
    firebaseAuth.signInWithEmailAndPassword(email: loginModel.email, password:loginModel.pass ).then((value) {
     firestore.collection("users").doc(firebaseAuth.currentUser!.uid).get().then((value) {
     MyShared.putString(key: MySharedKeys.email, value: value.get('email'));
     MyShared.putString(key: MySharedKeys.userid, value: value.get('id'));
     MyShared.putString(key: MySharedKeys.username, value: value.get('name'));
     MyShared.putString(key: MySharedKeys.email, value: value.get('phone'));
     MyShared.putString(key: MySharedKeys.imageUrl, value: value.get('image'));
     MyShared.putBoolean(key: MySharedKeys.isVerified, value:firebaseAuth.currentUser!.emailVerified);

     });
      emit(LoginSuccess());
    }).catchError((error){
      emit(LoginFailure(error.toString()));
safePrint(error.toString());
    });
    
    
  }
}
