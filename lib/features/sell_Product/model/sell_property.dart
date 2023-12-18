
class PropertyModel{
  String? _area;
  String? _numberOfPathRooms;
  String? _numberOfbedRooms;
  String? _type;


  PropertyModel( this._area, this._numberOfPathRooms,
      this._numberOfbedRooms, this._type);


  String get area => _area ?? "";

  set area(String value) {
    _area = value;
  }

  String get numberOfPathRooms => _numberOfPathRooms ?? " ";

  set numberOfPathRooms(String value) {
    _numberOfPathRooms = value;
  }



  String get numberOfbedRooms => _numberOfbedRooms ??"";

  set numberOfbedRooms(String value) {
    _numberOfbedRooms = value;
  }

  String get type => _type ?? '';

  set type(String value) {
    _type = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['area'] = area;
    map['numberOfBedRooms'] = numberOfbedRooms;
    map['numberOfBathRooms'] = numberOfPathRooms;
    return map;
  }


}