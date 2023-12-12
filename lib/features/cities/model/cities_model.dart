class Cities {
  String? _id;
  String? _city;

  Cities(this._id, this._city,);

  Cities.fromMap(Map<String,dynamic> data){
    _id = data['id'];
    _city = data['city'];
  }






  String get city => _city ?? "";

  set userId(String value) {
    _city = value;
  }

  String get id => _id ?? "";

  set id(String value) {
    _id = value;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'city': city,


    };
  }
}