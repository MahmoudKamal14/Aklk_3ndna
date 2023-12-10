class UserModel {
  late final String name;
  late final String email;
  late final String phone;
  late final String image;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
    };
  }
}
