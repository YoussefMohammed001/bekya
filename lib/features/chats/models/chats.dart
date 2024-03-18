class Chats {
  String _name = '';
  String _id = '';

  Chats(this._name, this._id);

  String get name => _name;

  String get id => _id;
  Chats.fromMap(Map<String,dynamic> map){
    _name = map['name'];
    _id = map['id'];
  }
}