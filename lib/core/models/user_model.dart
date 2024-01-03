class UserModel {
  late final String userName;
  late final String email;
  late final String phone;
  late final String image;

  UserModel({
    required this.userName,
    required this.email,
    required this.phone,
    required this.image,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'phone': phone,
      'image': image,
    };
  }
}
