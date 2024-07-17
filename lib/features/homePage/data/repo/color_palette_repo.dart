import '../model/color_palette.dart';
import '../wep_service/color_wep_service.dart';

class ColorPaletteRepo {
  final ColorWebServices colorWebServices;

  ColorPaletteRepo(this.colorWebServices);

  Future<List<ColorInfo>> getAllPalette() async {
    final colorInfo = await colorWebServices.getAllPalette();

    return colorInfo
        .map((colorInfo) => ColorInfo.fromJson(colorInfo))
        .toList();
  }
}
