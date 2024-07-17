class clothe {
  final int results;
  final int page;
  final List<ClothesData> data;

  clothe({
    required this.results,
    required this.page,
    required this.data,
  });

  factory clothe.fromJson(Map<String, dynamic> json) {
    return clothe(
      results: json['results'],
      page: json['page'],
      data: List.from(
        (json['data'] as List).map(
          (e) => ClothesData.fromJson(e),
        ),
      ),
    );
  }
}

class ClothesData {
  final String Id;
  final String url;
  final String listType;
  final List<String> outputData;
  final List<String> photoPath;

  ClothesData({
    required this.Id,
    required this.url,
    required this.listType,
    required this.outputData,
    required this.photoPath,
  });

  factory ClothesData.fromJson(Map<String, dynamic> json) {
    return ClothesData(
      Id: json['_id'],
      url: json['url'],
      listType: json['listType'],
      outputData: json['outputData'].cast<String>(),
      photoPath: json['photoPath'].cast<String>(),
    );
  }
}
