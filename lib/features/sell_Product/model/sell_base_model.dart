class SellBaseModel{
  String? _title;
  String? _category;
  String? _date;
  String? _categoryId;
  String? _price;
  String? _description;
  String? _location;
  String? _userName;
  String? _userId;
  String? _userImage;
  List<String>? _images;


  String get date => _date ?? "";

  set date(String value) {
    _date = value;
  }

  SellBaseModel(this._title, this._category, this._price, this._description,
      this._location,this._images,this._userId,this._userName,this._userImage,this._categoryId,this._date);


  String get categoryId => _categoryId ?? "";

  set categoryId(String value) {
    _categoryId = value;
  }

  String get userName => _userName ?? "";

  set userName(String value) {
    _userName = value;
  }

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
    map['userName'] = userName;
    map['userId'] = userId;
    map['userImage'] = userImage;
    map['categoryId'] = categoryId;
    map['date'] = date;


    return map;
  }

  String get userId => _userId ?? "";

  set userId(String value) {
    _userId = value;
  }

  String get userImage => _userImage ??" ";

  set userImage(String value) {
    _userImage = value;
  }
}