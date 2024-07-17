class LogModel {
  final String email;
  final String password;

  LogModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class Login {
  final Data data;

  Login({required this.data});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(data: Data.fromJson(json['data']));
  }
}

class Data {
  final String sId;
  final String name;
  final String slug;
  final String email;
  final String phone;
  final String role;
  final bool active;
  final String createdAt;
  final String updatedAt;
  final int iV;

  Data(
      {required this.sId,
      required this.name,
      required this.slug,
      required this.email,
      required this.phone,
      required this.role,
      required this.active,
      required this.createdAt,
      required this.updatedAt,
      required this.iV});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      sId: json['_id'],
      name: json['name'],
      slug: json['slug'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      active: json['active'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
    );
  }
}
