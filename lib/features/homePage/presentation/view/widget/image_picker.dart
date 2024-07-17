import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageHelper {
  static final picker = ImagePicker();

  static Future<File?> pickGallery(BuildContext context) async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    return File(image.path);
  }
}
