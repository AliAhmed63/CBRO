class RegisterModel {
  final String email;
  final String password;
  final String name;
  final String phone;
  final String confPass;

  RegisterModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
    required this.confPass,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'passwordConfirm': confPass
    };
  }
}

class UserModel {
  int? status;
  bool? success;
  String? accessToken;

  UserModel({this.status, this.success, this.accessToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];

    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['access_token'] = this.accessToken;
    return data;
  }
}
