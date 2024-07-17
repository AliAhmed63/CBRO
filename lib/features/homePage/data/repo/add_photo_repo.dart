import '../wep_service/add_photo_wep_service.dart';
import 'package:flutter/foundation.dart';
import '../model/add_photo_model.dart';

class AddPhotoRepo {
  final AddPhotoWepService addPhotoWepService;

  AddPhotoRepo(this.addPhotoWepService);

  Future<AddPhotoResponse> addPhoto(AddPhotoModel userEntity) async {
    try {
      debugPrint("Add photo request: ${userEntity.image.path}");
      final response = await addPhotoWepService.addPhoto(userEntity);
      debugPrint("Add photo response: $response");
      return AddPhotoResponse.fromJson(response);
    } catch (e) {
      debugPrint("Add photo error: $e");
      throw e;
    }
  }
}
