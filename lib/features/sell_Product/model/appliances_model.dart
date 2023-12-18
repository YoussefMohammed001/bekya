
class AppliancesModel{
  String? _modelName;
  String? _condition;


  AppliancesModel(this._modelName, this._condition);

  String get modelName => _modelName ?? "";

  set modelName(String value) {
    _modelName = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['modelName'] = modelName;
    map['condition'] = condition;
    return map;
  }

  String get condition => _condition ?? '';





  set condition(String value) {
    _condition = value;
  }
}