import 'package:bekya/core/shared/my_shared.dart';
import 'package:bekya/core/shared/my_shared_keys.dart';
import 'package:bekya/features/chats/models/chats.dart';
import 'package:bekya/features/chats/models/message.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatsInitial());
  List<Message> messages = [];
  List<Chats> chats = [];
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  TextEditingController messageController = TextEditingController();
  sendMessage({required String receiverId,required String senderName}) {
    Message message = Message(
        message: messageController.text,
        dateTime: "${DateTime.now().hour}:${DateTime.now().minute}",
        receiverId: receiverId,
        senderId: MyShared.getString(key: MySharedKeys.userid));


    firebase
        .collection("users")
        .doc(MyShared.getString(key: MySharedKeys.userid))
        .collection("chats")
        .doc(receiverId).set({
      "name": senderName,
      "id":receiverId


    }).then((value) {
      firebase

          .collection("users")
          .doc(MyShared.getString(key: MySharedKeys.userid))
          .collection("chats")
          .doc(receiverId).collection(receiverId)
          .add(message.toJson())
          .then((value) {
      firebase
          .collection("users")
          .doc(receiverId)
          .collection("chats")
          .doc(MyShared.getString(key: MySharedKeys.userid))
          .set({
        "name": MyShared.getString(key: MySharedKeys.username),
        "id":MyShared.getString(key: MySharedKeys.userid)
      }).then((value) {


        firebase
            .collection("users")
            .doc(receiverId)
            .collection("chats")
            .doc(MyShared.getString(key: MySharedKeys.userid))
            .collection(MyShared.getString(key: MySharedKeys.userid))
            .add(message.toJson()).then((value) {
          messageController.clear();
          getChat(chatId: receiverId);

        });


      });

      });
    });

  }
  getChat({required String chatId}){

    firebase.collection("users").doc(MyShared.getString(key: MySharedKeys.userid))
    .collection("chats").doc(chatId).collection(chatId).snapshots().listen((value) {
      messages.clear();
      for(var doc in value.docs){
        final message = Message.fromMap(doc.data());
        messages.add(message);


      }









    });


  }


  getChats(){
    firebase.collection("users").doc(MyShared.getString(key: MySharedKeys.userid)).
    collection('chats').get().then((value) {
      chats.clear();
      for(var doc in value.docs) {
        final chat = Chats.fromMap(doc.data());
        chats.add(chat);
      }
    });
  }
}
