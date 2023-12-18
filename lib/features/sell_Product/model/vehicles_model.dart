
class VehiclesModel{
  String? _name;
  String? _model;

  String? _color;
  String? _type;


  VehiclesModel( this._name, this._model,
      this._color, this._type);


  String get name => _name ?? "";

  set name(String value) {
    _name = value;
  }

  String get model => _model ?? " ";

  set model(String value) {
    _model = value;
  }



  String get color => _color ??"";

  set color(String value) {
    _color = value;
  }

  String get type => _type ?? '';

  set type(String value) {
    _type = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['color'] = color;
    map['model'] = model;
    map['type'] = type;
    return map;
  }


}