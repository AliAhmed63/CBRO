import '../../../data/model/color_palette.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/color_palette_repo.dart';

part 'color_palette_state.dart';

class ColorPaletteCubit extends Cubit<ColorPaletteState> {
  final ColorPaletteRepo colorPaletteRepo;
  late List<ColorInfo> colorInfo = [];

  ColorPaletteCubit(this.colorPaletteRepo) : super(ColorPaletteInitial());

  List<ColorInfo> getAllPalette() {
    colorPaletteRepo.getAllPalette().then((colorInfo) {
      emit(ColorPaletteLoaded(colorInfo));
      this.colorInfo = colorInfo;
    });
    return colorInfo;
  }
}
