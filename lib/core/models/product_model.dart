
class ProductModel{


  String? _title;
  String? _category;
  String? _categoryId;
  String? _price;
  String? _description;
  String? _location;
  String? _date;

  String get date => _date ?? "";

  set date(String value) {
    _date = value;
  }

  String? _userName;
  String? _userId;
  String? _productId;
  String? _userImage;

  String get productId => _productId ?? "";

  String get categoryId => _categoryId ?? '';

  set categoryId(String value) {
    _categoryId = value;
  }

  set productId(String value) {
    _productId = value;
  }

  List<dynamic>? _images;

  ///
  String? _vName;
  String? _vModel;
  String? _vColor;
  String? _vType;

  ///
 String? _aModelName;
 String? _aCondition;

 ///
   String? _fashionModelName;
   String? _fashionCondition;

///
  String? _furnitureType;
  String? _furnitureCondition;


  ///
  String? _mobileModelName;
  String? _mobileCondition;
  String? _mobileRam;
  String? _mobilStorage;

///
  String? _name;
  String? _age;


  String get area => _area ?? "";

  set area(String value) {
    _area = value;
  }

  String? _area;
  String? _numberOfPathRooms;
  String? _numberOfBedRooms;
   String? _propertyType;

  String get title => _title ?? "";

  set title(String value) {
    _title = value;
  }

  String get category => _category  ?? "";

  String get propertyType => _propertyType  ?? "";

  set propertyType(String value) {
    _propertyType = value;
  }

  String get numberOfBedRooms => _numberOfBedRooms  ?? "";

  set numberOfBedRooms(String value) {
    _numberOfBedRooms = value;
  }

  String get numberOfPathRooms => _numberOfPathRooms  ?? "";

  set numberOfPathRooms(String value) {
    _numberOfPathRooms = value;
  }

  String get age => _age  ?? "";

  set age(String value) {
    _age = value;
  }

  String get name => _name  ?? "";

  set name(String value) {
    _name = value;
  }

  String get mobilStorage => _mobilStorage  ?? "";

  set mobilStorage(String value) {
    _mobilStorage = value;
  }

  String get mobileRam => _mobileRam  ?? "";

  set mobileRam(String value) {
    _mobileRam = value;
  }

  String get mobileCondition => _mobileCondition  ?? "";

  set mobileCondition(String value) {
    _mobileCondition = value;
  }

  String get mobileModelName => _mobileModelName  ?? "";

  set mobileModelName(String value) {
    _mobileModelName = value;
  }

  String get furnitureCondition => _furnitureCondition  ?? "";

  set furnitureCondition(String value) {
    _furnitureCondition = value;
  }

  String get furnitureType => _furnitureType  ?? "";

  set furnitureType(String value) {
    _furnitureType = value;
  }

  String get fashionCondition => _fashionCondition ?? "";

  set fashionCondition(String value) {
    _fashionCondition = value;
  }

  String get fashionModelName => _fashionModelName ?? "";

  set fashionModelName(String value) {
    _fashionModelName = value;
  }

  String get aCondition => _aCondition ?? "";

  set aCondition(String value) {
    _aCondition = value;
  }

  String get aModelName => _aModelName ?? "";

  set aModelName(String value) {
    _aModelName = value;
  }

  String get vType => _vType  ?? "";

  set vType(String value) {
    _vType = value;
  }

  String get vColor => _vColor ?? "";

  set vColor(String value) {
    _vColor = value;
  }

  String get vModel => _vModel ?? "";

  set vModel(String value) {
    _vModel = value;
  }

  String get vName => _vName ?? "";

  set vName(String value) {
    _vName = value;
  }

  List<dynamic> get images => _images ?? [];

  set images(List<dynamic> value) {
    _images = value;
  }

  String get userImage => _userImage ?? "";

  set userImage(String value) {
    _userImage = value;
  }

  String get userId => _userId ?? "";

  set userId(String value) {
    _userId = value;
  }

  String get userName => _userName ?? "";

  set userName(String value) {
    _userName = value;
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

  set category(String value) {
    _category = value;
  }
  ProductModel.fromMap(Map<String,dynamic> map){
    _categoryId = map['categoryId'];
    _title = map['title'];
    _category = map['category'];
   _price = map['price'];
  _description =  map['description'];
  _date =  map['date'];
    _images = map['images'];
    _location =map['location'];
   _userName = map['userName'];
   _userId = map['userId'];
   _productId = map['id'];
    _userImage = map['userImage'];
    _aModelName = map['modelName'];
    _aCondition = map['condition'];
    _fashionModelName = map['modelName'];
   _fashionCondition = map['condition'];
    _furnitureType =  map['type'];
 _fashionCondition =   map['condition'];
  _mobileModelName =  map['modelName'] ;
   _mobileCondition = map['condition'] ;
   _mobileRam  = map['ram'];
   _mobilStorage = map['storage'];
  _name =  map['name'];
    _age = map['age'];
   _propertyType = map['type'];
    _area =map['area'];
    _numberOfBedRooms = map['numberOfBedRooms'] ;
 _numberOfPathRooms = map['numberOfBathRooms'];


    _vName = map['name'] ;
  _vColor =  map['color'];
   _vModel= map['model'] ;
   _vType = map['type'] ;
  }


  ProductModel(
      this._productId,
      this._area,
      this._title,
      this._category,
      this._categoryId,
      this._price,
      this._date,
      this._description,
      this._location,
      this._userName,
      this._userId,
      this._userImage,
      this._images,
      this._vName,
      this._vModel,
      this._vColor,
      this._vType,
      this._aModelName,
      this._aCondition,
      this._fashionModelName,
      this._fashionCondition,
      this._furnitureType,
      this._furnitureCondition,
      this._mobileModelName,
      this._mobileCondition,
      this._mobileRam,
      this._mobilStorage,
      this._name,
      this._age,
      this._numberOfPathRooms,
      this._numberOfBedRooms,
      this._propertyType){
    _title =title;
  }
}