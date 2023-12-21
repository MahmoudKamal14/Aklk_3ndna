class MealModel {
  late String? name;
  late bool? isLiked;
  late String? photo;
  late String? price;
  late String? rate;
  late String? description;
  MealModel({
    this.name,
    this.price,
    this.description,
    this.isLiked,
    this.photo,
    this.rate,
  });

  MealModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    rate = json['rate'];
    description = json['description'];
    isLiked = json['isLiked'];
    photo = json['photo'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'rate': rate,
      'isLiked': isLiked,
      'photo': photo,
    };
  }
}
