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
    firebaseAuth.createUserWithEmailAndPassword(email: registerData.email, password: registerData.pass).then((value) {
      firestore.collection("users").doc(firebaseAuth.currentUser!.uid).set({
        "id":firebaseAuth.currentUser!.uid,
        "name": registerData.name,
        "email":registerData.email,
        "image":"",
        "phone":registerData.mobile,
      }).then((value) {
        firestore.collection("users").doc(firebaseAuth.currentUser!.uid).collection("chats");
        firestore.collection("users").doc(firebaseAuth.currentUser!.uid).collection("favourites");
      });

    }).catchError((error){

    });
  }

}
