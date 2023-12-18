
class MobilesModel{
  String? _modelName;
  String? _condition;
  String? _ram;
  String? _storage;


  MobilesModel(this._modelName, this._condition, this._ram, this._storage);

  String get modelName => _modelName ?? "";

  set modelName(String value) {
    _modelName = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['modelName'] = modelName;
    map['condition'] = condition;
    map['ram'] = ram;
    map['storage'] = storage;
    return map;
  }

  String get condition => _condition ?? '';

  String get storage => _storage ?? '';

  set storage(String value) {
    _storage = value;
  }

  String get ram => _ram ?? "";

  set ram(String value) {
    _ram = value;
  }

  set condition(String value) {
    _condition = value;
  }
}