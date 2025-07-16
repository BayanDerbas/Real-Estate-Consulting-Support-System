class SenderModel {
  final int? id;
  final String? fullName;
  final String? email;
  final String? password;

  SenderModel({this.id, this.fullName, this.email, this.password});

  factory SenderModel.fromJson(Map<String, dynamic> json) {
    return SenderModel(
      id: json["id"],
      fullName: json["fullName"],
      email: json["email"],
      password: json["password"],
    );
  }
}
