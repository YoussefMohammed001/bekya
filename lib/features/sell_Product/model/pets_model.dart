
class PetsModel{
  String? _name;
  String? _age;


  PetsModel(this._name, this._age);

  String get name => _name ?? "";

  set name(String value) {
    _name = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['age'] = age;
    return map;
  }

  String get age => _age ?? '';





  set age(String value) {
    _age = value;
  }
}