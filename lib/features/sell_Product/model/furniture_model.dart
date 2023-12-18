
class FurnitureModel{
  String? _type;
  String? _condition;


  FurnitureModel(this._type, this._condition);

  String get modelName => _type ?? "";

  set modelName(String value) {
    _type = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = modelName;
    map['condition'] = condition;
    return map;
  }

  String get condition => _condition ?? '';





  set condition(String value) {
    _condition = value;
  }
}