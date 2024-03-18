class Message{
  String? _dateTime;
  String? _senderId;
  String? _receiverId;
  String? _message;
  Message({
    required String message,
    required String dateTime,
    required String receiverId,
    required String senderId,

  }){
      _message = message;
      _dateTime = dateTime;
      _receiverId = receiverId;
      _senderId = senderId;
  }

  String get message => _message ?? "";

  String get receiverId => _receiverId ?? "";

  String get senderId => _senderId ?? "";


  String get dateTime => _dateTime ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['receiverId'] = receiverId;
    map['senderId'] = senderId;
    map['time'] = "${DateTime.now().hour}:${DateTime.now().minute}";
  return map;
  }

  Message.fromMap(Map<String,dynamic> map){


    _message = map['message'];
    _receiverId = map['receiverId'];
    _senderId = map['senderId'];
    _dateTime = map['time'];
  }


}