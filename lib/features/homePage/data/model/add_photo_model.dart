import 'dart:io';

class AddPhotoModel {
  final File image;

  AddPhotoModel({
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'image': image,
    };
  }
}

class AddPhotoResponse {
  final String url;
  final String listType;
  final List<String> outputData;
  final List<String> photoPath;
  final String user;
  final String id;
  final String createdAt;
  final String updatedAt;
  final int v;

  AddPhotoResponse({
    required this.url,
    required this.listType,
    required this.outputData,
    required this.photoPath,
    required this.user,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory AddPhotoResponse.fromJson(Map<String, dynamic> json) {
    return AddPhotoResponse(
      url: json['data']['url'],
      listType: json['data']['listType'],
      outputData: List<String>.from(json['data']['outputData']),
      photoPath: List<String>.from(json['data']['photoPath']),
      user: json['data']['user'],
      id: json['data']['_id'],
      createdAt: json['data']['createdAt'],
      updatedAt: json['data']['updatedAt'],
      v: json['data']['__v'],
    );
  }
}
