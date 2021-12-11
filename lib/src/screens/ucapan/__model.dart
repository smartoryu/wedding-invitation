class UcapanModel {
  final String uid;
  final String name;
  final String message;
  final String createdAt;

  UcapanModel({
    required this.uid,
    required this.name,
    required this.message,
    required this.createdAt,
  });

  factory UcapanModel.fromJson(Map<String, dynamic> json) {
    return UcapanModel(
      uid: json["uid"],
      name: json["name"],
      message: json["message"],
      createdAt: json["createdAt"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'message': message,
      'createdAt': createdAt,
    };
  }
}
