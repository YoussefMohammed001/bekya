class SellBaseModel{
  String? _title;
  String? _category;
  String? _price;
  String? _description;
  String? _location;
  List<String>? _images;


  SellBaseModel(this._title, this._category, this._price, this._description,
      this._location,this._images);



  List<String> get images => _images ?? [];

  set images(List<String> value) {
    _images = value;
  }

  String get location => _location ?? "";

  set location(String value) {
    _location = value;
  }

  String get description => _description ?? "";

  set description(String value) {
    _description = value;
  }

  String get price => _price ?? "";

  set price(String value) {
    _price = value;
  }

  String get category => _category ?? "";

  set category(String value) {
    _category = value;
  }

  String get title => _title ?? '';

  set title(String value) {
    _title = value;
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['category'] = category;
    map['price'] = price;
    map['description'] = description;
    map['images'] = images;
    map['location'] = location;

    return map;
  }


}