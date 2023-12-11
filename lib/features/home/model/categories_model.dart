class Categories {
  String? _id;
  String? _category;
  String? _image;

  Categories(this._id, this._image,);

  Categories.fromMap(Map<String,dynamic> data){
    _id = data['id'];
    _category = data['category'];
    _image = data['image'];
  }




  String get image => _image ?? "";

  set image(String value) {
    _image = value;
  }

  String get category => _category ?? "";

  set userId(String value) {
    _category = value;
  }

  String get id => _id ?? "";

  set id(String value) {
    _id = value;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'image': image,

    };
  }
}