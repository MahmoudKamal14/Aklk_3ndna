class MealModel {
  late String? name;
  late String? uid;
  late String? image;
  late String? price;
  late String? rate;
  late String? description;
  MealModel({
    this.name,
    this.price,
    this.description,
    this.uid,
    this.image,
    this.rate,
  });

  MealModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    price = json['rate'];
    description = json['description'];
    uid = json['uid'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'rate': rate,
      'uid': uid,
      'image': image,
    };
  }
}
