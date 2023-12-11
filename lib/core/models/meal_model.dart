class MealModel {
  late String? name;
  late String? uid;
  late String? photo;
  late String? price;
  late String? rate;
  late String? description;
  MealModel({
    this.name,
    this.price,
    this.description,
    this.uid,
    this.photo,
    this.rate,
  });

  MealModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    rate = json['rate'];
    description = json['description'];
    uid = json['uid'];
    photo = json['photo'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'rate': rate,
      'uid': uid,
      'photo': photo,
    };
  }
}
