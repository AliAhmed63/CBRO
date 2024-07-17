class OutFitModel {
  List<String> bottom;
  List<String> shoes;
  List<String> top;

  OutFitModel({
    required this.bottom,
    required this.shoes,
    required this.top,
  });

  factory OutFitModel.fromJson(Map<String, dynamic> json) {
    return OutFitModel(
        bottom: json['bottom'].cast<String>(),
        shoes: json['shoes'].cast<String>(),
        top: json['top'].cast<String>());
  }
}
