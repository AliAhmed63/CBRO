class ProfileModel {
  String Id;
  String name;
  String slug;
  String email;
  String phone;
  String password;
  String role;
  bool active;
  String createdAt;
  String updatedAt;
  int V;

  ProfileModel({
    required this.Id,
    required this.name,
    required this.slug,
    required this.email,
    required this.phone,
    required this.password,
    required this.role,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      Id: json['data']['_id'],
      name: json['data']['name'],
      slug: json['data']['slug'],
      email: json['data']['email'],
      phone: json['data']['phone'],
      password: json['data']['password'],
      role: json['data']['role'],
      active: json['data']['active'],
      createdAt: json['data']['createdAt'],
      updatedAt: json['data']['updatedAt'],
      V: json['data']['__v'],
    );
  }
}
